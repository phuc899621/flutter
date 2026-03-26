import ResetPassServices from "./reset.pass.services.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import db from "../../config/db.js";
import {
  AuthenticationError,
  AuthorizationError,
  BadRequestError,
  BaseError,
  ConflictError,
  NotFoundError,
  ServerError,
} from "../../utils/error.js";
import logger from "../../utils/logger.js";
import EmailServices from "../email/email.service.js";
import VerificationService from "../verification/verification.service.js";
import UserService from "../user/user.service.js";
import {
  generateAccessToken,
  generateRefreshToken,
  verifyRefreshToken,
} from "../../utils/token.js";
import {
  isRefreshTokenValid,
  revokeRefreshToken,
  saveRefreshToken,
} from "../../utils/redis.service.js";
class AuthService {
  //#region signup flow
  static async signup(data) {
    const { email, password } = data;
    const session = await db.startSession();
    session.startTransaction();
    try {
      //check user exists and verified
      await UserService.validateEmailForSignup(email);
      logger.info(`User ${email} exists`);
      //hash password
      const hashPassword = await AuthService.hashPassword(password);
      const name = email.split("@")[0];

      const userId = await UserService.createOrUpdateUser(
        { email, password: hashPassword, name },
        session,
      );
      logger.info(`User ${userId} created`);

      const otp = await VerificationService.createOrUpdateSignupOTP(
        userId,
        session,
      );
      logger.info(`OTP is: ${otp}. This OTP only last 30 minutes.`);
      EmailServices.sendEmail(
        email,
        "Activate taskit account",
        `Your OTP is: ${otp}. This OTP only last 30 minutes.`,
      );
      logger.info(`Email sent to ${email}`);
      await session.commitTransaction();
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Signup error: ${e}`);
    } finally {
      await session.endSession();
    }
  }
  static async verifySignup(email, otp) {
    const session = await db.startSession();
    session.startTransaction();
    try {
      const userDoc = await UserService.findUserByEmail(email, session);
      if (!userDoc) throw new NotFoundError("Account not found");
      await VerificationService.verifySignupOTP(userDoc.id, otp);
      await UserService.activateAccount(userDoc.id, session);
      logger.info(`Account activated for ${userDoc.email}`);
      await VerificationService.deleteSignupOTP(userDoc.id, session);
      await session.commitTransaction();
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Verify signup error : ${e.message}`);
    } finally {
      await session.endSession();
    }
  }
  static async resendSignupOtp(email) {
    const session = await db.startSession();
    session.startTransaction();
    try {
      const userDoc = await UserService.validateUserForResendOTP(email);
      const otp = await VerificationService.createOrUpdateSignupOTP(
        userDoc.id,
        session,
      );
      EmailServices.sendEmail(
        email,
        "Verify email for Taskit account",
        `Your OTP is: ${otp}. This OTP only last 30 minutes.`,
      );
      logger.info(`OTP is: ${otp}. This OTP only last 30 minutes.`);
      await session.commitTransaction();
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Resend signup otp error: ${e.message}`);
    } finally {
      await session.endSession();
    }
  }
  //#endregion

  //#region login flow

  static async login(email, password) {
    try {
      const userDoc = await UserService.validateUserForLogin(email, password);
      const accessToken = generateAccessToken(userDoc);
      const refreshToken = generateRefreshToken(userDoc);
      await saveRefreshToken(refreshToken, userDoc.id);
      logger.info(`Login success for ${userDoc.email}`);
      logger.info(`Access token: ${accessToken}`);
      logger.info(`Refresh token: ${refreshToken}`);
      return {
        accessToken,
        refreshToken,
      };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Login error: ${e.message}`);
    }
  }
  static async refreshToken(refreshToken) {
    try {
      const userId = await isRefreshTokenValid(refreshToken);
      if (!userId) throw new AuthorizationError("Invalid refresh token");
      verifyRefreshToken(refreshToken);
      const accessToken = generateAccessToken(userId);
      return { accessToken };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Refresh token error: ${e.message}`);
    }
  }
  static async logout(refreshToken) {
    try {
      await revokeRefreshToken(refreshToken);
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Logout error: ${e.message}`);
    }
  }
  //#endregion
  //#region forgot password flow
  static async forgotPassword(request) {
    const session = await db.startSession();
    session.startTransaction();
    const { email } = request;
    try {
      const user = await UserServices.findByEmail(email);
      if (!user) throw new ServerError("User not found", 404);

      const userDoc = user.toObject();
      const otp = VerificationServices.generateOTP();
      if (await VerificationServices.isResetRequested(userDoc.id, session)) {
        await VerificationServices.updateReset(userDoc.id, otp, session);
      } else {
        await VerificationServices.createReset(userDoc.id, otp, session);
      }
      await EmailServices.sendEmail(
        email,
        "Reset password for Taskit account",
        `Your OTP is: ${otp}. This OTP only last 15 minutes.`,
      );
      await session.commitTransaction();
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(
        `Verify email for forgot password error: ${e.message}`,
        500,
      );
    } finally {
      await session.endSession();
    }
  }
  static async forgotPasswordVerify(request) {
    const session = await db.startSession();
    session.startTransaction();
    const { email, otp } = request;
    try {
      const user = await UserServices.findByEmail(email, session);
      if (!user) throw new ServerError("User not found", 404);

      const userDoc = user.toObject();
      const verObj = await VerificationServices.getVerification({
        userId: userDoc.id,
        type: "reset",
      });
      if (!verObj) throw new ServerError("Otp has expired", 400);
      if (!(await bcrypt.compare(otp, verObj.otp))) {
        throw new ServerError("Invalid otp", 400);
      }

      await VerificationServices.deleteReset(userDoc.id, session);

      const resetToken = ResetPassServices.generateResetToken();

      if (await ResetPassServices.findByEmail(email, session)) {
        await ResetPassServices.update(email, resetToken, session);
      } else {
        await ResetPassServices.create(email, resetToken, session);
      }

      await session.commitTransaction();
      return resetToken;
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Forgot password error: ${e.message}`, 500);
    } finally {
      await session.endSession();
    }
  }
  static async resetPassword(resetToken, request) {
    const { email, password } = request;
    try {
      const user = await UserServices.findByEmail(email);
      if (!user) throw new ServerError("User not found", 404);

      const otpObj = await ResetPassServices.findByEmail(email);
      if (!otpObj) throw new ServerError("Invalid reset token", 400);

      console.log(otpObj.resetToken, resetToken);
      if (otpObj.resetToken !== resetToken) {
        throw new ServerError("Invalid reset token", 400);
      }

      const salt = await bcrypt.genSalt(10);
      user.password = await bcrypt.hash(password, salt);
      await user.save();
      await ResetPassServices.deleteByEmail(email);
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Reset password error: ${e.message}`, 500);
    }
  }
  static async login_verify(token) {
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET || "899621");
      const user = await this.findByEmail(decoded.email);
      if (!user) throw new NotFoundError("User not found", 404);
      return {
        _id: user._id,
        name: user.name,
        email: user.email,
        avatar: user.avatar,
      };
    } catch (e) {
      throw new ServerError(`Login verification error: ${e.message}`, 500);
    }
  }
  static async hashPassword(password) {
    const salt = await bcrypt.genSalt(10);
    return await bcrypt.hash(password, salt);
  }
}

export default AuthService;

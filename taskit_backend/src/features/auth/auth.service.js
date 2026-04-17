import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import db from "../../shared/utils/db.js";
import {
  AuthenticationError,
  AuthorizationError,
  BadRequestError,
  BaseError,
  ConflictError,
  NotFoundError,
  ServerError,
} from "../../shared/utils/error.js";
import logger from "../../shared/utils/logger.js";
import EmailServices from "../../shared/services/email.service.js";
import VerificationService from "../verification/verification.service.js";
import UserService from "../user/user.service.js";
import {
  generateAccessToken,
  generateForgotPasswordToken,
  generateRefreshToken,
  markForgotPasswordTokenAsUsed,
  verifyForgotPasswordToken,
  verifyRefreshToken,
} from "../../shared/services/token.service.js";
import {
  isRefreshTokenValid,
  revokeRefreshToken,
  saveRefreshToken,
} from "../../shared/services/redis.service.js";
import { verifyGoogleToken } from "../../shared/services/auth.google.service.js";
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
      const name = email.split("@")[0];
      const userId = await UserService.createOrUpdateUser(
        { email, password, name },
        session,
      );
      logger.info(`User ${userId} created`);

      const otp = await VerificationService.createSignupOTP(userId, session);
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
      const otp = await VerificationService.createSignupOTP(
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
  static async loginWithGoogle(token) {
    try {
      const payload = await verifyGoogleToken(token);
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Login with google error: ${e.message}`);
    }
  }
  //#endregion
  //#region forgot password flow
  static async forgotPassword(request) {
    const session = await db.startSession();
    session.startTransaction();
    const { email } = request;
    try {
      const userDoc = await UserService.validateUserForForgotPassword(email);
      const otp = await VerificationService.createForgotPasswordOTP(
        userDoc.id,
        session,
      );
      EmailServices.sendEmail(
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
      const userDoc = await UserService.validateUserForForgotPassword(email);
      await VerificationService.verifyForgotPasswordOTP(userDoc.id, otp);

      await VerificationService.deleteForgotPasswordOTP(userDoc.id, session);
      const resetToken = generateForgotPasswordToken(userDoc);
      await session.commitTransaction();
      return {
        resetToken,
      };
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Forgot password verify error: ${e.message}`);
    } finally {
      await session.endSession();
    }
  }
  static async resetPassword(request) {
    const { password, resetToken } = request;
    try {
      const { userId } = await verifyForgotPasswordToken(resetToken);
      logger.info(`Reset password for ${userId}`);
      await UserService.updateUserPassword(userId, password);
      markForgotPasswordTokenAsUsed(resetToken, userId);
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
}

export default AuthService;

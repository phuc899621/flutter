import ResetPassServices from "./reset.pass.services.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import db from "../../config/db.js";
import UserServices from "../user/user.services.js";
import VerificationServices from "./verification.services.js";
import EmailServices from "../../utils/emailService.js";
import {
  BadRequestError,
  BaseError,
  ConflictError,
  NotFoundError,
  ServerError,
} from "../../utils/error.js";
import logger from "../../utils/logger.js";
class AuthService {
  //#region signup flow
  static async signup(data) {
    const { email, password } = data;
    const session = await db.startSession();
    session.startTransaction();
    try {
      //check user exists and verified
      await UserServices.validateEmailForSignup(email);
      //hash password
      const hashPassword = await AuthService.hashPassword(password);
      const name = email.split("@")[0];

      const userId = await UserServices.upsertUser(
        { email, password: hashPassword, name },
        session,
      );

      const otp = await VerificationServices.upsertSignupOTP(userId, session);
      logger.info(`OTP is: ${otp}. This OTP only last 30 minutes.`);
      //   await EmailServices.sendEmail(
      //     email,
      //     "Verify email for create Taskit account",
      //     `Your OTP is: ${otp}. This OTP only last 30 minutes.`,
      //   );

      await session.commitTransaction();
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      console.log(e);
      throw new ServerError(`Sign up error: ${e.message}`);
    } finally {
      await session.endSession();
    }
  }
  static async verifySignup(userId, otp) {
    const session = await db.startSession();
    session.startTransaction();
    try {
      const verObj = await VerificationServices.getVerification({
        userId,
        type: "signup",
      });
      if (!verObj) {
        throw new NotFoundError("User not found");
      }

      if (!(await bcrypt.compare(otp, verObj.otp))) {
        throw new BadRequestError("Wrong or Expired OTP");
      }

      await UserServices.verifyingUser(userId, session);
      await VerificationServices.deleteSignup(userId, session);
      await session.commitTransaction();
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Verify sign up error`, e.message);
    } finally {
      await session.endSession();
    }
  }
  static async resendSignupOtp(userId) {
    const session = await db.startSession();
    session.startTransaction();
    try {
      const user = (await UserServices.findById(userId)).toObject();
      if (!user) {
        throw new NotFoundError("User account not found");
      }
      if (await UserServices.isVerifiedUser({ email: user.email })) {
        throw new ConflictError("User account already verified");
      }
      const userDoc = user.toObject();

      const otp = VerificationServices.generateOTP();

      if (await VerificationServices.isSignupRequested(userDoc.id)) {
        await VerificationServices.updateSignup(userDoc.id, otp, session);
      } else {
        await VerificationServices.createSignup(userDoc.id, otp, session);
      }

      await EmailServices.sendEmail(
        verObj.email,
        "Verify email for Taskit account",
        `Your OTP is: ${otp}. This OTP only last 30 minutes.`,
      );
      await session.commitTransaction();
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Sign up error`, e.message);
    } finally {
      await session.endSession();
    }
  }
  //#endregion

  //#region login flow

  static async login(request) {
    try {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      const query = emailRegex.test(request.identifier)
        ? { email: request.identifier }
        : { username: request.identifier };
      const userDoc = await UserServices.findOne(query);

      if (!userDoc) throw new ServerError("Account not found", 404);
      if (!userDoc.isVerified)
        throw new ServerError("Account not verified", 401);

      const isPasswordMatch = bcrypt.compare(
        request.password,
        userDoc.password,
      );
      if (!isPasswordMatch) throw new ServerError("Invalid password", 401);

      const accessToken = jwt.sign(
        { id: userDoc._id, email: userDoc.email, username: userDoc.username },
        process.env.JWT_SECRET || "899621",
        { expiresIn: "1d" },
      );
      const refreshToken = jwt.sign(
        { id: userDoc._id, email: userDoc.email, username: userDoc.username },
        process.env.JWT_SECRET || "899621",
        { expiresIn: "7d" },
      );
      const expiresIn = 60 * 60 * 24;
      const expiresAt = Date.now() + expiresIn * 1000;
      return {
        accessToken,
        refreshToken,
        expiresAt,
      };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Login error: ${e.message}`, 500);
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

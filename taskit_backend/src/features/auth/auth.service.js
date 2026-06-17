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
  generateSessionId,
  markForgotPasswordTokenAsUsed,
  verifyForgotPasswordToken,
  verifyRefreshToken,
} from "../../shared/services/token.service.js";
import {
  isRefreshTokenValid,
  revokeRefreshToken,
  saveRefreshToken,
} from "../../shared/services/redis.service.js";
import GoogleService from "../../shared/services/auth.google.service.js";
import { GOOGLE_AUTH_CASE } from "../../shared/constants/googleAuthCase.js";
import ImageService from "../../shared/services/image.service.js";
class AuthService {
  //#region signup flow
  static async signup(data) {
    const { email, password } = data;
    const session = await db.startSession();
    session.startTransaction();
    try {
      //check user exists and verified
      const user = await UserService.findUserByEmail(email, session);
      await UserService.ensureUserNotVerified(user);
      const name = email.split("@")[0];
      const userId = user
        ? await UserService.updateUser({ email, password, name }, session)
        : await UserService.createUser({ email, password, name }, session);

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
      const accessToken = generateAccessToken(userDoc.id);
      const refreshToken = generateRefreshToken(userDoc.id);
      console.log(refreshToken);
      const sessionId = generateSessionId();
      await saveRefreshToken(refreshToken, sessionId, userDoc.id);
      return {
        accessToken,
        refreshToken,
        sessionId,
      };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Login error: ${e.message}`);
    }
  }
  static async fetchCurrentUser(userId) {
    try {
      const userDoc = await UserService.findById(userId);
      console.log(userDoc);
      return userDoc.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Fetch current user error: ${e.message}`);
    }
  }
  static async refreshToken(refreshToken, sessionId) {
    try {
      const userId = await isRefreshTokenValid(refreshToken, sessionId);
      console.log(`User id: ${userId}`);

      if (!userId) throw new AuthorizationError("Invalid refresh token");
      verifyRefreshToken(refreshToken);
      const accessToken = generateAccessToken(userId);
      return { accessToken };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Refresh token error: ${e.message}`);
    }
  }
  static async logout(refreshToken, sessionId) {
    try {
      await revokeRefreshToken(refreshToken, sessionId);
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Logout error: ${e.message}`);
    }
  }
  static async handleTokenReturn(userId) {
    const accessToken = generateAccessToken(userId);
    const refreshToken = generateRefreshToken(userId);
    console.log(refreshToken);
    const sessionId = generateSessionId();
    await saveRefreshToken(refreshToken, sessionId, userId);
    return {
      accessToken,
      refreshToken,
      sessionId,
    };
  }

  static async loginWithGoogle(token) {
    const session = await db.startSession();
    session.startTransaction();
    try {
      const payload = await GoogleService.verifyGoogleToken(token);
      const { family_name, given_name, sub, email, picture } = payload;
      const name = payload.family_name + " " + payload.given_name;
      const { status, user } = await UserService.checkGoogleAuthCase({
        email,
        sub,
      });
      let userId = user?.id;
      console.log(status);
      switch (status) {
        case GOOGLE_AUTH_CASE.EXIST_BY_SUB:
          break;
        case GOOGLE_AUTH_CASE.LINKED_BY_EMAIL:
          await UserService.updateUserSub(user.id, sub, session);
          break;
        case GOOGLE_AUTH_CASE.EMAIL_NOT_VERIFIED:
          const avatarUrl = await ImageService.uploadFromUrl(picture);
          await UserService.linkGoogleAccount(
            user.id,
            { name, sub, avatar: avatarUrl },
            session,
          );
          break;
        default:
          const avatarUrl_new = await ImageService.uploadFromUrl(picture);
          userId = await UserService.createGoogleUser(
            { email, sub, avatar: avatarUrl_new, name },
            session,
          );
          break;
      }

      console.log(payload);
      console.log(userId);
      const returnResult = await AuthService.handleTokenReturn(userId);
      await session.commitTransaction();
      return returnResult;
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Login with google error: ${e.message}`);
    } finally {
      session.endSession();
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
  static async resendForgotPasswordOtp(email) {
    const session = await db.startSession();
    session.startTransaction();
    try {
      const userDoc = await UserService.validateUserForResendOTP(email);
      const otp = await VerificationService.createForgotPasswordOTP(
        userDoc.id,
        session,
      );
      EmailServices.sendEmail(
        email,
        "Verify email for forgot password",
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

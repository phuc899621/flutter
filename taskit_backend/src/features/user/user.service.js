import UserModel from "./user.model.js";

import SettingModel from "../setting/setting.model.js";
import SettingServices from "../setting/setting.services.js";
import bcrypt from "bcryptjs";
import CategoryModel from "../category/category.model.js";
import db from "../../shared/utils/db.js";
import OtpEmailServices from "../auth/otp.email.services.js";
import TaskModel from "../task/task.model.js";
import SubtaskModel from "../task/subtask.model.js";
import {
  BadRequestError,
  BaseError,
  ServerError,
} from "../../shared/utils/error.js";
import CategoryServices from "../category/category.services.js";
import logger from "../../shared/utils/logger.js";
import UserRepository from "./user.repo.js";
import { USER_STATUS } from "../../shared/constants/userStatus.js";
import { HashHelper } from "../../shared/helpers/hash.helper.js";
import { GOOGLE_AUTH_CASE } from "../../shared/constants/googleAuthCase.js";

class UserService {
  //#region validate user status
  static ensureUserVerified(user) {
    if (!user || user.status != USER_STATUS.VERIFIED)
      throw new BadRequestError("User account does not exist");
  }
  static ensureUserNotVerified(user) {
    if (user && user.status == USER_STATUS.VERIFIED)
      throw new BadRequestError("This account already exists");
  }
  static async isUserExists(email) {
    const user = await UserRepository.findByEmail(email);
    if (user) return true;
    return false;
  }
  static async validateEmailForSignup(email) {
    try {
      const user = await UserRepository.findByEmail(email);
      logger.info(`User document: ${user}`);
      this.ensureUserNotVerified(user);
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Validate email for signup error: ${e.message}`);
    }
  }
  static async validateUserForLogin(email, password) {
    try {
      const user = await UserRepository.findByEmail(email);
      if (!user) throw new BadRequestError("User account does not exist");
      const userPassword = user.auth?.local?.password;
      if (userPassword == null)
        throw new BadRequestError("Email is already in use");
      this.ensureUserVerified(user);
      if (!(await HashHelper.compare(password, userPassword)))
        throw new BadRequestError("Invalid password");
      return user.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Validate email for login error: ${e.message}`);
    }
  }
  static async checkGoogleAuthCase({ email, sub }) {
    console.log(email, sub);
    const userSub = await UserRepository.findBySub(sub);
    if (userSub)
      return {
        status: GOOGLE_AUTH_CASE.EXIST_BY_SUB,
        user: userSub,
      };
    const userByEmail = await UserRepository.findByEmail(email);
    if (userByEmail) {
      if (userByEmail.status != USER_STATUS.VERIFIED) {
        return {
          status: GOOGLE_AUTH_CASE.EMAIL_NOT_VERIFIED,
          user: userByEmail,
        };
      }
      return {
        status: GOOGLE_AUTH_CASE.LINKED_BY_EMAIL,
        user: userByEmail,
      };
    }

    return {
      status: GOOGLE_AUTH_CASE.NEW_USER,
      user: null,
    };
  }
  static async validateUserForGoogleLogin(email) {
    try {
      const user = await UserRepository.findByEmail(email);
      if (!user) return null;

      if (userPassword == null)
        throw new BadRequestError("Email is already in use");
      this.ensureUserVerified(user);
      if (!(await HashHelper.compare(password, userPassword)))
        throw new BadRequestError("Invalid password");
      return user.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Validate email for login error: ${e.message}`);
    }
  }
  static async validateUserForForgotPassword(email) {
    try {
      const user = await UserRepository.findByEmail(email);
      this.ensureUserVerified(user);
      logger.info(`User document:`, user.toObject());
      return user.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(
        `Validate email for forgot password error: ${e.message}`,
      );
    }
  }
  static async validateUserForResendOTP(email) {
    try {
      const user = await UserRepository.findByEmail(email);
      if (!user) throw new BadRequestError("User account does not exist");
      if (user.status == USER_STATUS.VERIFIED)
        throw new BadRequestError("This account already exists");
      logger.info(`User document: ${user.toObject()}`);
      return user.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(
        `Validate email for resend otp error: ${e.message}`,
      );
    }
  }
  static async findUserByEmail(email, session) {
    const user = await UserRepository.findByEmail(email, {}, session);
    return user?.toObject();
  }
  static findById(id) {
    return UserModel.findById(id);
  }
  static async activateAccount(userId, session = null) {
    await UserRepository.updateById(
      userId,
      { status: USER_STATUS.VERIFIED },
      session,
    );
  }
  static async createOrUpdateUser({ email, password, name }, session = null) {
    try {
      const hashPassword = await HashHelper.hash(password);
      const user = await UserRepository.upsertByEmail(
        { email, name, password: hashPassword, status: USER_STATUS.PENDING },
        session,
      );
      logger.info(`User ${user.id} created`);
      await CategoryServices.createDefaultCategories(user.id, session);
      await SettingServices.createSetting(user.id, session);
      return user.id;
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Create user error: ${e.message}`);
    }
  }
  static async updateUserPassword(userId, password, session) {
    try {
      const hashPassword = await HashHelper.hash(password);
      await UserRepository.updateById(
        userId,
        { password: hashPassword },
        session,
      );
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Reset password error: ${e.message}`);
    }
  }
  static async updateUserSub(userId, sub, session) {
    try {
      const updateData = { "auth.google.sub": sub };
      await UserRepository.updateById(userId, updateData, session);
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Update user sub error: ${e.message}`);
    }
  }
  static async linkGoogleAccount(userId, { name, sub, avatar }, session) {
    try {
      await UserRepository.updateById(
        userId,
        {
          "auth.google.sub": sub,
          "auth.local.password": null,
          name,
          status: USER_STATUS.VERIFIED,
          avatar,
        },
        session,
      );
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Update google user error: ${e.message}`);
    }
  }
  static async createGoogleUser({ email, sub, avatar, name }, session) {
    try {
      const user = await UserRepository.upsertByEmail(
        {
          email,
          name,
          sub,
          avatar,
          status: USER_STATUS.VERIFIED,
        },
        session,
      );
      logger.info(`User ${user.id} created`);
      return user.id;
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Create google user error: ${e.message}`);
    }
  }

  static async update_email(userId, email) {
    try {
      const user = await UserModel.findById(userId);
      if (!user) throw new HttpError("User not found", 404);

      const existingUser = await UserModel.findOne({ email });
      if (existingUser) throw new HttpError("Email already exists", 409);

      const existingOtp = await OtpEmailServices.findByEmail(email);
      if (existingOtp) {
        await OtpEMailServices.deleteByEmail(email);
      }
      const otp = await OtpEmailServices.generateOTP();
      await OtpEmailServices.create(email, otp);
      await OtpEmailServices.sendOTP(email, otp);
    } catch (e) {
      throw new HttpError(`Update email error: ${e.message}`, 500);
    }
  }
  static async update_email_verify(userId, request) {
    try {
      const userOtp = await OtpEmailServices.findByEmail(request.email);
      if (!userOtp) throw new HttpError("Invalid email", 400);

      const checkUser = await UserModel.findById(userId);
      if (!checkUser) throw new HttpError("User not found", 404);

      if (await OtpEmailServices.compareOtp(request.otp, userOtp.otp)) {
        const user = await UserModel.findByIdAndUpdate(
          userId,
          { email: request.email },
          { new: true },
        );
        await OtpEmailServices.deleteByEmail(request.email);
        return {
          _id: user._id,
          name: user.name,
          email: user.email,
          avatar: user.avatar,
        };
      } else {
        throw new HttpError("Invalid OTP", 400);
      }
    } catch (e) {
      throw new HttpError(`Update email verification error: ${e.message}`, 500);
    }
  }
  static async update_profile(userId, updateData) {
    try {
      const user = await UserModel.findByIdAndUpdate(userId, updateData, {
        new: true,
      });
      if (!user) throw new HttpError("User not found", 404);
      return {
        _id: user._id,
        name: user.name,
        email: user.email,
        avatar: user.avatar,
      };
    } catch (e) {
      throw new HttpError(`Update profile error: ${e.message}`, 500);
    }
  }
  static async update_password(userId, request) {
    try {
      const user = await UserModel.findById(userId);
      if (!user) throw new HttpError("User not found", 404);
      const { oldPassword, newPassword } = request;
      const isPasswordMatch = await bcrypt.compare(oldPassword, user.password);
      if (!isPasswordMatch) {
        throw new HttpError("Old password is incorrect", 401);
      }
      const salt = await bcrypt.genSalt(10);
      user.password = await bcrypt.hash(newPassword, salt);
      await user.save();
    } catch (e) {
      throw new HttpError(`Update password error: ${e.message}`, 500);
    }
  }
  static async delete_account(userId) {
    const session = await db.startSession();
    try {
      const user = await UserModel.findById(userId);
      if (!user) throw new HttpError("User not found", 404);
      await session.withTransaction(async () => {
        await CategoryModel.deleteMany({ userId: user._id }).session(session);
        await SettingModel.deleteOne({ userId: user._id }).session(session);

        const tasks = await TaskModel.find({ userId }, null, { session });
        const taskIds = tasks.map((task) => task._id);

        await SubtaskModel.deleteMany(
          { taskId: { $in: taskIds } },
          { session },
        );
        await TaskModel.deleteMany({ userId }, { session });
        await UserModel.deleteOne({ _id: user._id }).session(session);
      });
    } catch (e) {
      throw new HttpError(`Delete account error: ${e.message}`, 500);
    } finally {
      await session.endSession();
    }
  }
}

export default UserService;

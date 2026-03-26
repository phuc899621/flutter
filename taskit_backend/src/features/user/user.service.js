import UserModel from "./user.model.js";

import jwt from "jsonwebtoken";
import SettingModel from "../setting/setting.model.js";
import SettingServices from "../setting/setting.services.js";
import bcrypt from "bcryptjs";
import CategoryModel from "../category/category.model.js";
import db from "../../config/db.js";
import OtpEmailServices from "../auth/otp.email.services.js";
import TaskModel from "../task/task.model.js";
import TaskServices from "../task/task.services.js";
import SubtaskModel from "../task/subtask.model.js";
import { BadRequestError, BaseError, ServerError } from "../../utils/error.js";
import CategoryServices from "../category/category.services.js";
import logger from "../../utils/logger.js";
import UserRepository from "./user.repo.js";

class UserService {
  static async validateEmailForSignup(email) {
    try {
      const user = await UserRepository.findByEmail(email);
      logger.info(`User document: ${user}`);
      if (user && user.status == "verified")
        throw new BadRequestError("This account already exists");
      return user.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Validate email for signup error: ${e.message}`);
    }
  }
  static async validateUserForLogin(email, password) {
    try {
      const user = await UserRepository.findByEmail(email);
      if (!user || user.status != "verified")
        throw new BadRequestError("User does not exist");
      if (!UserService.comparePassword(password, user.password))
        throw new BadRequestError("Invalid password");
      return user.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Validate email for login error: ${e.message}`);
    }
  }
  static async validateUserForResendOTP(email) {
    try {
      const user = await UserRepository.findByEmail(email);
      if (!user) throw new BadRequestError("User account does not exist");
      if (user.status == "verified")
        throw new BadRequestError("User account already verified");
      logger.info(`User document: ${user.toObject()}`);
      return user?.toObject();
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
  static comparePassword(password, hash) {
    return bcrypt.compare(password, hash);
  }
  static findById(id) {
    return UserModel.findOne({ _id: id });
  }
  static findOne(filter) {
    return UserModel.findOne(filter);
  }
  static async activateAccount(userId, session = null) {
    await UserRepository.updateById({ userId, status: "verified" }, session);
  }
  static async createOrUpdateUser({ email, password, name }, session = null) {
    try {
      const user = await UserRepository.upsertByEmail(
        { email, name, password, status: "pending" },
        session,
      );
      logger.info(`User ${user._id} created`);
      await CategoryServices.createDefaultCategories(user._id, session);
      await SettingServices.createSetting(user._id, session);
      return user._id;
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Create user error: ${e.message}`);
    }
  }
  static async updateByEmail(email, updateData, session = null) {
    try {
      const result = await UserModel.findOneAndUpdate({ email }, updateData, {
        new: true,
        session,
      });
      return result._id;
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(500, "Update user by email error", e.message);
    }
  }

  static async login_verify(token) {
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET || "899621");
      const user = await this.findByEmail(decoded.email);
      if (!user) throw new HttpError("User not found", 404);
      return {
        _id: user._id,
        name: user.name,
        email: user.email,
        avatar: user.avatar,
      };
    } catch (e) {
      throw new HttpError(`Login verification error: ${e.message}`, 500);
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

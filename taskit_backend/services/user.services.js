import UserModel from '../models/user.model.js';
import OtpAuthModel from '../models/otp.auth.model.js';
import OtpAuthServices from './otp.auth.services.js';
import OtpResetServices from './reset.pass.services.js';
import CategoryServices from './category.services.js';
import jwt from "jsonwebtoken";
import SettingServices from './setting.services.js';
import SettingModel from '../models/setting.model.js';
import bcrypt from "bcryptjs";
import CategoryModel from '../models/category.model.js';
import HttpError from '../utils/http.error.js';
import db from "../config/db.js";
import OtpEmailModel from '../models/otp.email.model.js';
import OtpEmailServices from './otp.email.services.js';
import TaskModel from '../models/task.model.js';
import TaskServices from './task.services.js';
import SubtaskModel from '../models/subtask.model.js';
import multer from 'multer';
import path from 'path';

class UserServices {
    static findByEmail(email,session=null) {
        return UserModel.findOne({ email },null,{session});
    }
    static async isVerifiedUser({email,id}) {
        if(await UserModel.findOne({ email,_id:id, isVerified: true })) return true;
    }
    static async isUsernameExists(username) {
        if(await UserModel.findOne({ username })) return true;
    }
    static async isUsernameBelongsToUser(email, username) {
        if(await UserModel.findOne({ username, email })) return true;
    }
    static findById(id) {
        return UserModel.findOne({ _id: id });
    }
    static findOne(filter) {
        return UserModel.findOne(filter);
    }
    static verifyingUser(userId,session=null) {
        return UserModel.findOneAndUpdate({ _id: userId }, { isVerified: true }, { new: true, session });
    }
    static async createUser(request,session=null) {
        try {
            const user = new UserModel(request);
            await user.save({ session });
            await CategoryServices.createDefaultCategories(user._id,session);
            await SettingServices.createSetting(user._id,session);
            return user.toObject();
        } catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Create user error: ${e.message}`, 500);
        }
    }
    static async updateUser(userId, updateData,session=null) {
        try {
            const user = await UserModel.findByIdAndUpdate(
                userId,
                updateData,
                { new: true, session }
            )
            return user.toObject();
        } catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Update user error: ${e.message}`, 500);
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
        }catch (e) {
            throw new HttpError(`Login verification error: ${e.message}`, 500);
        }
    } 
    static async update_email(userId,email) {
        
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
    static async update_email_verify(userId,request) {
        try {
            const userOtp = await OtpEmailServices.findByEmail(request.email);
            if (!userOtp) throw new HttpError("Invalid email", 400);

            const checkUser = await UserModel.findById(userId);
            if (!checkUser) throw new HttpError("User not found", 404);

            if (await OtpEmailServices.compareOtp(request.otp, userOtp.otp)) {
                const user = await UserModel.findByIdAndUpdate(
                    userId,
                    { email: request.email },
                    { new: true }
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
            const user = await UserModel.findByIdAndUpdate(
                userId,
               updateData,
                { new: true }
            );
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
        try{
            const user = await UserModel.findById(userId);
            if (!user) throw new HttpError("User not found", 404);
            const {oldPassword, newPassword} = request;
            const isPasswordMatch = await bcrypt.compare(oldPassword, user.password);
            if (!isPasswordMatch) {
                throw new HttpError("Old password is incorrect", 401);
            }
            const salt = await bcrypt.genSalt(10);
            user.password = await bcrypt.hash(newPassword, salt);
            await user.save();
            
        }catch (e) {
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

                const tasks = await TaskModel.find({ userId }, null,{ session });
                const taskIds = tasks.map(task => task._id);

                await SubtaskModel.deleteMany({taskId: { $in: taskIds }},{session});
                await TaskModel.deleteMany({ userId }, { session });
                await UserModel.deleteOne({ _id: user._id }).session(session);
            });
        }catch (e) {
            throw new HttpError(`Delete account error: ${e.message}`, 500);
        }finally {
            await session.endSession();
        }
    }
            

}

export default UserServices;
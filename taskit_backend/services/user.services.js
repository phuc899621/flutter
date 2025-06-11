import UserModel from '../models/user.model.js';
import OtpAuthModel from '../models/otp.auth.model.js';
import OtpAuthServices from './otp.auth.services.js';
import OtpResetServices from './otp.reset.services.js';
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
import SubtaskModel from '../models/subtask.model.js';
import multer from 'multer';
import path from 'path';

class UserServices {
    static async findByEmail(email) {
        return await UserModel.findOne({ email });
    }
    static async findById(id) {
        return await UserModel.findOne({ _id: id });
    }
    static async signup(request) {
        const session = await db.startSession();
        let otp;
        try{    
            const user = await UserModel.findOne({ email: request.email });
            if (user) throw new HttpError("Email already exists", 409);
            const isVerifySend = await OtpAuthModel.findOne({email:request.email});
            if (isVerifySend) {
                await OtpAuthModel.deleteOne({ email: request.email }).session(session);
            }
            otp = await OtpAuthServices.generateOTP();
            await session.withTransaction(async () => {
                const otpRequest = {
                    email: request.email,
                    name: request.name,
                    password: request.password,
                    otp: otp
                }
                await OtpAuthModel.create([otpRequest], { session: session });
            });
            await OtpAuthServices.sendOTP(request.email, otp);
            return { message: "OTP sent to your email", data:{} };
        }catch (e) {
            throw new HttpError(`Sign up error: ${e.message}`, 500);
        } finally {
            await session.endSession();
        }
    }
    static async signup_verify(request) {
        const session = await db.startSession();
        try {
            const getOtp = await OtpAuthServices.findByEmail(request.email);
            if (!getOtp) throw new HttpError("Invalid email", 400);

            if (await OtpAuthServices.compareOtp(request.otp, getOtp.otp)) {
                const { email,name, password } = getOtp;

                await session.withTransaction(async () => {
                    const result =await UserModel.create([{ email, name, password}], { session });
                    const userId = result[0]._id;
                    const defaultCategories = [
                        { name: 'Work', userId },
                        { name: 'Personal', userId },
                        { name: 'Shopping', userId },
                        { name: 'Health', userId },
                        { name: 'Any', userId },
                    ];  
                    await CategoryModel.insertMany(defaultCategories,{session});
                    await SettingModel.create([{ userId }], { session });
                    await OtpAuthModel.deleteOne({ email }).session(session);
                });
                return { message: "Verify your account successfully!", data: {} };
            } else {
                throw new HttpError(`Wrong OTP for ${request.email}`, 400);
            }
        } catch (e) {
            throw new HttpError(`Signup verify error: ${e.message}`, 500);
        } finally {
            await session.endSession();
        }
    }
    static async login(request){
        try {
            const user = await UserModel.findOne({ email: request.email });
            if (!user) throw new HttpError("User not found", 404);

            const isPasswordMatch = await bcrypt.compare(request.password, user.password);
            if (!isPasswordMatch) throw new HttpError("Invalid password", 401);

            const token = jwt.sign(
                { id: user._id, email: user.email },
                process.env.JWT_SECRET || "899621",
                { expiresIn: process.env.JWT_EXPIRES_IN || "1d" }
            );
            const setting= await SettingServices.findByUserId(user._id);
            const categories = await CategoryServices.findByUserId(user._id);
            return {
                    token: token,
                    settings: setting,
                    user: {
                        _id: user._id,
                        name: user.name,
                        email: user.email,
                        avatar: user.avatar,
                    },
                    categories: categories,
            };
            
        }catch (e) {
            throw new HttpError(`Login error: ${e.message}`, 500);
        }


    }
    static async forgot_password(request) {
        const { email } = request;
        try {
            const user = await this.findByEmail(email);
            if (!user) throw new HttpError("User not found", 404);

            const userOtp = await OtpResetServices.findByEmail(email);
            if (userOtp) {
                await OtpResetServices.deleteByEmail(email);
            }

            const otp = await OtpResetServices.generateOTP();
            const resetToken = await OtpResetServices.generateResetToken();
            await OtpResetServices.sendOTP(email, otp);
            await OtpResetServices.create(email, otp, resetToken);
        } catch (e) {
            throw new HttpError(`Forgot password error: ${e.message}`, 500);
        }
    }
    static async forgot_password_verify(request) {
        try {
            const userOtp = await OtpResetServices.findByEmail(request.email);
            if (!userOtp) throw new HttpError("Invalid email", 400);

            if (await OtpResetServices.compareOtp(request.otp, userOtp.otp)) {
                return userOtp.resetToken;
            } else {
                throw new HttpError("Invalid OTP", 400);
            }
        } catch (e) {
            throw new HttpError(`Forgot password verification error: ${e.message}`, 500);
        }
    }
    static async forgot_password_reset(resetToken,request) {
        const { email, password } = request;
        try {
            const userOtp = await OtpResetServices.findByEmail(email);
            if (!userOtp) throw new HttpError("Otp has expired", 400);

            if (userOtp.resetToken !== resetToken) {
                throw new HttpError("Invalid reset token", 400);
            }
        
            const user = await UserModel.findOne({ email });
            const isPasswordMatch = await bcrypt.compare(password, user.password);
            if (isPasswordMatch) throw new HttpError("New password cannot be the same as the old password", 400);
            const salt = await bcrypt.genSalt(10);
            user.password = await bcrypt.hash(password, salt);
            await user.save();
            
            await OtpResetServices.deleteByEmail(email);
        } catch (e) {
            throw new HttpError(`Forgot password reset error: ${e.message}`, 500);
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
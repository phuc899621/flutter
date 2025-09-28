import UserModel from '../models/user.model.js';
import OtpAuthModel from '../models/otp.auth.model.js';
import OtpAuthServices from './otp.auth.services.js';
import OtpResetServices from './otp.reset.services.js';
import jwt from "jsonwebtoken";
import SettingModel from '../models/setting.model.js';
import bcrypt from "bcryptjs";
import CategoryModel from '../models/category.model.js';
import HttpError from '../utils/http.error.js';
import db from "../config/db.js";
import TaskModel from '../models/task.model.js';
import TaskServices from './task.services.js';
import SubtaskModel from '../models/subtask.model.js';
import multer from 'multer';
import path from 'path';
import UserServices from './user.services.js';
import VerificationServices from './verification.services.js';
import { type } from 'os';
import EmailServices from '../core/emailService.js';
import e from 'express';

class AuthService {
    //#region signup flow
    static async signup(request) {
        const session = await db.startSession();
        session.startTransaction();
        try{ 
           
            
            //check user exists and isVerified=true
            if (await UserServices.isVerifiedUser({email: request.email})) {
                throw new HttpError("Your account already verified", 409);
            }

            if(
                !(await UserServices.isUsernameBelongsToUser(request.email, request.username))&&
                await UserServices.isUsernameExists(request.username)
                
            ){
                throw new HttpError("Username already exists", 409);
            }

            //hash password
            const salt = await bcrypt.genSalt(10);
            request.password = await bcrypt.hash(request.password, salt);

            const user = (await UserServices.findByEmail(request.email)).toObject();
            if(user){
                //user exists and not verify -> update user
                const updateRequest={
                    name: request.name,
                    username: request.username,
                    password: request.password
                }
                await UserServices.updateUser(user.id,updateRequest,session);
            }else{
                //user didn't exist -> create user
                await UserServices.createUser({
                    email: request.email,
                    name: request.name,
                    username: request.username,
                    password: request.password
                },session);
            }
            
            const userAfterCreated = (await UserServices.findByEmail(request.email)).toObject();
            const otp = VerificationServices.generateOTP();
            
            if(await VerificationServices.isSignupRequested(userAfterCreated.id)){
                await VerificationServices.updateSignup(userAfterCreated.id, otp,session);
            } else {
                await VerificationServices.createSignup(userAfterCreated.id, otp,session);
            }

            
            await EmailServices.sendEmail(
                request.email,
            "Verify email for Taskit account",
            `Your OTP is: ${otp}. This OTP only last 30 minutes.`
            );
            await session.commitTransaction();
            return { 
                id: userAfterCreated.id,
             };
        }catch (e) {
            await session.abortTransaction();
            if (e instanceof HttpError) throw e;
            throw new HttpError(`Sign up error: ${e.message}`, 500);
        } finally {
            await session.endSession();
        }
    }
    static async verifySignup(userId, otp) {
        const session = await db.startSession();
        session.startTransaction();
        try{ 
            const verObj = await VerificationServices.getVerification({userId, type: 'signup'});
            if (!verObj) {
                throw new HttpError("User not found", 404);
            }

            if(!await bcrypt.compare(otp, verObj.otp)){
                throw new HttpError("Wrong or Expired OTP", 400);
            }

            await UserServices.verifyingUser(userId,session);
            await VerificationServices.deleteSignup(userId,session);

        }catch (e) {
            await session.abortTransaction();
            if (e instanceof HttpError) throw e;
            throw new HttpError(`Sign up error: ${e.message}`, 500);
        } finally {
            await session.endSession();
        }
    }
    static async resendSignupOtp(userId) {
        const session = await db.startSession();
        session.startTransaction();
        try{ 
            const user= (await UserServices.findById(userId)).toObject();
            if (!user) {
                throw new HttpError("User account not found", 404);
            }
            if(await UserServices.isVerifiedUser({email: user.email})){
                throw new HttpError("User account already verified", 409);
            }
            const userDoc=user.toObject();

            const otp = VerificationServices.generateOTP();

            if(await VerificationServices.isSignupRequested(userDoc.id)){
                await VerificationServices.updateSignup(userDoc.id, otp,session);
            } else {
                await VerificationServices.createSignup(userDoc.id, otp,session);
            }

            await EmailServices.sendEmail(
                verObj.email,
            "Verify email for Taskit account",
            `Your OTP is: ${otp}. This OTP only last 30 minutes.`
            );
            await session.commitTransaction();

        }catch (e) {
            await session.abortTransaction();
            if (e instanceof HttpError) throw e;
            throw new HttpError(`Sign up error: ${e.message}`, 500);
        } finally {
            await session.endSession();
        }
    }
    //#endregion

    //#region login flow

    static async login(request){
        try {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const query = emailRegex.test(request.identifier)
                ? { email: request.identifier }
                : { username: request.identifier };
            const userDoc = await UserServices.findOne(query);

            if (!userDoc) throw new HttpError("Account not found", 404);

            const isPasswordMatch = await bcrypt.compare(request.password, user.password);
            if (!isPasswordMatch) throw new HttpError("Invalid password", 401);

            const accessToken = jwt.sign(
                { id: userDoc._id, email: userDoc.email, username: userDoc.username },
                process.env.JWT_SECRET || "899621",
                { expiresIn: "1d" }
            );
            const refreshToken = jwt.sign(
                { id: userDoc._id, email: userDoc.email, username: userDoc.username },
                process.env.JWT_SECRET || "899621",
                { expiresIn: "7d" }
            )
            const expiresIn = 60 * 60 * 24;
            const expiresAt = Date.now() + expiresIn * 1000;
            return {
                accessToken
                ,refreshToken,
                expiresAt
            };
            
        }catch (e) {
            if (e instanceof HttpError) throw e;
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
  

}

export default AuthService;
import EmailService from "../core/emailService.js";
import OtpModel from '../model/otp.model.js';
import bcrypt from "bcryptjs";
import crypto from "crypto";

class OtpServices {
    static async createOtpUser(email, otp, resetToken) {
        const otpUser = new OtpModel({
            email: email,
            otp: otp,
            resetToken: resetToken,
        });
        return await otpUser.save();
    }
    static async generateOTP() {
        return Math.floor(1000 + Math.random() * 9000).toString();
    }
    static async isVerifySend(email) {
        try {
            return await OtpModel.isVerifySend(email);
        } catch (e) {
            throw e;
        }
    }
    static async deleteOtpByEmail(email) {
        try {
            return await OtpModel.deleteOtpByEmail(email);
        } catch (e) {
            throw e;
        }
    }
    static async findOtpByEmail(email) {
        try {
            return await OtpModel.findOtpByEmail(email);
        } catch (e) {
            throw e;
        }
    }
    static async compareOtp(otp, hashOtp) {
        try {
            return await bcrypt.compare(otp, hashOtp);
        } catch (e) {
            throw e;
        }
    }
    static async sendOTP(email, otp) {
        return EmailService.sendEmail(
            email,
            "Verify email for Taskit account",
            "Your OTP is: " + otp + ". This OTP only last 15 minutes."
        );
    }
    static async generateResetToken() {
        try {
            return crypto.randomBytes(32).toString('hex');
        } catch (e) {
            throw e;
        }
    }
}

export default OtpServices;
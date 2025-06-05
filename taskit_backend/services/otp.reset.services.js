import EmailService from "../core/emailService.js";
import OtpResetModel from "../models/otp.reset.model.js";
import bcrypt from "bcryptjs";
import crypto from "crypto";

class OtpResetServices {
    static async create(email, otp, resetToken) {
        const otpUser = new OtpResetModel({
            email: email,
            otp: otp,
            resetToken: resetToken,
        });
        return await otpUser.save();
    }
    static generateOTP() {
        return Math.floor(1000 + Math.random() * 9000).toString();
    }
    static async findByEmail(email) {
        return await OtpResetModel.findOne({email});
    }
    static async deleteByEmail(email) {
        return await OtpResetModel.deleteOne({email});
    }
    static async compareOtp(otp, hashOtp) {
        return await bcrypt.compare(otp, hashOtp);
    }
    static async sendOTP(email, otp) {
        return EmailService.sendEmail(
            email,
            "Verify email for Taskit account",
            `Your OTP is: ${otp}. This OTP only last 15 minutes.`
        );
    }
    static generateResetToken() {
        return crypto.randomBytes(32).toString('hex');
    }
}

export default OtpResetServices;
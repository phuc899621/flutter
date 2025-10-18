import EmailService from "../core/emailService.js";
import ResetPassModel from "../models/reset.pass.model.js";
import bcrypt from "bcryptjs";
import crypto from "crypto";
import jwt from "jsonwebtoken";

class ResetPassService {
    static async create(email, resetToken, session) {
        const resetPass = new ResetPassModel({ email, resetToken });
        await resetPass.save({ session });
    }
    static generateOTP() {
        return Math.floor(1000 + Math.random() * 9000).toString();
    }
    static async findByEmail(email) {
        return await ResetPassModel.findOne({email});
    }
    static async deleteByEmail(email) {
        return await ResetPassModel.deleteOne({email});
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
        return crypto.randomBytes(20).toString("hex");
    }
}

export default ResetPassService;
import EmailService from "../core/emailService.js";
import OtpAuthModel from '../models/otp.auth.model.js';
import bcrypt from "bcryptjs";

class OtpAuthServices {
    static async createOtpUser(request,session) {
        return await OtpAuthModel.create([request], { session });
    }
    static async generateOTP() {
        return Math.floor(1000 + Math.random() * 9000).toString();
    }
    static async isVerifySend(email,session) {
        return await OtpAuthModel.findOne({ email }).session(session);
    }
    static async deleteOtpByEmail(email,session) {
        return await OtpAuthModel.deleteOne({ email }).session(session);
    }
    static async findByEmail(email) {
        return await OtpAuthModel.findOne({ email });
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
}

export default OtpAuthServices;
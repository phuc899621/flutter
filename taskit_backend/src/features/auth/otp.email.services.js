import OtpEmailModel from "./otp.email.model.js";
import bcrypt from "bcryptjs";
import EmailServices from "../email/email.service.js";
class OtpEmailServices {
  static async create(email, otp) {
    const otpUser = new OtpEmailModel({
      email: email,
      otp: otp,
    });
    return await otpUser.save();
  }

  static generateOTP() {
    return Math.floor(1000 + Math.random() * 9000).toString();
  }

  static async findByEmail(email) {
    return await OtpEmailModel.findOne({ email });
  }

  static async deleteByEmail(email) {
    return await OtpEmailModel.deleteOne({ email });
  }

  static async compareOtp(otp, hashOtp) {
    return await bcrypt.compare(otp, hashOtp);
  }

  static async sendOTP(email, otp) {
    return EmailServices.sendEmail(
      email,
      "Verify email for Taskit account",
      `Your OTP is: ${otp}. This OTP only last 30 minutes.`,
    );
  }
}
export default OtpEmailServices;

import VerificationModel from "./verification.model.js";
import { BadRequestError, ServerError } from "../../utils/error.js";
import VerificationRepository from "./verification.repo.js";
import logger from "../../utils/logger.js";
import bcrypt from "bcryptjs";

class VerificationService {
  static generateOTP() {
    return Math.floor(1000 + Math.random() * 9000).toString();
  }

  static async isSignupRequested(userId) {
    if (await VerificationModel.findOne({ userId, purpose: "signup" }))
      return true;
  }
  static async isResetRequested(userId) {
    if (await VerificationModel.findOne({ userId, purpose: "reset" }))
      return true;
  }
  static getVerification(filter) {
    return VerificationModel.findOne(filter);
  }

  static async deleteSignupOTP(userId, session = null) {
    return VerificationRepository.deleteByUserIdAndPurpose(
      userId,
      "signup",
      session,
    );
  }

  static deleteReset(userId, session = null) {
    return VerificationModel.findOneAndDelete(
      { userId, purpose: "reset" },
      { session },
    );
  }
  static async createOrUpdateSignupOTP(userId, session) {
    const otp = this.generateOTP();
    const otpHash = await bcrypt.hash(otp, 10);
    await VerificationRepository.upsertByUserId(
      { userId, otp: otpHash, purpose: "signup" },
      session,
    );
    return otp;
  }
  static async verifySignupOTP(userId, otp) {
    const otpDoc = await VerificationRepository.findSignupOTPByUserId(userId);
    logger.info(`OTP document for ${userId}: ${otpDoc}`);
    if (!otpDoc) throw new BadRequestError("Invalid OTP");
    const compareResult = await bcrypt.compare(otp, otpDoc.otp);
    if (!compareResult) throw new BadRequestError("Wrong or Expired OTP");
  }
  static async createReset(userId, otp, session = null) {
    try {
      const verification = new VerificationModel({
        userId,
        otp,
        purpose: "reset",
      });
      await verification.save({ session });
    } catch (e) {
      throw new ServerError(
        `Create reset verification error: ${e.message}`,
        500,
      );
    }
  }
  static async updateSignup(userId, otp, session = null) {
    try {
      await VerificationModel.findOneAndUpdate(
        { userId, purpose: "signup" },
        { otp, createdAt: Date.now() },
        { session },
      );
    } catch (e) {
      throw new ServerError("Update signup verification error", e);
    }
  }
  static async updateReset(userId, otp, session = null) {
    try {
      await VerificationModel.findOneAndUpdate(
        { userId, purpose: "reset" },
        { otp, createdAt: Date.now() },
        { session },
      );
    } catch (e) {
      throw new ServerError(
        `Update reset verification error: ${e.message}`,
        500,
      );
    }
  }
}

export default VerificationService;

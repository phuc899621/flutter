import VerificationModel from "./verification.model.js";
import { ServerError } from "../../utils/error.js";

class VerificationServices {
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
  static deleteSignup(userId, session = null) {
    return VerificationModel.findOneAndDelete(
      { userId, purpose: "signup" },
      { session },
    );
  }

  static deleteReset(userId, session = null) {
    return VerificationModel.findOneAndDelete(
      { userId, purpose: "reset" },
      { session },
    );
  }
  static async upsertSignupOTP(userId, session) {
    const otp = this.generateOTP();
    await VerificationModel.findOneAndUpdate(
      { userId, purpose: "signup" },
      {
        otp,
        createdAt: new Date(),
      },
      { upsert: true, new: true, session },
    );
    return otp;
  }
  static async createSignup(userId, otp, session = null) {
    try {
      const verification = new VerificationModel({
        userId,
        otp,
        purpose: "signup",
      });
      await verification.save({ session });
    } catch (e) {
      throw new ServerError(500, `Create signup verification error`, e.message);
    }
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

export default VerificationServices;

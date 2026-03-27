import {
  BadRequestError,
  BaseError,
  ServerError,
} from "../../shared/utils/error.js";
import VerificationRepository from "./verification.repo.js";
import logger from "../../shared/utils/logger.js";
import { OTP_PURPOSE } from "../../shared/constants/otpPurpose.js";
import { HashHelper } from "../../shared/helpers/hash.helper.js";

class VerificationService {
  static generateOTP() {
    return Math.floor(1000 + Math.random() * 9000).toString();
  }

  //#region Create+Update
  static async createOrUpdateOTP(userId, purpose, session) {
    const otp = this.generateOTP();
    const otpHash = await HashHelper.hash(otp);
    await VerificationRepository.upsertByUserId(
      { userId, otp: otpHash, purpose },
      session,
    );
    return otp;
  }
  //#endregion
  //#region Verify
  static async verifyOTP(userId, purpose, otp) {
    try {
      const otpDoc = await VerificationRepository.findByUserIdAndPurpose(
        userId,
        purpose,
      );
      logger.info(`OTP document for ${userId}: ${otpDoc}`);
      if (!otpDoc) throw new BadRequestError("Invalid OTP");
      if (!(await HashHelper.compare(otp, otpDoc.otp)))
        throw new BadRequestError("Wrong or Expired OTP");
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Verify ${purpose} OTP error: ${e.message}`);
    }
  }
  //#endregion
  //#region Delete
  static deleteOTP(userId, purpose, session = null) {
    return VerificationRepository.deleteByUserIdAndPurpose(
      userId,
      purpose,
      session,
    );
  }
  //#endregion
  //#region WRAPPER
  static async createSignupOTP(userId, session) {
    return this.createOrUpdateOTP(userId, OTP_PURPOSE.SIGNUP, session);
  }
  static async createForgotPasswordOTP(userId, session) {
    return this.createOrUpdateOTP(userId, OTP_PURPOSE.FORGOT_PASSWORD, session);
  }
  static verifySignupOTP(userId, otp) {
    return this.verifyOTP(userId, OTP_PURPOSE.SIGNUP, otp);
  }
  static verifyForgotPasswordOTP(userId, otp) {
    return this.verifyOTP(userId, OTP_PURPOSE.FORGOT_PASSWORD, otp);
  }
  static deleteSignupOTP(userId, session = null) {
    return this.deleteOTP(userId, OTP_PURPOSE.SIGNUP, session);
  }
  static deleteForgotPasswordOTP(userId, session = null) {
    return this.deleteOTP(userId, OTP_PURPOSE.FORGOT_PASSWORD, session);
  }
}

//#endregion

export default VerificationService;

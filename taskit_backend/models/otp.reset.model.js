import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcryptjs";

const otpResetScheme = new mongoose.Schema({
  email: {
    type: String, required: true, unique: true,
  },
  otp: {
    type: String, required: true,
  },
  resetToken: {
    type: String, required: true,
  },
  createAt: {
    type: Date, default: Date.now, expires: 1800,
  },
});
otpResetScheme.pre("save", async function () {
  try {
    const salt = await bcrypt.genSalt(10);
    this.otp = await bcrypt.hash(this.otp, salt);
  } catch (e) {
    throw e;
  }
});

const OtpResetModel = db.model("otp-reset-password", otpResetScheme);
export default OtpResetModel;

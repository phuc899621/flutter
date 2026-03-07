import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcryptjs";
const otpEmailSchema = new mongoose.Schema({
  email: {
    type: String, required: true, unique: true,
  },
  otp: {
    type: String, required: true,
  },
  createAt: {
    type: Date, default: Date.now, expires: 1800,
  },
});
otpEmailSchema.pre("save", async function () {
  try {
    const salt = await bcrypt.genSalt(10);
    this.otp = await bcrypt.hash(this.otp, salt);
  } catch (e) {
    throw e;
  }
});
const OtpEmailModel = db.model("otp-email", otpEmailSchema);
export default OtpEmailModel;
import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcryptjs";
const otpAuthScheme = new mongoose.Schema({
  email: {
    type: String, required: true, unique: true,
  },
  name: {
    type: String, required: true
  },
  password: {
    type: String, required: true
  },
  otp: {
    type: String, required: true,
  },
  createAt: {
    type: Date, default: Date.now, expires: 900
  },
});
otpAuthScheme.pre("save", async function () {
  try {
    const salt = await bcrypt.genSalt(10);
    this.otp = await bcrypt.hash(this.otp, salt);
    this.password = await bcrypt.hash(this.password, salt);
  } catch (e) {
    throw e;
  }
});
const OtpAuthModel = db.model("otp-auth", otpAuthScheme);
export default OtpAuthModel;

import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcryptjs";
const { Schema } = mongoose;

const otpAuthScheme = new Schema({
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

otpAuthScheme.statics.isVerifySend = async function (email) {
  const otp = await this.findOne({ email });
  return otp !== null;
}
otpAuthScheme.statics.deleteOtpByEmail = async function (email) {
  const del = await this.deleteOne({ email });
  return del !== null;
}
otpAuthScheme.statics.findOtpByEmail = async function (email) {
  const otp = await this.findOne({ email });
  return otp;
}
// hash otp and password
otpAuthScheme.pre("save", async function () {
  try {
    const salt = await bcrypt.genSalt(10);
    this.otp = await bcrypt.hash(this.otp, salt);
    this.password = await bcrypt.hash(this.password, salt);
  } catch (e) {
    throw e;
  }
});

const OtpAuthModel = db.model("otpAuth", otpAuthScheme);
export default OtpAuthModel;

const mongoose = require("mongoose");
const db = require("../config/db");
const bcrypt = require("bcryptjs");
const cryto=require("crypto");
const { Schema } = mongoose;
const otpScheme = new Schema({
  email: {
    type: String, required: true, unique: true,
  },
  otp:{
    type: String, required: true,
  },
  resetToken:{
    type: String, required:true,
  },
  createAt:{
    type: Date, default: Date.now(), expires: 3600
  },
});
otpScheme.statics.deleteOtpByEmail = async function (email){
  const del=await this.deleteOne({email})
  return del.deletedCount>0;
}
otpScheme.statics.findOtpByEmail=async function (email){
  const otp=await this.findOne({email});
  return otp;
}
otpScheme.pre("save", async function () {
  try {
    const salt = await bcrypt.genSalt(10);
    this.otp = await bcrypt.hash(this.otp, salt);
  } catch (e) {
    throw e;
  }
});
const OtpModel = db.model("otp", otpScheme);
module.exports = OtpModel;

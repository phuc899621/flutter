const mongoose = require("mongoose");
const db = require("../config/db");
const bcrypt = require("bcryptjs");
const { Schema } = mongoose;
const otpScheme = new Schema({
  email: {
    type: String, required: true, unique: true,
  },
  name:{
    type: String, require: true
  },
  password:{
    type: String, require: true
  },
  otp:{
    type: String, required: true,
  },
  createAt:{
    type: Date, default: Date.now(), expires: 600
  },
});
otpScheme.statics.isVerifySend = async function (email){
  const otp = await this.findOne({ email });
  return otp !== null;
}
otpScheme.statics.deleteOtpByEmail = async function (email){
  const del=await this.deleteOne({email})
  return del!==null;
}
otpScheme.statics.findOtpByEmail=async function (email){
  const otp=await this.findOne({email});
  return otp;
}
otpScheme.statics.compareOtp=async function(otp, hashOtp){
  return await bcrypt.compare(otp,hashOtp) ;
}
//hash otp
otpScheme.pre("save", async function () {
  try {
    const salt = await bcrypt.genSalt(10);
    this.otp = await bcrypt.hash(this.otp, salt);
    this.password=await bcrypt.hash(this.password,salt);
  } catch (e) {
    throw e;
  }
});
const OtpModel = db.model("otp", otpScheme);
module.exports = OtpModel;

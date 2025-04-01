const mongoose = require("mongoose");
const db = require("../config/db");
const bcrypt = require("bcrypt");
const { Schema } = mongoose;
const otpScheme = new Schema({
  email: {
    type: String, required: true, unique: true,
  },
  
  otp:{
    type: String, required: true,
  },
  createAt:{
    type: Date, default: Date.now(), expires: 600
  },
});
//hash otp
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

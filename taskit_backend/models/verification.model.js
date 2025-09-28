import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcryptjs";
import e from "express";
const verificationSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: 'user',
  },
  otp: {
    type: String, required: true,
  },
  type: {
    type: String, required: true,
    enum: ['signup', 'forgot', 'reset']
  },
  createAt: {
    type: Date, default: Date.now, expires: 900
  },
});
verificationSchema.pre("save", async function () {
  try {
    const salt = await bcrypt.genSalt(10);
    this.otp = await bcrypt.hash(this.otp, salt);
  } catch (e) {
    throw e;
  }
});
verificationSchema.pre("findOneAndUpdate", async function (next) {
  const update = this.getUpdate();
  if (update.otp) {
    const salt = await bcrypt.genSalt(10);
    update.otp = await bcrypt.hash(update.otp, salt);
    this.setUpdate(update);
  }
  next();
});
const VerificationModel = db.model("verification", verificationSchema);
export default VerificationModel;

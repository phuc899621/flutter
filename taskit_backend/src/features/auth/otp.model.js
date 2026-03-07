import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcryptjs";
import e from "express";
import { DatabaseError } from "../../utils/error.js";
const otpScheme = new mongoose.Schema({
  user_id: {
    type: mongoose.Schema.Types.ObjectId, 
    required: true, 
  },
  purpose: {
    type: String, 
    enum: ['signup', 'reset'],
    default: 'signup'
  },
  password: {
    type: String, required: true
  },
  otp: {
    type: String, required: true,
  },
  createdAt: {
    type: Date, default: Date.now
  },
});

otpScheme.index({ user_id: 1, purpose: 1 }, { unique: true });
otpScheme.index({createdAt:1},{expireAfterSeconds: 900});

otpScheme.pre("save", async function () {
  try {
    const salt = await bcrypt.genSalt(10);
    this.otp = bcrypt.hash(this.otp, salt);
  } catch (e) {
    throw new DatabaseError("Hashing otp failed", e.message);
  }
});
const otpModel = db.model("otp-verification", otpScheme);
export default otpModel;

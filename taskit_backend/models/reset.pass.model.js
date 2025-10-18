import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcryptjs";

const resetSchema = new mongoose.Schema({
  email: {
    type: String, required: true, unique: true,
  },
  resetToken: {
    type: String, required: true,
  },
  createAt: {
    type: Date, default: Date.now, expires: 1800,
  },
});

const ResetModel = db.model("reset-password", resetSchema);
export default ResetModel;

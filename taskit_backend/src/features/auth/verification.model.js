import mongoose from "mongoose";
import db from "../../config/db.js";
import bcrypt from "bcryptjs";
import { DatabaseError } from "../../utils/error.js";
const verificationSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: 'user',
  },
  otp: {
    type: String, required: true,
  },
  purpose: {
    type: String, required: true,
    enum: ['signup', 'reset']
  },
  createdAt: {
    type: Date, default: Date.now
  },
});

verificationSchema.index({ userId: 1, purpose: 1 }, { unique: true });
verificationSchema.index({createdAt:1},{expireAfterSeconds: 900});


verificationSchema.pre("save", async function () {
  try {
    const salt = await bcrypt.genSalt(10);
    this.otp = bcrypt.hash(this.otp, salt);
  } catch (e) {
    throw new DatabaseError("Hashing error", e.message);
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

import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcryptjs";

const settingSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: 'user',
  },
  isNotificationEnabled: {
    type: Boolean,
    default: true,
  },
  language: {
    type: String,
    enum: ['en', 'vi', 'es'], 
    default: 'en',
  },
  theme: {
    type: String,
    enum: ['light', 'dark'],
    default: 'light',
  },
  remindBefore: {
    type: Number,
    enum: [15, 30,60,1440,10080], 
    default: 30, 
  },
});

settingSchema.statics.findSettingById = async function(id) {
  const user = await this.findOne({ id });
  return user;
}

settingSchema.statics.findSettingByUserId = async function (userId, updateData) {
  const setting = await this.findOne({ userId });
  return setting;
};
settingSchema.statics.updateSettingByUserId = async function (userId, updateData) {
  const setting = await this.findOne({ userId });
  if (!setting) {
    throw new Error('Setting not found');
  }
  Object.assign(setting, updateData);
  await setting.save();
  return setting;
};

const SettingModel = db.model("user-setting", settingSchema);
export default SettingModel;

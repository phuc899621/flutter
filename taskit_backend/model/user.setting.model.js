const mongoose = require("mongoose");
const db = require("../config/db");
const bcrypt = require("bcryptjs");
const { Schema } = mongoose;
const settingSchema = new Schema({
  userId: {
    type: String,
    required: true,
    unique: true,
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
settingSchema.statics.findSettingById=async function(id){
  const user = await this.findOne({ id });
  return user;
}

const SettingModel = db.model("user-setting", settingSchema);
module.exports = SettingModel;

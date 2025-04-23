const mongoose = require("mongoose");
const db = require("../config/db");
const bcrypt = require("bcryptjs");
const HTTPError = require("../utils/http.error");
const SettingModel = require("./user.setting.model"); // Import the Setting model
const { Schema } = mongoose;

const userSchema = new Schema({
  email: {
    type: String,
    required: true,
    unique: true,
  },
  name: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  avatar: {
    type: String,
    default: "uploads/default.jpg",
  },
});

// Static method to find user by email
userSchema.statics.findUserByEmail = async function (email) {
  const user = await this.findOne({ email });
  return user;
};

// Static method to compare passwords
userSchema.statics.comparePassword = async function (password, savePassword) {
  return await bcrypt.compare(password, savePassword);
};

// Middleware to create a user-setting document after a user is created
userSchema.post("save", async function (doc, next) {
  try {
    // Create a default user-setting for the newly created user
    await SettingModel.create({
      userId: doc._id,
      isNotificationEnabled: true,
      language: "en",
      theme: "light",
      remindBefore: 30,
    });
    next();
  } catch (error) {
    next(error);
  }
});

const UserModel = db.model("user", userSchema);
module.exports = UserModel;

import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcryptjs";
import SettingModel from "./setting.model.js"; 

const userSchema = new mongoose.Schema({
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


userSchema.statics.findUserById = async function (id) {
  const user = await this.findById(id);
  return user;
}

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
export default UserModel;

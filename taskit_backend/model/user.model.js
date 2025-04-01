const mongoose = require("mongoose");
const db = require("../config/db");
const bcrypt = require("bcryptjs");
const { Schema } = mongoose;
const userScheme = new Schema({
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

//hash password
userScheme.pre("save", async function () {
  try {
    var user = this;
    const salt = await bcrypt.genSalt(10);
    const hashPass = await bcrypt.hash(user.password, salt);
    user.password = hashPass;
  } catch (e) {
    throw e;
  }
});
// Kiểm tra email tồn tại
userScheme.statics.isEmailExist = async function (email) {
  const user = await this.findOne({ email });
  return user !== null;
};

const UserModel = db.model("user", userScheme);
module.exports = UserModel;

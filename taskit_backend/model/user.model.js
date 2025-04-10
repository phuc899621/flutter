const mongoose = require("mongoose");
const db = require("../config/db");
const bcrypt = require("bcryptjs");
const { use } = require("../routers/user.router");
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


// Kiểm tra email tồn tại
userScheme.statics.isEmailExist = async function (email) {
  const user = await this.findOne({ email });
  return user !== null;
};
userScheme.statics.findUserByEmail=async function(email){
  const user = await this.findOne({ email });
  return user;
}
userScheme.statics.comparePassword=async function(password,savePassword){
  return await bcrypt.compare(password,savePassword);
}

const UserModel = db.model("user", userScheme);
module.exports = UserModel;

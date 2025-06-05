import mongoose from "mongoose";
import db from "../config/db.js";

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
},{ timestamps: true });



const UserModel = db.model("user", userSchema);
export default UserModel;

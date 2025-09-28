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
  isVerified: {
    type: Boolean,
    default: false,
  },
  password: {
    type: String,
    required: true,
  },
  avatar: {
    type: String,
    default: "uploads/default.jpg",
  },
},{ timestamps: true, 
  toJSON: { 
        virtuals: true,
        transform: function (doc, ret) {
            const {_id, password, __v, ...rest} = ret;
            return {
                ...rest,    
            }
        }
    },
    toObject: {
        virtuals: true,
        transform: function (doc, ret) {
            const {_id, password, __v, ...rest} = ret;
            return {
                ...rest,    
            }
        }
    } 
} );



const UserModel = db.model("user", userSchema);
export default UserModel;

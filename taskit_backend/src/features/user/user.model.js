import mongoose from "mongoose";
import db from "../../shared/utils/db.js";

const userSchema = new mongoose.Schema(
  {
    email: {
      type: String,
      required: true,
      unique: true,
    },
    name: {
      type: String,
      required: true,
    },
    status: {
      type: String,
      enum: ["pending", "verified", "deleted"],
      default: "pending",
    },
    auth: {
      local: {
        password: {
          type: String,
          default: null,
        },
      },
      google: {
        sub: {
          type: String,
          default: null,
        },
      },
    },
    avatar: {
      type: String,
      default: "/uploads/default.jpg",
    },
  },
  {
    timestamps: true,
    toJSON: {
      virtuals: true,

      transform: function (doc, ret) {
        const { _id, auth, __v, ...rest } = ret;
        return {
          id: _id,
          ...rest,
        };
      },
    },
    toObject: {
      virtuals: true,
      transform: function (doc, ret) {
        const { _id, auth, __v, ...rest } = ret;
        return {
          id: _id,
          ...rest,
        };
      },
    },
  },
);

const UserModel = db.model("user", userSchema);
export default UserModel;

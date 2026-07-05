import mongoose from "mongoose";
import db from "../../shared/utils/db.js";

const userDeviceSchema = new mongoose.Schema(
  {
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "user",
      required: true,
      index: true,
    },
    deviceId: {
      type: String,
      required: true,
    },
    fcmToken: {
      type: String,
      required: true,
    },
    platform: {
      type: String,
      enum: ["android", "ios"],
      required: true,
    },
    lastSeen: {
      type: Date,
      default: Date.now,
    },
  },
  {
    timestamps: true,
    toJSON: {
      virtuals: true,

      transform: function (doc, ret) {
        const { _id, __v, ...rest } = ret;
        return {
          id: _id,
          ...rest,
        };
      },
    },
    toObject: {
      virtuals: true,
      transform: function (doc, ret) {
        const { _id, __v, ...rest } = ret;
        return {
          id: _id,
          ...rest,
        };
      },
    },
  },
);
userDeviceSchema.index({ userId: 1, deviceId: 1 }, { unique: true });
userDeviceSchema.index({ userId: 1 });
const UserDeviceModel = db.model("user-device", userDeviceSchema);
export default UserDeviceModel;

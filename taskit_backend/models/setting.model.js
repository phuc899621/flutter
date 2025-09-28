import mongoose from "mongoose";
import db from "../config/db.js";

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
},{timestamps: true,
  toJSON: { 
        virtuals: true,
        transform: function (doc, ret) {
            const {_id, __v, ...rest} = ret;
            return {
                id: _id.toHexString(),
                ...rest,    
            }
        }
    }, 
    toObject: { 
        virtuals: true,
        transform: function (doc, ret) {
            const {_id, __v, ...rest} = ret;
            return {
                id: _id.toHexString(),
                ...rest,    
            }
        }
    }
});


const SettingModel = db.model("user-setting", settingSchema);
export default SettingModel;

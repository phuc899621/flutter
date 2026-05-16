import mongoose from "mongoose";
import db from "../../shared/utils/db.js";
import { ConflictError } from "../../shared/utils/error.js";
const categorySchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
      trim: true,
    },
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "user",
      required: true,
    },
    default: {
      type: Boolean,
      default: false,
    },
    deleted: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true,
    toJSON: {
      virtuals: true,
      transform: function (doc, ret) {
        const { _id, __v, ...rest } = ret;
        return {
          id: _id.toHexString(),
          ...rest,
        };
      },
    },
    toObject: {
      virtuals: true,
      transform: function (doc, ret) {
        const { _id, __v, ...rest } = ret;
        return {
          id: _id.toHexString(),
          ...rest,
        };
      },
    },
  },
);
categorySchema.statics.isValidId = function (id) {
  return mongoose.Types.ObjectId.isValid(id);
};
const Category = db.model("category", categorySchema);
export default Category;

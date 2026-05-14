import mongoose from "mongoose";
import db from "../../shared/utils/db.js";
const { Schema } = mongoose;

const subtaskSchema = new Schema(
  {
    title: {
      type: String,
      default: "",
    },
    completed: {
      type: Boolean,
      default: false,
    },
    completedAt: {
      type: Date,
      default: null,
    },
    deleted: {
      type: Boolean,
      default: false,
    },
    taskId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "task",
      required: true,
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

const SubtaskModel = db.model("subtask", subtaskSchema);
export default SubtaskModel;

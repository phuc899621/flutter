import mongoose from "mongoose";
import db from "../config/db.js";
import HttpError from "../utils/http.error.js";
const categorySchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user',
        required: true
    }
}, { timestamps: true });
categorySchema.pre('deleteOne', { document: true, query: false }, function(next) {
  if (this.name === 'Any') {
    const err = new HttpError('Cannot delete the default category "Any"',400);
    return next(err);
  }
  next();
});


const Category = db.model("category", categorySchema);
export default Category;
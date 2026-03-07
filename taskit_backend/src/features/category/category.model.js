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
    },
    isDefault: {
        type: Boolean,
        default: false
    }
}, { timestamps: true, 
    toJSON: { 
        virtuals: true,
        transform: function (doc, ret) {
            const {_id, __v, userId, ...rest} = ret;
            return {
                id: _id.toHexString(),
                userId,
                ...rest,    
            }
        }
    },
    toObject: { virtuals: true,
        transform: function (doc, ret) {
            const {_id, __v, userId, ...rest} = ret;
            return {
                id: _id.toHexString(),
                userId,
                ...rest,    
            }
        }
     } });

categorySchema.pre('deleteOne', { document: true, query: false }, function(next) {
  if (this.isDefault) {
    return next(new HttpError('Cannot delete default category', 400));
  }
  next();
});
categorySchema.index({ userId: 1, name: 1 }, { unique: true });

categorySchema.pre('deleteOne', { document: false, query: true }, async function(next) {
  const filter = this.getFilter();
  const category = await this.model.findOne(filter);
  if (category && category.isDefault) {
    return next(new HttpError('Cannot delete default category', 400));
  }
  next();
});

const Category = db.model("category", categorySchema);
export default Category;
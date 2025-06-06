import mongoose from "mongoose";
import db from "../config/db.js";
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



const Category = db.model("category", categorySchema);
export default Category;
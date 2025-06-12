import mongoose from 'mongoose';
import HTTPError from "../utils/http.error.js";
import db from "../config/db.js";
const { Schema } = mongoose;
const taskSchema = new Schema({
    title: {
        type: String,
        required: true,
        trim: true,
    },
    description: {
        type: String,
        trim: true,
        default: '',
    },
    category: {
        type: String,
        trim: true,
        default: 'Any',
    },
    priority: {
        type: String,
        enum: ['low', 'medium', 'high', 'none'],
        default: 'none',
    },
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user',
        required: true,
    },
    status: {
        type: String,
        enum: ['pending', 'in-progress', 'completed'],
        default: 'pending',
    },
    dueDate:{
        type: Date,
        default: null,
    },
    hasTime: {
        type: Boolean,
        default: false,
    }
},{ timestamps: true });
const TaskModel = db.model('task', taskSchema);
export default TaskModel;
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
    categoryId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'category',
        required: true,
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
        enum: ['pending', 'scheduled', 'completed'],
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
},{ 
    timestamps: true, 
    toJSON: { 
        virtuals: true,
        transform: function (doc, ret) {
            const {_id, __v, userId, categoryId, ...rest} = ret;
            return {
                id: _id.toHexString(),
                userId,
                categoryId,
                ...rest,    
            }
        }
    }, 
    toObject: { 
        virtuals: true,
        transform: function (doc, ret) {
            const {_id, __v, userId, categoryId, ...rest} = ret;
            return {
                id: _id.toHexString(),
                userId,
                categoryId,
                ...rest,    
            }
        } 
    } });

taskSchema.virtual("id").get(function () {
  return this._id.toHexString();
});             
const TaskModel = db.model('task', taskSchema);
export default TaskModel;
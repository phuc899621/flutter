import mongoose from 'mongoose';
import HTTPError from "../utils/http.error.js";
import db from "../config/db.js";
const { Schema } = mongoose;

const subtaskSchema = new Schema({
    title: {
        type: String,
        default: '',
    },
    isCompleted: {
        type: Boolean,
        default: false,
    },
    taskId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'task',
        required: true,
    },
},{
    timestamps: true,
    toJSON: { 
        virtuals: true,
        transform: function (doc, ret) {
            const {_id, __v, taskId, ...rest} = ret;
            return {
                id: _id.toHexString(),
                taskId,
                ...rest,    
            }
        }
     },
    toObject: { 
        virtuals: true,
        transform: function (doc, ret) {
            const {_id, __v, taskId, ...rest} = ret;
            return {
                id: _id.toHexString(),
                taskId,
                ...rest,    
            }
        }
     }
});

const SubtaskModel = db.model('subtask', subtaskSchema);
export default SubtaskModel;
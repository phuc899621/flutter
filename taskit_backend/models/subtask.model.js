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

subtaskSchema.pre('save', async function (next) {
    this.updatedAt = Date.now();
    next();
});
subtaskSchema.pre('updateOne', async function (next) {
    this.set({ updatedAt: Date.now() });
    next();
});
subtaskSchema.pre('updateMany', async function (next) {
    this.set({ updatedAt: Date.now() });
    next();
});
subtaskSchema.pre('insertMany', async function (next, docs) {
    docs.forEach(doc => {
        doc.updatedAt = Date.now();
    });
    next();
});
subtaskSchema.statics.addListSubtask = async function (taskId, subtasks) {
    const newSubtasks = subtasks.map(subtask => ({
        ...subtask,
        taskId: taskId,
    }));
    const inserted = await this.insertMany(newSubtasks);
    let result;
    result = inserted.map((doc, index) => ({
        localId: subtasks[index].localId,
        remoteId: doc._id
    }));
    console.log('result', result);
    return result;
}
subtaskSchema.statics.addSubtask = async function (taskId, subtask) {
    const newSubtask = {
        ...subtask,
        taskId: taskId,
    };
    const create = await this.create(newSubtask);
    return {
        localId: subtask.localId,
        remoteId: create._id
    };
}
subtaskSchema.statics.updateSubtask = async function (subtaskId, subtask) {
    const updatedSubtask = await this.findOneAndUpdate(
        { _id: subtaskId },
        { $set: subtask },
        { new: true }
    );
    if (!updatedSubtask) {
        throw new HTTPError('Subtask not found', 404);
    }
    return updatedSubtask;
}
subtaskSchema.statics.deleteAllSubtasks = async function (taskId) {
    return await this.deleteMany({ taskId: taskId });
}
subtaskSchema.statics.deleteSubtask = async function (subtaskId) {
    const deletedSubtask = await this.findOneAndDelete(
        { _id: subtaskId }
    );
    return deletedSubtask;
}
subtaskSchema.statics.deleteListSubtask = async function (subtaskIds) {
    const deletedSubtasks = await this.deleteMany(
        { _id: { $in: subtaskIds } }
    );
    if (!deletedSubtasks) {
        throw new HTTPError('Subtasks not found', 404);
    }
    return deletedSubtasks;
}
subtaskSchema.statics.findAllSubtasks = async function (taskId, query) {
    const subtasks = await this.find({ taskId: taskId, ...query });
    if (!subtasks) {
        throw new HTTPError('Subtasks not found', 404);
    }
    return subtasks;
}

const SubtaskModel = db.model('subtask', subtaskSchema);
export default SubtaskModel;
const mongoose = require('mongoose');
const HTTPError = require("../utils/http.error");
const { Schema } = mongoose;
const db = require("../config/db");
const subtaskSchema = new Schema({
    title: {
        type: String,
        required: true,
        trim: true,
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
});
subtaskSchema.statics.addListSubtask = async function (taskId, subtasks) {
    const newSubtasks = subtasks.map(subtask => ({
        ...subtask,
        taskId: taskId,
    }));
    const inserted=await this.insertMany(newSubtasks);
    let result;
    result= inserted.map((doc, index) => ({
        localId: subtasks[index].localId,
        remoteId: doc._id
    }));
    console.log('result',result);
    return result;
}
subtaskSchema.statics.addSubtask= async function (taskId, subtask) {

        const newSubtask = {
        ...subtask,
        taskId: taskId,
        };
        const create= this.create(newSubtask);
        return {
            localId: subtask.localId,
            remoteId: create._id
        };
}
subtaskSchema.statics.updateSubtask = async function (subtaskId, subtask) {
    
        const updatedSubtask = await this.findOneAndUpdate(
        { _id: subtaskId},
        { $set: subtask },
        { new: true }
        );
        if (!updatedSubtask) {
            throw new HTTPError('Subtask not found',404);
        }
        return updatedSubtask;
}
subtaskSchema.statics.deleteAllSubtasks = async function (taskId) {
    return await this.deleteMany({ taskId: taskId });
}
subtaskSchema.statics.deleteSubtask = async function (subtaskId) {
    
        const deletedSubtask = await this.findOneAndDelete(
            { _id: subtaskId}
        );
        return deletedSubtask;
}
subtaskSchema.statics.deleteListSubtask = async function (subtaskIds) {
    
        const deletedSubtasks = await this.deleteMany(
            { _id: { $in: subtaskIds }}
        );
        if (!deletedSubtasks) {
            throw new HTTPError( 'Subtasks not found',404);
        }
        return deletedSubtasks;
}
subtaskSchema.statics.findAllSubtasks = async function (taskId,query) {
    const subtasks = await this.find({ taskId: taskId, ...query });
    if (!subtasks) {
        throw new HTTPError( 'Subtasks not found',404);
    }
    return subtasks;
}
const SubtaskModel = db.model('subtask', subtaskSchema);
module.exports = SubtaskModel;
const mongoose = require('mongoose');
const HTTPError=require("../utils/http.error");
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
});

const taskSchema = new Schema({
    title: {
        type: String,
        required: true,
        trim: true,
    },
    description: {
        type: String,
        trim: true,
    },
    category:{
        type: String,
        required: true,
    },
    priority:{
        type: String,
        enum: ['low', 'medium', 'high','none'],
        default: 'none',
    },
    userId:{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user',
        required: true,
    },
    status: {
        type: String,
        enum: ['pending', 'in-progress', 'completed'],
        default: 'pending',
    },
    dueDate: {
        type: Date,
    },
    subtasks: [subtaskSchema],
    createdAt: {
        type: Date,
        default: Date.now,
    },
    updatedAt: {
        type: Date,
        default: Date.now,
    },
});

taskSchema.pre('save', function (next) {
    this.updatedAt = Date.now();
    next();
});

taskSchema.statics.addTask = async function (taskData) {
    const task = new this(taskData);
    return await task.save();
}
taskSchema.statics.addListSubtask = async function (taskId, subtasks) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found',404);
    task.subtasks.push(...subtasks);
    return await task.save();
}
taskSchema.statics.updateSubtask = async function (taskId, subtaskId, updateData) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found',404);
    const subtask = task.subtasks.id(subtaskId);
    if (!subtask) throw new HTTPError('Subtask not found',404);
    Object.assign(subtask, updateData);
    return await task.save();
}
taskSchema.statics.updateListSubtask = async function (taskId, subtasks) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found',404);
    task.subtasks = subtasks;
    return await task.save();
}
taskSchema.statics.updateTask = async function (taskId, updateData) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found',404);
    Object.assign(task, updateData);
    return await task.save();
}
taskSchema.statics.deleteTask = async function (taskId) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found',404);
    return await task.remove();
}
taskSchema.statics.deleteSubtask = async function (taskId, subtaskId) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found',404);
    const subtask = task.subtasks.id(subtaskId);
    if (!subtask) throw new HTTPError('Subtask not found',404);
    subtask.remove();
    return await task.save();
}
taskSchema.statics.findTaskById = async function (taskId) {
    const task = await this.findById(taskId);
    return task;
}
taskSchema.statics.findAllTaskByUserId = async function (userId) {
    const tasks = await this.find({ userId }).populate('userId', 'name email');
    return tasks;
}
taskSchema.statics.findAllSubTask = async function (taskId) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found',404);
    return task.subtasks;
}
const TaskModel = db.model('task', taskSchema);
module.exports = TaskModel;
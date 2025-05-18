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
    category: {
        type: String,
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

taskSchema.pre('save', async function (next) {
    this.updatedAt = Date.now();
    const task = this;
    if (!task.subtasks || task.subtasks.length === 0) {
        if (!task.status || task.status === '') {
            task.status = 'pending';
        }
        return next();
    }
    try {
        if (task.status === 'completed') {
            task.subtasks.forEach(st => {
                st.isCompleted = true;
            });
            return next(); // If the task is marked as completed, set all subtasks to completed
        }
        const allCompleted = task.subtasks.every(st => st.isCompleted === true);
        task.status = allCompleted ? 'completed' : 'in-progress';
        return next();
      } catch (err) {
        return next(err);
    }
});

taskSchema.statics.addTask = async function (taskData) {
    const task = new this(taskData);
    return await task.save();
}
taskSchema.statics.addListSubtask = async function (taskId, subtasks) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found', 404);
    task.subtasks.push(...subtasks);
    task.status = 'in-progress'; // Update status to in-progress if subtasks are added

    return await task.save();
}
taskSchema.statics.updateSubtask = async function (taskId, subtaskId, updateData) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found', 404);
    const subtask = task.subtasks.id(subtaskId);
    if (!subtask) throw new HTTPError('Subtask not found', 404);
    Object.assign(subtask, updateData);
    task.status = 'in-progress'; // Update status to in-progress if subtasks are updated
    return await task.save();
}
taskSchema.statics.updateListSubtask = async function (taskId, subtasks) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found', 404);
    task.subtasks = subtasks;
    task.status = 'in-progress'; // Update status to in-progress if subtasks are updated
    return await task.save();
}
taskSchema.statics.updateTask = async function (taskId, updateData) {
    const task = await this.findById(taskId);
    //if status contant in updateData, status is not completed and it has subtask then make all subtask is inCompleted
    if (updateData.status && updateData.status === 'pending') {
        if (!task) throw new HTTPError('Task not found', 404);
        if (task.subtasks && task.subtasks.length > 0) {
            task.subtasks.forEach(st => {
                st.isCompleted = false;
            });
        }
    }
    if (!task) throw new HTTPError('Task not found', 404);
    Object.assign(task, updateData);
    return await task.save();
}
taskSchema.statics.deleteTask = async function (taskId) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found', 404);
    return await task.remove();
}
taskSchema.statics.deleteSubtask = async function (taskId, subtaskId) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found', 404);
    const subtask = task.subtasks.id(subtaskId);
    if (!subtask) throw new HTTPError('Subtask not found', 404);
    subtask.remove();
    return await task.save();
}
taskSchema.statics.findTaskById = async function (taskId) {
    const task = await this.findById(taskId);
    return task;
}
taskSchema.statics.findAllTaskByUserId = async function (userId, { status, dueDate }) {
    const query = { userId };
    console.log(dueDate);
    if (status) query.status = status;
    if (dueDate) {
        const date = new Date(dueDate);
        const startDay = new Date(date.setHours(0, 0, 0, 0));
        const endDay = new Date(date.setHours(23, 59, 59, 999));
        query.dueDate = {
            $gte: startDay,
            $lt: endDay
        };
    }
    const tasks = await this.find(query).populate('userId', '_id name email avatar');
    return tasks;
}
taskSchema.statics.findAllSubTask = async function (taskId) {
    const task = await this.findById(taskId);
    if (!task) throw new HTTPError('Task not found', 404);
    return task.subtasks;
}
const TaskModel = db.model('task', taskSchema);
module.exports = TaskModel;
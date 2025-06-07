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
        default: null,
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
        default: null,
    },
},{ timestamps: true });

taskSchema.statics.addTask = async function (userId,task) {
   
        const newTask = {
            ...task,
            userId: userId,
        };
        const result= await this.create(newTask);
        return {
            localId: task.localId,
            remoteId: result._id
        }
}
taskSchema.statics.addListTask = async function (userId, tasks) {
 
        const newTasks = tasks.map(task => ({
            ...task,
            userId: userId,
        }));
        const inserted= await this.insertMany(newTasks);
        const result = inserted.map((doc, index) => ({
            localId: tasks[index].localId,
            remoteId: doc._id
        }));
        return result;
}
taskSchema.statics.updateTask = async function (taskId, query) {
  
        const task = await this.findById(taskId);
        if (!task) {
            throw new HTTPError('Task not found',404);
        }
        const updateTask = await this.findOneAndUpdate(
            { _id: taskId},
            { $set: query },
            { new: true }
        );
        if (!updateTask) {
            throw new HTTPError('Subtask not found',404);
        }
        return updateTask;
}
taskSchema.statics.deleteTask = async function (taskId) {
    
    const task = await this.findById(taskId);
        if (!task) {
            throw new HTTPError( 'Task not found',404);
        }
        const deleteTask = await this.findOneAndDelete(
            { _id: taskId}
        );
        return deleteTask;    
}
taskSchema.statics.deleteAllTask = async function (userId) {
    
    const tasks = await this.find({ userId: userId });
        if (tasks.length === 0) {
            throw new HTTPError( 'Tasks not found',404);
        }
        const taskIds = tasks.map(task => task._id);
        if (taskIds.length === 0) {
            throw new HTTPError( 'Tasks not found',404);
        }
        return this.deleteMany({ userId: userId });    
}
taskSchema.statics.deleteListTask = async function (taskIds) {

        const tasks = await this.find({ _id: { $in: taskIds } });
        if (tasks.length === 0) {
            throw new HTTPError( 'Tasks not found',404);
        }
        const deleteTasks = await this.deleteMany(
            { _id: { $in: taskIds } }
        );
        if (!deleteTasks) {
            throw new HTTPError( 'Tasks not found',404);
        }
        return deleteTasks;
}
taskSchema.statics.findAllTasks = async function (userId, query) {
    query.userId = userId;
    if (query.dueDate) {
        const date = new Date(query.dueDate);
        const startDay = new Date(date.setHours(0, 0, 0, 0));
        const endDay = new Date(date.setHours(23, 59, 59, 999));
        query.dueDate = {
            $gte: startDay,
            $lt: endDay
        };
    }
    const pipeLine = [
        {
            $match: query
        },
        {
            $lookup: {
                from: 'subtasks',
                localField: '_id',
                foreignField: 'taskId',
                as: 'subtasks'
            }
        },
    ];
    const tasks = await this.aggregate(pipeLine);
    return tasks;
}
const TaskModel = db.model('task', taskSchema);
export default TaskModel;
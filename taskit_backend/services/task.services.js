import TaskModel from '../models/task.model.js';
import bcrypt from "bcryptjs";
import UserServices from './user.services.js';
import HttpError from '../utils/http.error.js';
import SubtaskServices from './subtask.services.js';

class TaskServices {
    static async addTask(
        userId, title, description,
        dueDate, priority, category, localId
    ) {
        try {
            const user = await UserServices.findById(userId);
            if (!user) {
                throw new HttpError("User not found", 404);
            }
            const createTask = {
                userId,
                title,
                description,
                dueDate,
                priority,
                category,
                localId,
            };
            return await TaskModel.addTask(userId, createTask);
        } catch (e) {
            throw e;
        }
    }
    static async addListTask(
        userId, tasks
    ) {
        try {
            const user = await UserServices.findById(userId);
            if (!user) {
                throw new HttpError("User not found", 404);
            }
            return await TaskModel.addListTask(userId, tasks);
        } catch (e) {
            throw e;
        }
    }
    static async updateTask(
        taskId, query
    ) {
        try {
            return await TaskModel.updateTask(taskId, query);
        } catch (e) {
            throw e;
        }
    }
    static async deleteTask(
        taskId
    ) {
        try {
            const task = await TaskModel.deleteTask(taskId);
            await SubtaskServices.deleteAllSubtasks(taskId);
            return task;
        } catch (e) {
            throw e;
        }
    }
    static async deleteAllTask(
        userId
    ) {
        try {
            const user = await UserServices.findById(userId);
            if (!user) {
                throw new HttpError("User not found", 404);
            }
            const tasks = await TaskModel.findAllTasks(userId, {});
            const taskIds = tasks.map(task => task._id);
            for (const taskId of taskIds) {
                await SubtaskServices.deleteAllSubtasks(taskId);
            }
            return await TaskModel.deleteAllTask(userId);
        } catch (e) {
            throw e;
        }
    }
    static async deleteListTask(
        taskIds
    ) {
        try {
            for (const taskId of taskIds) {
                await SubtaskServices.deleteAllSubtasks(taskId);
            }
            return await TaskModel.deleteListTask(taskIds);
        } catch (e) {
            throw e;
        }
    }
    static async findAllTasks(
        userId, query
    ) {
        try {
            return await TaskModel.findAllTasks(userId, query);
        } catch (e) {
            throw e;
        }
    }
}

export default TaskServices;
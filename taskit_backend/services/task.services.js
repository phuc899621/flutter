import TaskModel from '../models/task.model.js';
import bcrypt from "bcryptjs";
import UserServices from './user.services.js';
import HttpError from '../utils/http.error.js';
import CategoryServices from './category.services.js';
import SubtaskModel from '../models/subtask.model.js'
import SubtaskServices from './subtask.services.js';
import db from '../config/db.js'

class TaskServices {
    static async create(userId, createTask,createSubtasks) {
        try {
            const user = await UserServices.findById(userId);
            if (!user) {
                throw new HttpError("User not found", 404);
            }
            if(createTask.category){
                const category = await CategoryServices.findByName(createTask.category);
                if (!category) {
                    throw new HttpError("Category not found", 404);
                }
            }
            const taskResult= await TaskModel.create({...createTask, userId});
            const subtasksResult=await SubtaskServices.create_subtasks(
                taskResult._id, createSubtasks    
            );
            
            const tasks={
                ...taskResult._doc,
                localId: createTask.localId,
                subtasks: subtasksResult.map(subtask => ({
                    ...subtask,
                    taskId: taskResult._id
                }))
            }
            return tasks;
        } catch (e) {
            throw new HttpError(`Create task error: ${e.message} `, 500);
        }
    }
    static async findByUserId(userId,query={}) {
        try{
            const filter = { userId };
            if (query.title) {
                filter.title = { $regex: query.title, $options: 'i' };
            }
            if (query.description) {
                filter.description = { $regex: query.description, $options: 'i' };
            }
            if (query.status) {
                filter.status = query.status;
            }
            if (query.category) {
                filter.category = query.category;
            }
            if (query.dueDate) {
                const date = new Date(query.dueDate); 
                const startOfDay = new Date(date.setHours(0, 0, 0, 0));  
                const endOfDay = new Date(date.setHours(23, 59, 59, 999)); 
                filter.dueDate = {
                    $gte: startOfDay,
                    $lte: endOfDay
                };
            }
            if (query.priority) {
                filter.priority = query.priority;
            }
            const tasks = await TaskModel.find(filter);
            const subtask=await SubtaskModel.find({taskId:{$in:tasks.map(task=>task._id)}})
            const tasksWithSubtasks = tasks.map(task => ({
                ...task._doc,
                subtasks: subtask.filter(subtask => subtask.taskId.toString() === task._id.toString())
            }))
            return tasksWithSubtasks

        }catch (e) {
            throw new HttpError(`Find task error: ${e.message}`, 500);
        }
    }
    static async update_task(taskId, updateData) {
        try {
            if (updateData.category) {
                const category = await CategoryServices.findByName(updateData.category);
                if (!category) {
                    throw new HttpError("Category not found", 404);
                }
            }
            const task = await TaskModel.findById(taskId);
            if (!task) {
                throw new HttpError("Task not found", 404);
            }
            const query = {};
            if (updateData.title) query.title = updateData.title;
            if (updateData.description) query.description = updateData.description;
            if ('dueDate' in updateData) {
                query.dueDate = updateData.dueDate; // chấp nhận cả null
            }
            if (updateData.status) query.status = updateData.status;
            if (updateData.priority) query.priority = updateData.priority;
            if (updateData.categoryId){
                const category = await CategoryServices.findById(updateData.categoryId);
                if (!category) {
                    throw new HttpError("Category not found", 404);
                }
                query.categoryId = updateData.categoryId;
            }
            if (updateData.hasTime !== undefined) query.hasTime = updateData.hasTime;
            let subtaskResult=[];
  
            if (updateData.subtasks) {
                subtaskResult=await SubtaskServices.update_subtasks(updateData.subtasks);
    
            }
            
            await TaskModel.findByIdAndUpdate(
                taskId,
                { $set: query },
                { new: true }
            );
            return {
                localId: updateData.localId,
                subtasks: subtaskResult,
            }
        } catch (e) {
            throw new HttpError(`Update task error: ${e.message}`, 500);
        }
    }
    static async delete_task(taskId) {
        const session=await db.startSession();
        try {
             session.startTransaction();
            await TaskModel.deleteOne({_id:taskId},{session});
            await SubtaskModel.deleteMany({taskId},{session});
            await session.commitTransaction();
        } catch (e) {
            await session.abortTransaction();
            throw new HttpError(`Delete task error: ${e.message}`,500);
        }finally{
            await session.endSession();
        }
    }
    static async delete_all_tasks(userId) {
        const session=await db.startSession();
        try {
            const user = await UserServices.findById(userId);
            if (!user) {
                throw new HttpError("User not found", 404);
            }
            const tasks = await TaskModel.find({ userId });
            const taskIds = tasks.map(task => task._id);
            session.startTransaction();
            await SubtaskModel.deleteMany({taskId: { $in: taskIds }},{session});
            await TaskModel.deleteMany({ userId }, { session });
            await session.commitTransaction();
            await session.endSession();
        } catch (e) {
            throw new HttpError(`Delete task error: ${e.message}`,500);
        }finally{
            await session.endSession();
        }
    }
    
}

export default TaskServices;
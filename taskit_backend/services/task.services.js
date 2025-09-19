import TaskModel from '../models/task.model.js';
import bcrypt from "bcryptjs";
import UserServices from './user.services.js';
import HttpError from '../utils/http.error.js';
import CategoryServices from './category.services.js';
import CategoryModel from '../models/category.model.js';
import SubtaskModel from '../models/subtask.model.js'
import SubtaskServices from './subtask.services.js';
import db from '../config/db.js'

class TaskServices {
    static async createTask(userId, createTask,createSubtasks) {
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
                localId:parseInt(createTask.localId, 10),
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
        }finally{

        }
    }
    
    static async updateTaskPartial(taskId, updateData) {
        const session=await db.startSession();
        try {
            const task = await TaskModel.findById(taskId);
            if (!task) {
                throw new HttpError("Task not found", 404);
            }
            
            if (updateData.categoryId){
                const category = await CategoryServices.findById(updateData.categoryId);
                if (!category) {
                    throw new HttpError("Category not found", 404);
                }
            }
            session.startTransaction();
            
            await TaskModel.findByIdAndUpdate(
                taskId,
                { $set: updateData },
                { new: true, session }
            );
            await session.commitTransaction();
            return {
                taskLocalId: updateData.taskLocalId,
                taskId: taskId,
            }
        } catch (e) {
            session.abortTransaction();
            throw new HttpError(`Update task error: ${e.message}`, 500);
        }finally{
            session.endSession();
        }
    }
     static async updateTaskFull(taskId, updateData) {
        const session= await db.startSession();
        session.startTransaction();
        try {
            const task = await TaskModel.findById(taskId).session(session);
            if (!task) {
                throw new HttpError("Task not found", 404);
            }
        
            if (updateData.categoryId){
                const category = await CategoryModel.findById(updateData.categoryId).session(session);
                if (!category) {
                    throw new HttpError("Category not found", 404);
                }
            }
            
            await TaskModel.findByIdAndUpdate(
                taskId,
                { $set: updateData },
                { new: true, overwrite: true, session }
            );
            await session.commitTransaction();
            return {
                taskLocalId: updateData.taskLocalId,
                taskId: taskId,
            }
        } catch (e) {
            await session.abortTransaction();
            throw new HttpError(`Update task (full) error: ${e.message}`, 500);
        }finally{
            session.endSession();
        }
    }
    static async updateTasksBulk(ids ,updateData) {
        const session= await db.startSession();
        session.startTransaction();
        try {
            const results = [];
            const updated=[];
            const skipped=[];
            let matchedCount = 0;
            let modifiedCount = 0;

            for (const { taskId, taskLocalId } of ids) {
                const task = await TaskModel.findById(taskId).session(session);

                if (!task) {
                    skipped.push({ taskId, taskLocalId, reason: "Task not found" });
                    continue;
                }
                matchedCount++;

                if (updateData.categoryId) {
                    const category = await CategoryModel.findById(updateData.categoryId).session(session);
                    if (!category) {
                        skipped.push({ taskId, taskLocalId, reason: "Category not found" });
                        continue;
                    }
                }

                const updatedTask = await TaskModel.findByIdAndUpdate(
                    taskId,
                    { $set: updateData },
                    { new: true, session }
                );

                if (updatedTask) {
                    modifiedCount++;
                    updated.push({
                        taskId,
                        taskLocalId,
                    });
                } else {
                    updated.push({
                        taskId,
                        taskLocalId,
                    });
                }
            }

            await session.commitTransaction();

            return {
                matchedCount,
                modifiedCount,
                updated,
                skipped,
            };
        } catch (e) {
            await session.abortTransaction();
            throw new HttpError(`Bulk tasks updated error: ${e.message}`, 500);
        }finally{
            session.endSession();
        }
    }
    static async updateMultipleTasks(updateData) {
        const session= await db.startSession();
        session.startTransaction();
        try {
            const bulkOps = [];
            const skippedTasks = [];
            const updatedTasks = [];

            for (const t of updateData) {
                if (!t.taskId || !t.data) {
                    skippedTasks.push({
                        taskId: t.taskId || null,
                        taskLocalId: t.taskLocalId || null,
                    });
                    continue;
                }

                const task = await TaskModel.findById(t.taskId).session(session);
                if (!task) {
                    skippedTasks.push({
                        taskId: t.taskId,
                        taskLocalId: t.taskLocalId,
                        reason: "Task not found"
                    });
                    continue; 
                }

                if (t.data.categoryId) {
                    const category = await CategoryModel.findById(t.data.categoryId).session(session);
                    if (!category) {
                        skippedTasks.push({
                            taskId: t.taskId,
                            taskLocalId: t.taskLocalId,
                            reason: "Category not found"
                        });
                        continue; 
                    }
                }

                bulkOps.push({
                    updateOne: {
                        filter: { _id: t.taskId },
                        update: { $set: t.data }
                    }
                });

                updatedTasks.push({
                    taskId: t.taskId,
                    taskLocalId: t.taskLocalId
                });
            }

            let result = { matchedCount: 0, modifiedCount: 0 };
            if (bulkOps.length > 0) {
                result = await TaskModel.bulkWrite(bulkOps, { session });
            }

            await session.commitTransaction();

            return {
                matchedCount: result.matchedCount,
                modifiedCount: result.modifiedCount,
                updated: updatedTasks,
                skipped: skippedTasks
            };
        } catch (e) {
            await session.abortTransaction();
            throw new HttpError(`Bulk tasks updated error: ${e.message}`, 500);
        }finally{
            session.endSession();
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
import TaskModel from '../models/task.model.js';
import bcrypt from "bcryptjs";
import UserServices from './user.services.js';
import HttpError from '../utils/http.error.js';
import CategoryServices from './category.services.js';
import CategoryModel from '../models/category.model.js';
import SubtaskModel from '../models/subtask.model.js'
import SubtaskServices from './subtask.services.js';
import db from '../config/db.js'
import UserModel from '../models/user.model.js';

class TaskServices {
    //#region CREATE
    static async createTask(userId, createTask,createSubtasks) {
        try {
            const user = await UserModel.findById(userId);
            if (!user) {
                throw new HttpError("User not found", 404);
            }
            if(createTask.categoryId){
                const category = await CategoryModel.findById(createTask.categoryId);
                if (!category) {
                    throw new HttpError("Category not found", 404);
                }
            }else{
                const anyCategory = await CategoryModel.findOne({ name: { $regex: /^any$/i } });
                if (!anyCategory) {
                    throw new HttpError("Default category 'Any' not found", 404);
                }
                createTask.categoryId = anyCategory._id;
            }
            const taskResult= await TaskModel.create({...createTask, userId});
            const subtasksResult=await SubtaskServices.create_subtasks(
                taskResult._id, createSubtasks    
            );
            
            const tasks={
                ...taskResult.toObject(),
                localId:parseInt(createTask.localId, 10),
                subtasks: subtasksResult.map(subtask => ({
                    ...subtask.toObject(),
                    taskId: taskResult._id
                }))
            }
            return tasks;
        } catch (e) {
            if (e instanceof HttpError) throw e;
            throw new HttpError(e.message, 500);
        }
    }
    //#endregion

    //#region READ
    static async getTasks(userId,query={}) {
        try{
            const {
                page = 1,
                limit = 10,
                sortBy = 'createdAt',
                sortOrder = 'desc',
                title,
                description,
                status,
                categoryId,
                dueDate,
                priority
            } = query;
            if(userId){
                const user = await UserModel.findById(userId);  
                if (!user) {
                    throw new HttpError("User not found", 404);
                }
            }
            const filter = { userId };
            if (title) {
                filter.title = { $regex: title, $options: 'i' };
            }
            if (description) {
                filter.description = { $regex: description, $options: 'i' };
            }
            if (status) {
                filter.status = status;
            }
            if (categoryId) {
                filter.categoryId = categoryId;
            }
            if (dueDate) {
                const date = new Date(dueDate); 
                const startOfDay = new Date(date.setHours(0, 0, 0, 0));  
                const endOfDay = new Date(date.setHours(23, 59, 59, 999)); 
                filter.dueDate = {
                    $gte: startOfDay,
                    $lte: endOfDay
                };
            }
            if (priority) {
                filter.priority = priority;
            }
            const skip = (page - 1) * limit;

            const tasks = await TaskModel.find(filter)
                .sort({ [sortBy]: sortOrder })
                .skip(skip)
                .limit(parseInt(limit));
            const subtask=await SubtaskModel.find({taskId:{$in:tasks.map(task=>task._id)}})
            const tasksWithSubtasks = tasks.map(task => ({
                ...task.toObject(),
                subtasks: subtask.filter(subtask => subtask.taskId.toString() === task._id.toString()).map(subtask => subtask.toObject())
            }))
            const total=await TaskModel.countDocuments(filter);
            const pages=Math.ceil(await TaskModel.countDocuments(filter) / limit);
            return {
                data: tasksWithSubtasks,
                meta:{
                    page,
                    limit,
                    total,
                    pages,
                    sortBy,
                    sortOrder
                }
            };

        }catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(e.message, 500);
        }
    }
    static async getSyncTasks(userId,lastSyncTime) {
         try {
            const user = await UserModel.findById(userId);  
            if (!user) {
                throw new HttpError("User not found", 404);
            }

            const filter = { userId };
            if (lastSyncTime) {
                const lastSyncDate = new Date(lastSyncTime);
                filter.updatedAt = { $gt: lastSyncDate };
            }

            const tasks = await TaskModel.find(filter).sort({ updatedAt: 1 });
            const subtasks = await SubtaskModel.find({ taskId: { $in: tasks.map(t => t._id) } });

            const tasksWithSubtasks = tasks.map(task => ({
                ...task.toObject(),
                subtasks: subtasks
                    .filter(subtask => subtask.taskId.toString() === task._id.toString())
                    .map(subtask => subtask.toObject())
            }));

            return {
                data: tasksWithSubtasks,
                meta: {
                    total: tasksWithSubtasks.length,
                    lastSyncTime: lastSyncTime || null
                }
            };
        } catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Get sync tasks error: ${e.message}`, 500);
        }
    }

    static async getTask(taskId) {
        try{
            const task = await TaskModel.findById(taskId);
            if (!task) {
                throw new HttpError("Task not found", 404);
            }
            const subtasks = await SubtaskModel.find({ taskId: taskId });
            task.subtasks = subtasks.map(subtask => subtask.toObject());
            return task.toObject();
        }catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Get task error: ${e.message}`, 500);
        }
    }
    
    //#endregion

    //#region UPDATE
    static async updateTaskPartial(taskId, updateData) {
        const session=await db.startSession();
        try {
            session.startTransaction();
            const task = await TaskModel.findById(taskId).session(session);
            if (!task) {
                throw new HttpError("Task not found", 404);
            }
            
            if (updateData.categoryId){
                const category = await CategoryServices.findById(updateData.categoryId).session(session);
                if (!category) {
                    throw new HttpError("Category not found", 404);
                }
            }
           
            
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
            if(e instanceof HttpError) throw e;
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
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Update tasks error: ${e.message}`, 500);
        }finally{
            session.endSession();
        }
    }
    static async updateTasksBulk(ids ,updateData) {
        const session= await db.startSession();
        session.startTransaction();
        try {
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
    //#endregion

    //#region DELETE
    static async deleteTask(userId,taskId) {
        const session=await db.startSession();
        try {
            session.startTransaction();
            const user = await UserModel.findById(userId).session(session);
            const task = await TaskModel.findById(taskId).session(session);
            const subtaskIds = await SubtaskModel.find({taskId},{_id:1}).session(session);
            if(!task) throw new HttpError("Task not found",404);
            if(!user) throw new HttpError("User not found",404);

            await TaskModel.deleteOne({_id:taskId,userId},{session});
            await SubtaskModel.deleteMany({taskId},{session});
            await session.commitTransaction();
            return {
                taskId,
                subtaskIds
            }
        } catch (e) {
            await session.abortTransaction();
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Delete task error: ${e.message}`,500);
        }finally{
            await session.endSession();
        }
    }
    static async deleteBulkTasks(userId,ids) {
        const session=await db.startSession();
        try {
            session.startTransaction();
            const user = await UserModel.findById(userId).session(session);
            if(!user) throw new HttpError("User not found",404);
            let deleteCount=0;
            let deleteFailed=0;
            if(ids.length===0){
                return {
                    deleteCount,
                    deleteFailed,
                    deletedTasks:[]
                };
            }
        
            const tasks = await TaskModel.find(
                { _id: { $in: ids },userId }
            ).session(session);
            const taskIds = tasks.map(task => task._id);

            const subtasks = await SubtaskModel.find({taskId: { $in: taskIds }}).session(session);
            const subtasksByTask={};
            for(const subtask of subtasks){
                const taskId = subtask.taskId.toString();
                if (!subtasksByTask[taskId]) subtasksByTask[taskId] = [];
                subtasksByTask[taskId].push(subtask._id.toString());
            }

            await SubtaskModel.deleteMany({taskId: { $in: taskIds }},{session});
            const result=await TaskModel.deleteMany({ _id: { $in: taskIds },userId }, { session });
            deleteCount=result.deletedCount;
            deleteFailed=ids.length-deleteCount;
            await session.commitTransaction();
            return {
                deleteCount,
                deleteFailed,
                deletedTasks: taskIds.map(taskId => ({
                    taskId,
                    subtaskIds: subtasksByTask[taskId] || []
                }))
            }
        } catch (e) {
            await session.abortTransaction();
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Delete multiple tasks error: ${e.message}`,500);
        }finally{
            await session.endSession();
        }
    }
    //#endregion
}

export default TaskServices;
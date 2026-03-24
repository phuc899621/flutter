import TaskModel from './task.model.js';
import CategoryServices from '../category/category.services.js';
import CategoryModel from '../category/category.model.js';
import SubtaskModel from '../task/subtask.model.js';
import db from '../../config/db.js'
import UserModel from '../user/user.model.js';
import { BaseError, NotFoundError, ServerError } from '../../utils/error.js';

class TaskServices {
    //#region CREATE
    static async createTask(userId, createTask,createSubtasks) {
        const session=await db.startSession();
        session.startTransaction();
        try {
            const user = await UserModel.findById(userId).session(session);
            if (!user) {
                throw new ServerError("User not found", 404);
            }
            if(createTask.categoryId){
                const category = await CategoryModel.findById(createTask.categoryId).session(session);
                if (!category) {
                    throw new ServerError("Category not found", 404);
                }
            }else{
                const defaultCategory = await CategoryModel.findOne({ userId, isDefault: true },{_id:1}).session(session);;
                if (!defaultCategory) {
                    throw new ServerError("Default category not found", 404);
                }
                createTask.categoryId = defaultCategory._id;
            }
            const taskResult= await TaskModel.create({...createTask, userId}).session(session);
            const subtasksResult=(await SubtaskModel.create(createSubtasks.map(subtask=>({...subtask,taskId:taskResult._id})))).toObject();
            if(subtasksResult.length==0||subtasksResult.length!=createSubtasks.length){
                await session.abortTransaction();
                throw new ServerError("Subtasks were not created",500);
            }
            
            for(let i=0;i<subtasksResult.length;i++){
                subtasksResult[i].localId=createSubtasks[i].localId;
            }
            await session.commitTransaction();
            return {
                localId:parseInt(createTask.localId, 10),
                ...taskResult.toObject(),
                subtasks: subtasksResult.map(subtask => ({
                    ...subtask,
                    taskId: taskResult._id
                })) 
            }
        } catch (e) {
            await session.abortTransaction();
            if (e instanceof BaseError) throw e;
            throw new ServerError(e.message, 500);
        } finally {
            await session.endSession();
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
                    throw new ServerError("User not found", 404);
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
            if(e instanceof BaseError) throw e;
            throw new ServerError(e.message, 500);
        }
    }
    static async getSyncTasks(userId,lastSyncTime) {
         try {
            const user = await UserModel.findById(userId);  
            if (!user) {
                throw new ServerError("User not found", 404);
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
            if(e instanceof BaseError) throw e;
            throw new ServerError(`Get sync tasks error: ${e.message}`, 500);
        }
    }

    static async getTask(taskId) {
        try{
            const task = await TaskModel.findById(taskId);
            if (!task) {
                throw new ServerError("Task not found", 404);
            }
            const subtasks = await SubtaskModel.find({ taskId: taskId });
            task.subtasks = subtasks.map(subtask => subtask.toObject());
            return task.toObject();
        }catch (e) {
            if(e instanceof BaseError) throw e;
            throw new ServerError(`Get task error: ${e.message}`, 500);
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
                throw new NotFoundError("Task not found", 404);
            }
            
            if (updateData.categoryId){
                const category = await CategoryServices.findById(updateData.categoryId).session(session);
                if (!category) {
                    throw new NotFoundError("Category not found", 404);
                }
            }
           
            
            await TaskModel.findByIdAndUpdate(
                taskId,
                { $set: updateData },
                { new: true, session }
            );
            await session.commitTransaction();
            return {
                localId: updateData.localId,
                id: taskId,
            }
        } catch (e) {
            session.abortTransaction();
            if(e instanceof BaseError) throw e;
            throw new ServerError(`Update task error: ${e.message}`, 500);
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
                throw new NotFoundError("Task not found", 404);
            }
        
            if (updateData.categoryId){
                const category = await CategoryModel.findById(updateData.categoryId).session(session);
                if (!category) {
                    throw new NotFoundError("Category not found", 404);
                }
            }
            
            await TaskModel.findByIdAndUpdate(
                taskId,
                { $set: updateData },
                { new: true, overwrite: true, session }
            );
            await session.commitTransaction();
            return {
                localId: updateData.localId,
                id: taskId,
            }
        } catch (e) {
            await session.abortTransaction();
            if(e instanceof BaseError) throw e;
            throw new ServerError(`Update tasks error: ${e.message}`, 500);
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

            for (const { id, localId } of ids) {
                const task = await TaskModel.findById(taskId).session(session);

                if (!task) {
                    skipped.push({ id, localId, reason: "Task not found" });
                    continue;
                }
                matchedCount++;

                if (updateData.categoryId) {
                    const category = await CategoryModel.findById(updateData.categoryId).session(session);
                    if (!category) {
                        skipped.push({ id, localId, reason: "Category not found" });
                        continue;
                    }
                }

                const updatedTask = await TaskModel.findByIdAndUpdate(
                    id,
                    { $set: updateData },
                    { new: true, session }
                );

                if (updatedTask) {
                    modifiedCount++;
                    updated.push({
                        id,
                        localId,
                    });
                } else {
                    updated.push({
                        id,
                        localId,
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
            if(e instanceof BaseError) throw e;
            throw new ServerError(`Bulk tasks updated error: ${e.message}`, 500);
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
                        id: t.id || null,
                        localId: t.localId || null,
                    });
                    continue;
                }

                const task = await TaskModel.findById(t.id).session(session);
                if (!task) {
                    skippedTasks.push({
                        taskId: t.id,
                        taskLocalId: t.localId,
                        reason: "Task not found"
                    });
                    continue; 
                }

                if (t.data.categoryId) {
                    const category = await CategoryModel.findById(t.data.categoryId).session(session);
                    if (!category) {
                        skippedTasks.push({
                            id: t.id,
                            localId: t.localId,
                            reason: "Category not found"
                        });
                        continue; 
                    }
                }

                bulkOps.push({
                    updateOne: {
                        filter: { _id: t.id },
                        update: { $set: t.data }
                    }
                });

                updatedTasks.push({
                    id: t.id,
                    localId: t.localId
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
            if(e instanceof BaseError) throw e;
            throw new ServerError(`Bulk tasks updated error: ${e.message}`, 500);
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
            if(!task) throw new NotFoundError("Task not found",404);
            if(!user) throw new NotFoundError("User not found",404);

            await TaskModel.deleteOne({_id:taskId,userId},{session});
            await SubtaskModel.deleteMany({taskId},{session});
            await session.commitTransaction();
            return {
                taskId,
                subtaskIds
            }
        } catch (e) {
            await session.abortTransaction();
            if(e instanceof BaseError) throw e;
            throw new ServerError(`Delete task error: ${e.message}`,500);
        }finally{
            await session.endSession();
        }
    }
    static async deleteBulkTasks(userId,ids) {
        const session=await db.startSession();
        try {
            session.startTransaction();
            const user = await UserModel.findById(userId).session(session);
            if(!user) throw new NotFoundError("User not found",404);
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
            if(e instanceof BaseError) throw e;
            throw new ServerError(`Delete multiple tasks error: ${e.message}`,500);
        }finally{
            await session.endSession();
        }
    }
    //#endregion
}

export default TaskServices;
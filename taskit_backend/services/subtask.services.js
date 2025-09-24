import SubtaskModel from '../models/subtask.model.js';
import TaskModel from '../models/task.model.js';
import HttpError from '../utils/http.error.js';

class SubtaskServices {
    //#region CREATE
    static async createSubtask(taskId, data) {
        try {
            const task=await TaskModel.findById(taskId);
            if(!task) throw new HttpError('Task not found',404);
            const subtask = await SubtaskModel.create({ ...data, taskId });
            return subtask.toObject();
        } catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Create subtask error: ${e.message}`, 500);
        }
    }
    static async createSubtasks(taskId, data) {
        try {
            const task=await TaskModel.findById(taskId);
            if(!task) throw new HttpError('Task not found',404);

            const subtasks = await SubtaskModel.insertMany(data.map((subtask) => 
                ({ ...subtask, taskId })));
            return subtasks.map(s => s.toObject());
        } catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Create subtask error: ${e.message}`, 500);
        }
    }
    //#endregion
    //#region READ
    static async getSubtasks(taskId, query) {
        try {
            const filter = { taskId };
            const task=await TaskModel.findById(taskId);
            if(!task) throw new HttpError('Task not found',404);
            if(query.title){
                filter.title = { $regex: query.title, $options: 'i' };
            }
            if(query.isCompleted){
                filter.isCompleted = query.isCompleted;
            }
            const subtasks = await SubtaskModel.find(filter);
            return subtasks.map((subtask) => ({
                ...subtask.toObject(),
            }))
        } catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Get subtasks error: ${e.message}`,500);
        }
    }
    static async getSubtask(taskId, subtaskId) {
        try {
            const task=await TaskModel.findById(taskId);
            if(!task) throw new HttpError('Task not found',404);
            const subtask = await SubtaskModel.findOne({_id:subtaskId,taskId});
            if(!subtask) throw new HttpError('Subtask not found',404);
            return subtask.toObject();
        } catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Get subtask error: ${e.message}`, 500);
        }
    }
    //#endregion

    //#region UPDATE
    static async updateSubtaskFull(taskId,subtaskId,data) {
        try{
            const task=await TaskModel.findById(taskId);
            if(!task) throw new HttpError('Task not found',404);
            const subtask = await SubtaskModel.findOneAndUpdate(
                { _id:subtaskId,taskId },
                { ...data,taskId},
                { new: true,overwrite:true }
            );
            if(!subtask) throw new HttpError('Subtask not found',404);
            return {
                localId:data.localId,
                ...subtask.toObject()
            }
        } catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Update subtask error: ${e.message}`, 500);
        }
    }

    static async updateSubtaskPartial(taskId, subtaskId, data) {
        try{
            const task=await TaskModel.findById(taskId);
            if(!task) throw new HttpError('Task not found',404);
            const subtask = await SubtaskModel.findOneAndUpdate(
                { _id:subtaskId,taskId },
                { $set: data },
                { new: true }
            );
            if(!subtask) throw new HttpError('Subtask not found',404);
            return subtask.toObject();
        } catch (e) {
            if(e instanceof HttpError) throw e;
            throw new HttpError(`Update subtask error: ${e.message}`, 500);
        }
    }
    static async update_subtasks(subtasks) {
        try {
            const updatedSubtasks = await Promise.all(
                subtasks.map(async (subtask) => {
                    if (!subtask.id || typeof subtask !== 'object') {
                        return null;
                    }
                    const { id, localId, ...updateData } = subtask;
                    const result = await SubtaskModel.findOneAndUpdate(
                        { _id:id },
                        { $set: updateData },
                        { new: true }
                    );

                    if (!result) return null;
                    return parseInt(localId, 10);
                })
            );
            return updatedSubtasks.filter(subtask => subtask !== null);
        
        } catch (e) {
            throw new Error(`Update subtasks error: ${e.message}`);
        }
    }

    
    static async findByTaskIds(taskIds) {
        try {
            return await SubtaskModel.find({ taskId: { $in: taskIds } });
        } catch (e) {
            throw new Error(`Find subtasks by taskIds error: ${e.message}`);
        }
    }
    static async delete_all_subtasks(taskId) {
        try {
            return await SubtaskModel.deleteMany({ taskId });
        } catch (e) {
            throw new Error(`Delete all subtasks error: ${e.message}`);
        }
    }
    static async delete_subtask(subtaskId) {
        try{
            return await SubtaskModel.deleteOne({_id:subtaskId});
        }catch(e){
            throw new Error(`Delete subtask error: ${e.message}`);
        }
        
    }
}

export default SubtaskServices;
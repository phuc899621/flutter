import SubtaskModel from '../models/subtask.model.js';

class SubtaskServices {
    static async create_subtasks(taskId, subtasks) {
        try {
            const createSubtask=subtasks.map(subtask => ({
                ...subtask,
                taskId
            }));
            const result= await SubtaskModel.create(createSubtask);
            console.log(result);
            return result.map((doc, index) => ({
                localId: subtasks[index].localId,
                _id: doc._id
            }));
        } catch (e) {
            throw e;
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
    static async add_subtasks(taskId, subtasks) {
        try {
            const request=subtasks.map(subtask=>({
                taskId,
                ...subtask
            }))
            const result = await SubtaskModel.create(request);
            return result.map((doc, index) => ({
                localId: subtasks[index].localId,
                ...doc._doc
            }));
        } catch (e) {
            throw new Error(`Add subtasks error: ${e.message}`);
        }
    }
    static async findByTaskId(taskId, query) {
        try {
            const filter = { taskId };
            if(query.title){
                filter.title = { $regex: query.title, $options: 'i' };
            }
            if(query.isCompleted){
                filter.isCompleted = query.isCompleted;
            }
            return await SubtaskModel.find(filter);
        } catch (e) {
            throw new Error(`Find subtasks error: ${e.message}`);
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
const SubtaskModel = require('../model/subtask.model');
class SubtaskServices {
    static async addListSubtask(
        taskId,subtasks){
        try{
            return await SubtaskModel.addListSubtask(taskId,subtasks);
        }catch(e){
            throw e;
        }
    }
    static async addSubtask(
        taskId,subtask){
        try{
            return await SubtaskModel.addSubtask(taskId,subtask);
        }catch(e){
            throw e;
        }
    }
    static async updateSubtask(subtaskId,subtask){
        try{
            return await SubtaskModel.updateSubtask(subtaskId,subtask);
        }catch(e){
            throw e;
        }
    }
    static async deleteAllSubtasks(
        taskId){
        try{
            return await SubtaskModel.deleteAllSubtasks(taskId);
        }catch(e){
            throw e;
        }
    }
    static async deleteSubtask(
        subtaskId){
        try{
            return await SubtaskModel.deleteSubtask(subtaskId);
        }catch(e){
            throw e;
        }
    }
    static async deleteListSubtask(
        taskId,subtaskIds){
        try{
            return await SubtaskModel.deleteListSubtask(taskId,subtaskIds);
        }catch(e){
            throw e;
        }
    }
    static async findAllSubtasks(
        taskId,query){
        try{
            return await SubtaskModel.findAllSubtasks(taskId,query);
        }catch(e){
            throw e;
        }
    }
}
module.exports=SubtaskServices;
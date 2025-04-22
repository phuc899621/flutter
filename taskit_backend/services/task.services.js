const TaskModel=require('../model/task.model');
const bcrypt = require("bcryptjs");
class TaskServices{
    static async createTask(
        userId,title,description,
        dueDate,priority,category,subtasks){
        try{
            const createTask={
                userId,
                title,
                description,
                dueDate,
                subtasks,
                priority,
                category,
            };
            return await TaskModel.addTask(createTask);
        }catch(e){
            throw e;
        }
    }
    static async addListSubtask(taskId,subtasks){
        try{
            return await TaskModel.addListSubtask(taskId,subtasks);
        }catch(e){
            throw e;
        }
    }
    static async updateSubtask(taskId,subtaskId,updateData){
        try{
            return await TaskModel.updateSubtask(taskId,subtaskId,updateData);
        }catch(e){
            throw e;
        }
    }
    static async updateListSubtask(taskId,subtasks){
        try{
            return await TaskModel.updateListSubtask(taskId,subtasks);
        }catch(e){
            throw e;
        }
    }
    static async updateTask(taskId,updateData){
        try{
            return await TaskModel.updateTask(taskId,updateData);
        }catch(e){
            throw e;
        }
    }
    static async deleteTask(taskId){
        try{
            return await TaskModel.deleteTask(taskId);
        }catch(e){
            throw e;
        }
    }
    static async deleteSubtask(taskId,subtaskId){
        try{
            return await TaskModel.deleteSubtask(taskId,subtaskId);
        }catch(e){
            throw e;
        }
    }
    static async findTaskById(taskId){
        try{
            return await TaskModel.findTaskById(taskId);
        }catch(e){
            throw e;
        }
    }
    static async findAllTaskByUserId(userId,{status,dueDate}){
        try{
            return await TaskModel.findAllTaskByUserId(userId,{status,dueDate});
        }catch(e){
            throw e;
        }
    }
    static async findAllTaskByUserIdAndTaskId(userId,taskId){
        try{
            return await TaskModel.findAllTaskByUserIdAndTaskId(userId,taskId);
        }catch(e){
            throw e;
        }
    }

}
module.exports=TaskServices;
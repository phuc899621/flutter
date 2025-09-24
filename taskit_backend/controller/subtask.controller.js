import SubtaskServices from '../services/subtask.services.js';

export const createSubtask=async (req,res)=>{
    try{
        const {taskId}=req.params;
        const result=await SubtaskServices.createSubtask(taskId,req.body);
        return res.status(201).json({
            message:"Subtask created successfully",
            data:result
        });
    }catch(e){
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
export const createSubtasks=async (req,res)=>{
    try{
        const {taskId}=req.params;
        const {subtasks}=req.body;
        const result=await SubtaskServices.createSubtasks(taskId,subtasks);
        return res.status(201).json({
            message:"Multiple subtasks created successfully",
            data:result
        });
    }catch(e){
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}



export const getSubtasks = async (req, res) => {
    try {
        const { taskId } = req.params;
        const result = await SubtaskServices.getSubtasks(taskId, req.query);
        return res.status(200).json({
            message: "Subtasks retrieved successfully",
            data: result
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
export const getSubtask = async (req, res) => {
    try {
        const { taskId,subtaskId } = req.params;
        const result = await SubtaskServices.getSubtask(taskId,subtaskId);
        return res.status(200).json({
            message: "Subtask retrieved successfully",
            data: result
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}

export const updateSubtaskFull = async (req, res) => {
    try {
        const {taskId,subtaskId}=req.params;
        const result= await SubtaskServices.updateSubtaskFull(
            taskId,subtaskId,req.body
        );
        return res.status(200).json({
            message: "Subtask updated successfully",
            data: result
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
export const updateSubtaskPartial = async (req, res) => {
    try {
        const {taskId,subtaskId}=req.params;
        const result= await SubtaskServices.updateSubtaskPartial(
            taskId,subtaskId,req.body
        );
        return res.status(200).json({
            message: "Subtask updated successfully",
            data: result
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}


export const update_subtasks = async (req, res) => {
    try {
        const result= await SubtaskServices.update_subtasks(req.body.subtasks);
        return res.status(200).json({
            message: "Update subtask successfully",
            data: {
                subtasks: result
            }
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when update subtask: " + e.message,
            data: {}
        });
    }
}

export const delete_subtask = async (req, res) => {
    try {
        const { subtaskId } = req.params;
        await SubtaskServices.delete_subtask(subtaskId);
        return res.status(200).json({
            message: "Delete subtask successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when delete subtask: " + e.message,
            data: {}
        });
    }
}
export const delete_all_subtasks = async (req, res) => {
    try {
        const { taskId } = req.params;
        await SubtaskServices.delete_all_subtasks(taskId);
        return res.status(200).json({
            message: "Delete all subtask successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when delete all subtask: " + e.message,
            data: {}
        });
    }
}


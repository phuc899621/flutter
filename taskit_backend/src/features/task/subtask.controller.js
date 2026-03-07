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




export const deleteSubtask = async (req, res) => {
    try {
        const { taskId, subtaskId } = req.params;
        const result=await SubtaskServices.deleteSubtask(taskId, subtaskId);
        return res.status(200).json({
            message: "Subtask deleted successfully",
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
export const deleteAllSubtasks = async (req, res) => {
    try {
        const { taskId } = req.params;
        const result= await SubtaskServices.deleteAllSubtasks(taskId);
        return res.status(200).json({
            message: "Subtasks deleted successfully",
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


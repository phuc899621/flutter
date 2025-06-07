import SubtaskServices from '../services/subtask.services.js';


export const add_subtasks = async (req, res) => {
    try {
        const { taskId } = req.params;
        const {subtasks}=req.body;
        const result = await SubtaskServices.add_subtasks(taskId, subtasks);
        return res.status(201).json({
            message: "Add subtasks successfully",
            data: result
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when add list subtask: " + e.message,
            data: {}
        });
    }
}
export const get_subtasks = async (req, res) => {
    try {
        const { taskId } = req.params;
        const result = await SubtaskServices.findByTaskId(taskId, req.query);
        return res.status(200).json({
            message: "Get all subtasks successfully",
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
        await SubtaskServices.update_subtasks(req.body.subtasks);
        return res.status(200).json({
            message: "Update subtask successfully",
            data: {}
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


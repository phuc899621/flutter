const SubtaskServices = require('../services/subtask.services');
exports.addSubtask = async (req, res) => {
    try {
        const { taskId } = req.query;
        const subtask = req.body;
        if (!taskId) {
            return res.status(400).json({
                message: "Please give task id",
                data: {}
            });
        }
        if (!subtask) {
            return res.status(400).json({
                message: "Please enter all fields",
                data: {}
            });
        }
        const newSubtask = await SubtaskServices.addSubtask(taskId, subtask);
        return res.status(201).json({
            message: "Add subtask successfully",
            data: newSubtask
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when add subtask: " + e.message,
            data: {}
        });
    }
}
exports.addListSubtasks = async (req, res) => {
    try {
        const { taskId } = req.query;
        const { subtasks } = req.body;
        if (!taskId) {
            return res.status(400).json({
                message: "Please give task id",
                data: {}
            });
        }
        if (!subtasks) {
            return res.status(400).json({
                message: "Please enter all fields",
                data: {}
            });
        }
        const result = await SubtaskServices.addListSubtask(taskId, subtasks);
        return res.status(201).json({
            message: "Add list subtask successfully",
            data: {
                result,
            }
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when add list subtask: " + e.message,
            data: {}
        });
    }
}
exports.updateSubtask = async (req, res) => {
    try {
        const { subtaskId } = req.query;
        const subtask = req.body;
        if (!subtaskId) {
            return res.status(400).json({
                message: "Please give subtask id",
                data: {}
            });
        }
        if (!subtask) {
            return res.status(400).json({
                message: "Please enter all fields",
                data: {}
            });
        }
        await SubtaskServices.updateSubtask(subtaskId, subtask);
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
exports.deleteSubtask = async (req, res) => {
    try {
        const { subtaskId } = req.query;
        if (!subtaskId) {
            return res.status(400).json({
                message: "Please give subtask id",
                data: {}
            });
        }
        await SubtaskServices.deleteSubtask(subtaskId);
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
exports.deleteListSubtasks = async (req, res) => {
    try {
        const { subtaskIds } = req.body;
        if (!subtaskIds) {
            return res.status(400).json({
                message: "Please enter subtask ids",
                data: {}
            });
        }
        await SubtaskServices.deleteListSubtask(subtaskIds);
        return res.status(200).json({
            message: "Delete list subtask successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when delete list subtask: " + e.message,
            data: {}
        });
    }
}
exports.deleteAllSubtasks = async (req, res) => {
    try {
        const { taskId } = req.query;
        if (!taskId) {
            return res.status(400).json({
                message: "Please give task id",
                data: {}
            });
        }
        const result = await SubtaskServices.deleteAllSubtasks(taskId);
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
exports.findAllSubtasks = async (req, res) => {
    try {
        //if i have query
        const query = req.query;
        const { taskId } = req.query;
        if (!taskId) {
            return res.status(400).json({
                message: "Please give task id",
                data: {}
            });
        }
        const result = await SubtaskServices.findAllSubtasks(taskId, query);
        return res.status(200).json({
            message: "Get all subtasks successfully",
            data: result
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when get all subtasks: " + e.message,
            data: {}
        });
    }
}
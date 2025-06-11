import TaskServices from '../services/task.services.js';
import SubtaskServices from '../services/subtask.services.js';

export const create_task = async (req, res) => {
    try {
        const { title, description, 
         priority, 
            category, subtasks, localId,
            status,scheduledDate,hasScheduledTime,deadlineDate } = req.body;
        const userId = req.user.id; 
        const createBody={};
        const createSubtask=[];
        if(title) createBody.title = title;
        if(description) createBody.description = description;
        if(scheduledDate) createBody.scheduledDate = scheduledDate;
        if(hasScheduledTime) createBody.hasScheduledTime = hasScheduledTime;
        if(deadlineDate) createBody.deadlineDate = deadlineDate;
        if(status) createBody.status = status;
        if(priority) createBody.priority = priority;
        if(category) createBody.category = category;
        if(localId) createBody.localId = localId;
        if (subtasks && subtasks.length > 0) {
            createSubtask.push(...subtasks.map(subtask => ({
                ...subtask,
            })));
        }
        const result= await TaskServices.create(userId, createBody, createSubtask);
        return res.status(201).json({
            message: "Create task successfully",
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
export const get_task = async (req, res) => {
    try {
        const userId = req.user.id;
        const query= req.query || {};
        const result = await TaskServices.findByUserId(userId,query);
        return res.status(200).json({
            message: "Get all tasks successfully",
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

export const update_task = async (req, res) => {
    try {
        const { taskId } = req.params;
        await TaskServices.update_task(
            taskId, req.body
        );
        return res.status(200).json({
            message: "Update task successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}

export const delete_task = async (req, res) => {
    try {
        const {taskId}=req.params;
        await TaskServices.delete_task(taskId);
        return res.status(200).json({
            message: "Delete task successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when delete task: " + e.message,
            data: {}
        });
    }
}

export const delete_all_task = async (req, res) => {
    try {
        const userId = req.user.id;
         await TaskServices.delete_all_tasks(userId);
        return res.status(200).json({
            message: "Delete all task successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}

export const deleteListTasks = async (req, res) => {
    try {
        const { taskIds } = req.body;
        if (!taskIds) {
            return res.status(400).json({
                message: "Please give task ids",
                data: {}
            });
        }
        await TaskServices.deleteListTask(taskIds);
        return res.status(200).json({
            message: "Delete list task successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when delete list task: " + e.message,
            data: {}
        });
    }
}




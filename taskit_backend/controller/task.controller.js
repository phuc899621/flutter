import TaskServices from '../services/task.services.js';
import SubtaskServices from '../services/subtask.services.js';

export const createTask = async (req, res) => {
    try {
        const { title, description, 
         priority, 
            categoryId, subtasks, localId,
            status,hasTime,dueDate } = req.body;
        const userId = req.user.id; 
        const createBody={};
        const createSubtask=[];
        if(title) createBody.title = title;
        if(description) createBody.description = description;
        if(dueDate) createBody.dueDate = dueDate;
        if(hasTime) createBody.hasTime = hasTime;
        if(status) createBody.status = status;
        if(priority) createBody.priority = priority;
        if(categoryId) createBody.categoryId = categoryId;
        if(localId) createBody.localId = localId;
        if (subtasks && subtasks.length > 0) {
            createSubtask.push(...subtasks.map(subtask => ({
                ...subtask,
            })));
        }
        const result= await TaskServices.createTask(userId, createBody, createSubtask);
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
export const getTasks = async (req, res) => {
    try {
        const userId = req.user.id;
        const query= req.query || {};
        const result = await TaskServices.findByUserId(userId,query);
        return res.status(200).json({
            message: "Get tasks successfully",
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

export const updateTaskFull = async (req, res) => {
    try {
        const { taskId } = req.params;
        const result= await TaskServices.updateTaskFull(
            taskId, req.body
        );
        return res.status(200).json({
            message: "Update task successfully (full update)",
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
export const updateTaskPartial = async (req, res) => {
    try {
        const { taskId } = req.params;
        const result= await TaskServices.updateTaskPartial(
            taskId, req.body
        );
        return res.status(200).json({
            message: "Update task successfully (partial update)",
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
export const updateTasksBulk = async (req, res) => {
    try {
        const { ids,data } = req.body;
        const result= await TaskServices.updateTasksBulk(
            ids, data
        );
        return res.status(200).json({
            message: "Update bulk tasks successfully",
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
export const updateMultipleTasks = async (req, res) => {
    try {
        const { tasks } = req.body;
        const result= await TaskServices.updateMultipleTasks(
            tasks
        );
        return res.status(200).json({
            message: "Update multiple tasks successfully",
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

export const deleteTask = async (req, res) => {
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

export const deleteAllTasks = async (req, res) => {
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




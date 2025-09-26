import TaskServices from '../services/task.services.js';
import SubtaskServices from '../services/subtask.services.js';

//#region CREATE
export const createTask = async (req, res) => {
    try {
        const { title, description, 
         priority, 
            categoryId, subtasks, localId,
            status,hasTime,dueDate } = req.body;
        const userId = req.user.id; 
        const createTask={};
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
        const result= await TaskServices.createTask(userId, createTask, createSubtask);
        return res.status(201).json({
            message: "Task created successfully",
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
//#endregion

//#region READ
export const getTasks = async (req, res) => {
    try {
        const userId = req.user.id;
        const result = await TaskServices.getTasks(userId,req.query);
        return res.status(200).json({
            message: "Tasks retrieved successfully",
            meta: result.meta,
            data: result.data
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}

export const getSyncTasks = async (req, res) => {
    try {
        const userId = req.user.id;
        const {lastSyncTime} = req.query;
        const result = await TaskServices.getSyncTasks(userId,lastSyncTime);
        return res.status(200).json({
            message: "Tasks synced successfully",
            meta: result.meta,
            data: result.data
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}

export const getTask = async (req, res) => {
    try {
        const { taskId } = req.params;
        const result = await TaskServices.getTask(taskId);
        return res.status(200).json({
            message: "Task retrieved successfully",
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

//#endregion

//#region UPDATE
export const updateTaskFull = async (req, res) => {
    try {
        const { taskId } = req.params;
        const result= await TaskServices.updateTaskFull(
            taskId, req.body
        );
        return res.status(200).json({
            message: "Task updated successfully",
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
            message: "Task partially updated successfully",
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
            message: "Bulk update completed successfully",
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
            message: "Tasks updated successfully (multiple contents)",
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
//#endregion

//#region DELETE

export const deleteTask = async (req, res) => {
    try {
        const userId = req.user.id;
        const {taskId}=req.params;
        const result =await TaskServices.deleteTask(userId,taskId);
        return res.status(200).json({
            message: "Delete task successfully",
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

export const deleteBulkTasks = async (req, res) => {
    try {
        const userId = req.user.id;
        const {ids}=req.body;
        const result= await TaskServices.deleteBulkTasks(userId,ids);
        return res.status(200).json({
            message: "Delete multiple tasks successfully",
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



//#endregion
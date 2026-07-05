import { reminderQueue } from "../../config/bullmq.js";
import { scheduleReminder } from "../../shared/services/reminder.service.js";
import TaskServices from "./task.services.js";

//#region CREATE
export const createTask = async (req, res, next) => {
  try {
    console.log("Create task request body:", req.body);
    const data = req.body;
    data.userId = req.user.userId;
    data.sessionId = req.sessionId;
    const result = await TaskServices.createTask(data);
    return res.status(201).json({
      message: "Task created successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
//#endregion

//#region READ
export const getTasks = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    const result = await TaskServices.getTasks(userId, req.query);
    return res.status(200).json({
      message: "Tasks retrieved successfully",
      meta: result.meta,
      data: result.data,
    });
  } catch (e) {
    next(e);
  }
};

export const getSyncTasks = async (req, res) => {
  try {
    const userId = req.user.id;
    const { lastSyncTime } = req.query;
    const result = await TaskServices.getSyncTasks(userId, lastSyncTime);
    return res.status(200).json({
      message: "Tasks synced successfully",
      meta: result.meta,
      data: result.data,
    });
  } catch (e) {
    const statusCode = e.statusCode || 500;
    return res.status(statusCode).json({
      message: e.message,
      data: {},
    });
  }
};

export const getTask = async (req, res) => {
  try {
    const { taskId } = req.params;
    const result = await TaskServices.getTask(taskId);
    return res.status(200).json({
      message: "Task retrieved successfully",
      data: result,
    });
  } catch (e) {
    const statusCode = e.statusCode || 500;
    return res.status(statusCode).json({
      message: e.message,
      data: {},
    });
  }
};
export const syncTasks = async (req, res, next) => {
  try {
    const { tasks } = req.body;
    const userId = req.user.userId;
    const sessionId = req.sessionId;
    const result = await TaskServices.syncTasks(userId, sessionId, tasks);
    return res.status(200).json({
      message: "Tasks synced successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const pullTasks = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    const lastSyncTime = req.query.lastSyncTime;
    console.log(userId, lastSyncTime);
    const tasks = await TaskServices.pullTasks(userId, lastSyncTime);
    return res.status(200).json({
      message: "Tasks pull successfully",
      data: tasks,
    });
  } catch (e) {
    next(e);
  }
};
export const syncDeletedTasks = async (req, res, next) => {
  try {
    const { tasks } = req.body;
    const userId = req.user.userId;
    const sessionId = req.sessionId;
    const result = await TaskServices.syncDeletedTasks(
      userId,
      sessionId,
      tasks,
    );
    return res.status(200).json({
      message: "Deleted tasks synced successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
//#endregion

//#region UPDATE
export const updateTask = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    const sessionId = req.sessionId;
    const { taskId } = req.params;
    const result = await TaskServices.updateTask(
      userId,
      sessionId,
      taskId,
      req.body,
    );
    return res.status(200).json({
      message: "Task updated successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const updateTasksBulk = async (req, res) => {
  try {
    const { ids, data } = req.body;
    const result = await TaskServices.updateTasksBulk(ids, data);
    return res.status(200).json({
      message: "Bulk update completed successfully",
      data: result,
    });
  } catch (e) {
    const statusCode = e.statusCode || 500;
    return res.status(statusCode).json({
      message: e.message,
      data: {},
    });
  }
};
export const updateMultipleTasks = async (req, res) => {
  try {
    const { tasks } = req.body;
    const result = await TaskServices.updateMultipleTasks(tasks);
    return res.status(200).json({
      message: "Tasks updated successfully (multiple contents)",
      data: result,
    });
  } catch (e) {
    const statusCode = e.statusCode || 500;
    return res.status(statusCode).json({
      message: e.message,
      data: {},
    });
  }
};
//#endregion

//#region DELETE

export const deleteTask = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    const sessionId = req.sessionId;
    const { taskId } = req.params;
    const result = await TaskServices.deleteTask(userId, sessionId, taskId);
    return res.status(200).json({
      message: "Delete task successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};

export const deleteBulkTasks = async (req, res) => {
  try {
    const userId = req.user.id;
    const { ids } = req.body;
    const result = await TaskServices.deleteBulkTasks(userId, ids);
    return res.status(200).json({
      message: "Delete multiple tasks successfully",
      data: result,
    });
  } catch (e) {
    const statusCode = e.statusCode || 500;
    return res.status(statusCode).json({
      message: e.message,
      data: {},
    });
  }
};

//#endregion

export const testQueue = async (req, res, next) => {
  try {
    await scheduleReminder({
      message: "Hello",
      delay: 5000,
      fcmToken: req.body.fcmToken,
    });
    res.status(200).json({
      message: "Task scheduled successfully",
    });
  } catch (e) {
    next(e);
  }
};

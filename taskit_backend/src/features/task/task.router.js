import express from "express";
import * as TaskController from "./task.controller.js";
import * as SubtaskController from "./subtask.controller.js";
import { authMiddleware } from "../../middleware/auth.middleware.js";
import {
  createTaskValidate,
  deleteTaskValidate,
  getTasksValidate,
  getTaskValidate,
  pullTasksValidate,
  syncDeletedValidate,
  syncTasksValidate,
  updateTaskValidate,
} from "./task.validate.js";
import { sessionMiddleware } from "../../middleware/session.middleware.js";
import {
  createSubtaskValidate,
  updateSubtaskValidate,
  deleteSubtaskValidate,
} from "./subtask.validate.js";
const router = express.Router();
router.post(
  "/",
  sessionMiddleware,
  createTaskValidate,
  TaskController.createTask,
);
router.get("/queue", TaskController.testQueue);
router.get(
  "/pull",
  authMiddleware,
  pullTasksValidate,
  TaskController.pullTasks,
);
router.get("/", authMiddleware, getTasksValidate, TaskController.getTasks);

router.get("/:taskId", authMiddleware, getTaskValidate, TaskController.getTask);

router.post(
  "/sync",
  sessionMiddleware,
  syncTasksValidate,
  TaskController.syncTasks,
);
router.delete(
  "/sync",
  sessionMiddleware,
  syncDeletedValidate,
  TaskController.syncDeletedTasks,
);

router.put(
  "/:taskId",
  sessionMiddleware,
  updateTaskValidate,
  TaskController.updateTask,
);

router.delete(
  "/:taskId",
  sessionMiddleware,
  deleteTaskValidate,
  TaskController.deleteTask,
);

router.post(
  "/:taskId/subtasks",
  sessionMiddleware,
  createSubtaskValidate,
  SubtaskController.createSubtask,
);

router.put(
  "/:taskId/subtasks/:subtaskId",
  sessionMiddleware,
  updateSubtaskValidate,
  SubtaskController.updateSubtask,
);

router.delete(
  "/:taskId/subtasks/:subtaskId",
  sessionMiddleware,
  deleteSubtaskValidate,
  SubtaskController.deleteSubtask,
);

export default router;

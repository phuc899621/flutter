import express from "express";
import * as TaskController from "./task.controller.js";
import * as SubtaskController from "./subtask.controller.js";
import * as TaskMiddleware from "./task.middleware.js";
import * as SubtaskMiddleware from "./subtask.middleware.js";
import { authMiddleware } from "../../middleware/auth.middleware.js";
import {
  createTaskValidate,
  deleteTaskValidate,
  getTasksValidate,
  getTaskValidate,
  updateTaskValidate,
} from "./task.validate.js";
import { sessionMiddleware } from "../../middleware/session.middleware.js";
const router = express.Router();
router.post(
  "/",
  sessionMiddleware,
  createTaskValidate,
  TaskController.createTask,
);

router.get("/", authMiddleware, getTasksValidate, TaskController.getTasks);

router.get("/:taskId", authMiddleware, getTaskValidate, TaskController.getTask);

/**
 * @openapi
 * '/api/tasks/bulk':
 *   patch:
 *     tags:
 *       - Tasks
 *     summary: Bulk update multiple tasks
 *     description: |
 *          Update multiple tasks at once with the same content.
 *          - Provide a list of task IDs object and an object of data to update
 *          - For unmatched task IDs, the tasks will be skipped
 *          Returns the list of updated task Ids and skipped tasks Ids.
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       require: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               ids:
 *                  type: array
 *                  items:
 *                     type: object
 *                     properties:
 *                         id:
 *                             type: string
 *                             example: '507f1f77bcf86cd799439011'
 *                             required: true
 *                         localId:
 *                             type: int
 *                             example: 13
 *               data:
 *                  required: true
 *                  type: object
 *                  properties:
 *                     title:
 *                        type: string
 *                        example: 'Travel to New York'
 *                     description:
 *                        type: string
 *                        example: 'Buy tickets to New York'
 *                     categoryId:
 *                        type: string
 *                        example: '43532sdf32fds3'
 *                     dueDate:
 *                        type: string
 *                        format: date-time
 *                        nullable: true
 *                        example: "2025-09-20T17:00:00.000Z"
 *                     hasTime:
 *                        type: boolean
 *                        description: Indicates whether the task has a specific time or just a date
 *                        example: false
 *                     priority:
 *                        type: string
 *                        enum: [low, medium, high, none]
 *                        exanple: low
 *                     status:
 *                        type: string
 *                        enum: [scheduled, pending, completed]
 *                        example: scheduled
 *     responses:
 *       200:
 *         description: Bulk update completed successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Bulk update completed successfully
 *                  data:
 *                    type: object
 *                    properties:
 *                      matchedCount:
 *                        type: int
 *                        example: 2
 *                      modifiedCount:
 *                        type: int
 *                        example: 2
 *                      updated:
 *                        type: array
 *                        items:
 *                          type: object
 *                          properties:
 *                              id:
 *                                  type: string
 *                                  example: '507f1f77bcf86cd799439011'
 *                              localId:
 *                                  type: int
 *                                  example: 13
 *                      skipped:
 *                        type: array
 *                        items:
 *                          type: object
 *                          properties:
 *                              id:
 *                                  type: string
 *                                  example: '507f1f77bcf86cd799439011'
 *                              localId:
 *                                  type: int
 *                                  example: 13
 *                              reason:
 *                                  type: string
 *                                  example: 'Task not found'
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.patch(
  "/bulk",
  authMiddleware,
  TaskMiddleware.updateTasksBulkMiddleware,
  TaskController.updateTasksBulk,
);

/**
 * @openapi
 * '/api/tasks/bulk/multiple':
 *   patch:
 *     tags:
 *       - Tasks
 *     summary: Bulk update multiple tasks with different update data.
 *     description: |
 *          Update multiple tasks at once with different values.
 *          - The client must provide an array of task object, which contains taskId and updating data
 *          - For unmatched task/category ids, the tasks will be skipped
 *          Returns the list of updated task Ids and skipped tasks Ids.
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       require: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               tasks:
 *                  type: array
 *                  items:
 *                     type: object
 *                     properties:
 *                         id:
 *                             required: true
 *                             type: string
 *                             example: '507f1f77bcf86cd799439011'
 *                         localId:
 *                             type: int
 *                             example: 13
 *                         data:
 *                             type: object
 *                             properties:
 *                                 title:
 *                                     type: string
 *                                     example: 'Travel to New York'
 *                                 description:
 *                                     type: string
 *                                     example: 'Buy tickets to New York'
 *                                 categoryId:
 *                                     type: string
 *                                     example: '43532sdf32fds3'
 *                                 dueDate:
 *                                     type: string
 *                                     format: date-time
 *                                     nullable: true
 *                                     example: "2025-09-20T17:00:00.000Z"
 *                                 hasTime:
 *                                     type: boolean
 *                                     description: Indicates whether the task has a specific time or just a date
 *                                     example: false
 *                                 priority:
 *                                     type: string
 *                                     enum: [low, medium, high, none]
 *                                     exanple: low
 *                                 status:
 *                                     type: string
 *                                     enum: [scheduled, pending, completed]
 *                                     example: scheduled
 *     responses:
 *       200:
 *         description: Tasks updated successfully (multiple contents)
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Tasks updated successfully (multiple contents)
 *                  data:
 *                    type: object
 *                    properties:
 *                      matchedCount:
 *                        type: int
 *                        example: 2
 *                      modifiedCount:
 *                        type: int
 *                        example: 2
 *                      updated:
 *                        type: array
 *                        items:
 *                          type: object
 *                          properties:
 *                              id:
 *                                  type: string
 *                                  example: '507f1f77bcf86cd799439011'
 *                              localId:
 *                                  type: int
 *                                  example: 13
 *                      skipped:
 *                        type: array
 *                        items:
 *                          type: object
 *                          properties:
 *                              id:
 *                                  type: string
 *                                  example: '507f1f77bcf86cd799439011'
 *                              localId:
 *                                  type: int
 *                                  example: 13
 *                              reason:
 *                                  type: string
 *                                  example: 'Task not found'
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.patch(
  "/bulk/multiple",
  authMiddleware,
  TaskMiddleware.updateMultipleTasksMiddleware,
  TaskController.updateMultipleTasks,
);

router.put(
  "/:taskId",
  sessionMiddleware,
  updateTaskValidate,
  TaskController.updateTask,
);

// router.delete(
//   "/",
//   authMiddleware,
//   TaskMiddleware.deleteBulkTasksMiddleware,
//   TaskController.deleteBulkTasks,
// );

router.delete(
  "/:taskId",
  sessionMiddleware,
  deleteTaskValidate,
  TaskController.deleteTask,
);

router.get(
  "/:taskId/subtasks",
  authMiddleware,
  SubtaskMiddleware.getSubtasksMiddleware,
  SubtaskController.getSubtasks,
);

router.get(
  "/:taskId/subtasks/:subtaskId",
  authMiddleware,
  SubtaskMiddleware.getSubtaskMiddleware,
  SubtaskController.getSubtask,
);

router.post(
  "/:taskId/subtasks",
  authMiddleware,
  SubtaskMiddleware.createSubtaskMiddleware,
  SubtaskController.createSubtask,
);

router.post(
  "/:taskId/subtasks/bulk",
  authMiddleware,
  SubtaskMiddleware.createSubtasksMiddleware,
  SubtaskController.createSubtasks,
);

router.put(
  "/:taskId/subtasks/:subtaskId",
  authMiddleware,
  SubtaskMiddleware.updateSubtaskFullMiddleware,
  SubtaskController.updateSubtaskFull,
);
router.patch(
  "/:taskId/subtasks/:subtaskId",
  authMiddleware,
  SubtaskMiddleware.updateSubtaskPartialMiddleware,
  SubtaskController.updateSubtaskPartial,
);
router.delete(
  "/:taskId/subtasks",
  authMiddleware,
  SubtaskMiddleware.deleteAllSubtasksMiddleware,
  SubtaskController.deleteAllSubtasks,
);

router.delete(
  "/:taskId/subtasks/:subtaskId",
  authMiddleware,
  SubtaskMiddleware.deleteSubtaskMiddleware,
  SubtaskController.deleteSubtask,
);

export default router;

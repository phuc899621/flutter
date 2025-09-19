import express from 'express';
import * as TaskController from '../controller/task.controller.js';
import * as SubtaskController from '../controller/subtask.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';
import * as TaskMiddleware from '../middleware/task.middleware.js';
import * as SubtaskMiddleware from '../middleware/subtask.middleware.js';

const router = express.Router();
/** 
 * @openapi
 * '/api/tasks':
 *   get:
 *     tags:
 *       - Tasks
 *     summary: Get all tasks 
 *     description: Get all tasks base on user's account
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Get tasks successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Get tasks successfully
 *                  data:
 *                    type: array
 *                    items:
 *                      $ref: '#/components/schemas/TaskWithSubtasks'
 *       401:
 *         $ref: '#/components/responses/401'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.get('/', jwtMiddleware, TaskController.getTasks);

/** 
 * @openapi
 * '/api/tasks':
 *   post:
 *     tags:
 *       - Tasks
 *     summary: Create new task
 *     description: Create new task with title and optional information
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *      require: true
 *      content:
 *        application/json:
 *          schema:
 *            type: object
 *            required:
 *              - title
 *              - categoryId
 *            properties:
 *              title:
 *                  type: string
 *                  example: 'Learn how to drive'
 *              description:
 *                  type: string
 *                  example: ''
 *              categoryId:
 *                  type: string
 *                  example: '43532sdf32fds3'
 *              dueDate:
 *                  type: string
 *                  format: date-time
 *                  nullable: true
 *                  example: "2025-09-20T17:00:00.000Z"
 *              hasTime:
 *                  type: boolean
 *                  description: Indicates whether the task has a specific time or just a date
 *                  example: false
 *              priority:
 *                  type: string
 *                  enum: [low, medium, high, none]
 *                  exanple: low
 *              status:
 *                  type: string
 *                  enum: [scheduled, pending, completed]
 *                  example: scheduled
 *                 
 *     responses:
 *       200:
 *         description: Create tasks successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Get tasks successfully
 *                  data:
 *                    type: array
 *                    items:
 *                      $ref: '#/components/schemas/Task'
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/schemas/401'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.post('/', jwtMiddleware,TaskMiddleware.createTaskMiddleware, TaskController.createTask);

/** 
 * @openapi
 * '/api/tasks/bulk':
 *   patch:
 *     tags:
 *       - Tasks
 *     summary: Bulk update tasks
 *     description: >
 *          Update multiple tasks at once with the same value. 
 *          The client must provide an array of Ids object, 
 *          along with the data to update for all tasks
 *          For unmatched task/category ids, the tasks will be skipped
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
 *                         taskId:
 *                             type: string
 *                             example: '507f1f77bcf86cd799439011'
 *                             required: true
 *                         taskLocalId:
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
 *         description: Bulk update tasks successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Update bulk tasks successfully 
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
 *                              taskId:
 *                                  type: string
 *                                  example: '507f1f77bcf86cd799439011'
 *                              taskLocalId:
 *                                  type: int
 *                                  example: 13
 *                      skipped:       
 *                        type: array
 *                        items:
 *                          type: object
 *                          properties:
 *                              taskId:
 *                                  type: string
 *                                  example: '507f1f77bcf86cd799439011'
 *                              taskLocalId:
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
router.patch('/bulk', jwtMiddleware, TaskMiddleware.updateTasksBulkMiddleware, TaskController.updateTasksBulk);

/** 
 * @openapi
 * '/api/tasks/bulk/multiple':
 *   patch:
 *     tags:
 *       - Tasks
 *     summary: Multiple update tasks
 *     description: >
 *          Update multiple tasks at once with different values. 
 *          The client must provide an array of task object, which contains taskId and updating data 
 *          For unmatched task/category ids, the tasks will be skipped
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
 *                         taskId:
 *                             required: true
 *                             type: string
 *                             example: '507f1f77bcf86cd799439011'
 *                         taskLocalId:
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
 *         description: Bulk update tasks successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Bulk update tasks successfully 
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
 *                              taskId:
 *                                  type: string
 *                                  example: '507f1f77bcf86cd799439011'
 *                              taskLocalId:
 *                                  type: int
 *                                  example: 13
 *                      skipped:       
 *                        type: array
 *                        items:
 *                          type: object
 *                          properties:
 *                              taskId:
 *                                  type: string
 *                                  example: '507f1f77bcf86cd799439011'
 *                              taskLocalId:
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
router.patch('/bulk/multiple', jwtMiddleware, TaskMiddleware.updateMultipleTasksMiddleware, TaskController.updateMultipleTasks);

/** 
 * @openapi
 * '/api/tasks/{taskId}':
 *   put:
 *     tags:
 *       - Tasks
 *     summary: Update full task information
 *     description: |
 *          Updates the entire information of a task identified by taskId.
 *          The field 'taskLocalId' is an optional field that can be used to mark the updating of a local task.
 *          This operation will overwrite all existing fields of the task with the new data provided in the request body.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd799439011
 *     requestBody:
 *       require: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - title
 *               - hasTime
 *               - priority
 *               - status
 *               - categoryId
 *             properties:
 *               title:
 *                  type: string
 *                  example: 'Trip to Da Nang'
 *               taskLocalId:
 *                  type: int
 *                  example: 13
 *                  description: The local id of task (usually used in local database)  
 *               description:
 *                  type: string
 *                  example: 'Book flights, hotel, and prepare itinerary for Da Nang trip'
 *               categoryId:
 *                  type: string
 *                  example: 60df59f2fc13ae1c4e000001
 *               dueDate:
 *                  type: string
 *                  format: date-time
 *                  nullable: true
 *                  example: 2025-09-20T17:00:00.000Z
 *               hasTime:
 *                  type: boolean
 *                  description: Indicates whether the task has a specific time or just a date
 *                  example: false
 *               priority:
 *                  type: string
 *                  enum: [low, medium, high, none]
 *                  exanple: low
 *               status: 
 *                  type: string
 *                  enum: [pending, inProgress, completed]
 *                  example: pending
 *                 
 *     responses:
 *       200:
 *         description: Update full task's field successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Update task successfully (full update) 
 *                  data: 
 *                    type: object
 *                    properties:
 *                      taskLocalId:
 *                        type: int
 *                        example: 13
 *                        description: The local id of task (usually used in local database)
 *                      taskId:
 *                        type: string
 *                        example: 66fdc011c0662027f2361
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.put('/:taskId', jwtMiddleware, TaskMiddleware.updateTaskFullMiddleware ,TaskController.updateTaskFull);

/** 
 * @openapi
 * '/api/tasks/{taskId}':
 *   patch:
 *     tags:
 *       - Tasks
 *     summary: Update partial task information
 *     description: |
 *          Updates one or more fields of a task identified by taskId.
 *          The field 'taskLocalId' is an optional field that can be used to mark the updating of a local task.
 *          This operation will only overwrite the specified fields of the task with the new data provided in the request body.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd799439011
 *     requestBody:
 *       require: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               title:
 *                  type: string
 *                  example: 'Trip to Da Nang'
 *               taskLocalId:
 *                  type: int
 *                  example: 13
 *                  description: The local id of task (usually used in local database)  
 *               description:
 *                  type: string
 *                  example: 'Book flights, hotel, and prepare itinerary for Da Nang trip'
 *               categoryId:
 *                  type: string
 *                  example: 60df59f2fc13ae1c4e000001
 *               dueDate:
 *                  type: string
 *                  format: date-time
 *                  nullable: true
 *                  example: 2025-09-20T17:00:00.000Z
 *               hasTime:
 *                  type: boolean
 *                  description: Indicates whether the task has a specific time or just a date
 *                  example: false
 *               priority:
 *                  type: string
 *                  enum: [low, medium, high, none]
 *                  exanple: low
 *               status: 
 *                  type: string
 *                  enum: [pending, inProgress, completed]
 *                  example: pending
 *                 
 *     responses:
 *       200:
 *         description: Update partial task's field successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Update task successfully (partial update)
 *                  data: 
 *                    type: object
 *                    properties:
 *                      taskLocalId:
 *                        type: int
 *                        example: 13
 *                        description: The local id of task (usually used in local database)
 *                      taskId:
 *                        type: string
 *                        example: 66fdc011c0662027f2361
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.patch('/:taskId', jwtMiddleware, TaskMiddleware.updateTaskPartialMiddleware,TaskController.updateTaskPartial);



router.delete('/', jwtMiddleware, TaskController.deleteAllTasks);
router.delete('/:taskId', jwtMiddleware,TaskMiddleware.deleteTaskMiddleware, TaskController.deleteTask);

router.get('/:taskId/subtask', jwtMiddleware, SubtaskController.get_subtasks);
router.post('/:taskId/subtask', jwtMiddleware, SubtaskMiddleware.add_subtasks, SubtaskController.add_subtasks);
router.delete('/:taskId/subtask', jwtMiddleware, SubtaskMiddleware.delete_all_subtasks, SubtaskController.delete_all_subtasks);

export default router;
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
 *   post:
 *     tags:
 *       - Tasks
 *     summary: Create a new task (optionally including subtasks)
 *     description: |
 *       This endpoint allows user to create a new task
 *       - Send task details in the request body 
 *       - The 'title' field is a must-have field, other fields are optional
 *       - The 'localId' field is an optional field, which is used to mark the local id of the task
 *       - The 'subtasks' field is an optional field, which is used to create subtasks for the task
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
 *            properties:
 *              localId:
 *                  type: integer
 *                  example: 1
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
 *              subtasks:
 *                  type: array
 *                  items:
 *                      type: object
 *                      properties:
 *                          title:
 *                              type: string
 *                              example: "Book flight tickets"
 *                          isCompleted:
 *                              type: boolean
 *                              example: false
 *     responses:
 *       201:
 *         description: Task created successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Task created successfully
 *                  data:
 *                    type: array
 *                    items:
 *                      type: object
 *                      properties:
 *                          id: 
 *                            type: string
 *                            example: "66fdc011c0662027f2361"
 *                          userId:
 *                            type: string
 *                            example: "60df59f2fc13ae1c4e000001"
 *                          localId:
 *                            type: integer
 *                            example: 1
 *                          title:
 *                            type: string
 *                            example: "Learn how to drive"
 *                          description:
 *                            type: string
 *                            example: ""
 *                          categoryId:
 *                            type: string
 *                            example: "60df59f2fc13ae1c4e000001"
 *                          dueDate:
 *                            type: string
 *                            format: date-time
 *                            nullable: true
 *                            example: "2025-09-20T17:00:00.000Z"
 *                          hasTime:
 *                            type: boolean
 *                            description: Indicates whether the task has a specific time or just a date
 *                            example: false
 *                          priority:
 *                            type: string
 *                            enum: [low, medium, high, none]
 *                            exanple: low
 *                          status:
 *                            type: string
 *                            enum: [scheduled, pending, completed]
 *                            example: scheduled
 *                          createdAt:
 *                            type: string
 *                            format: date-time
 *                            example: "2023-09-20T17:00:00.000Z"
 *                          updatedAt:
 *                            type: string
 *                            format: date-time
 *                            example: "2023-09-20T17:00:00.000Z"
 *                          subtasks:
 *                            type: array
 *                            items:
 *                              $ref: '#/components/schemas/SubtaskWithLocalId'
 *       400:
 *         $ref: '#/components/responses/400'
 *         
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.post('/', jwtMiddleware,TaskMiddleware.createTaskMiddleware, TaskController.createTask);


/** 
 * @openapi
 * '/api/tasks':
 *   get:
 *     tags:
 *       - Tasks
 *     summary: Get a list of tasks 
 *     description: |
 *          Retrieve a paginated list of tasks.
 *          - Supports optional query parameters for filtering and pagination
 *              - page: The page number (default: 1)
 *              - limit: The number of items per page (default: 10)
 *              - title: Filter by task title
 *              - categoryId: Filter by category ID
 *              - dueDate: Filter by due date
 *              - hasTime: Filter by whether the task has a specific time or just a date
 *              - priority: Filter by task priority
 *              - status: Filter by task status
 *              - title: Filter by task title
 *              - sortBy: The field to sort by (default: createdAt)
 *              - sortOrder: The order to sort by (default: desc)
 * 
 *              
 *
 * 
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: page
 *         in: query
 *         required: false
 *         schema:
 *           type: integer
 *           example: 1
 *       - name: limit
 *         in: query
 *         required: false
 *         schema:
 *           type: integer
 *           example: 10 
 *       - name: title
 *         in: query
 *         required: false
 *         schema:
 *           type: string
 *           example: 'Learn how to drive'
 *       - name: categoryId
 *         in: query
 *         required: false
 *         schema:
 *           type: string
 *           example: '43532sdf32fds3'
 *       - name: dueDate
 *         in: query
 *         required: false
 *         schema:
 *           type: string
 *           format: date-time
 *           nullable: true
 *           example: "2025-09-20T17:00:00.000Z"
 *       - name: hasTime
 *         in: query
 *         required: false
 *         schema:
 *           type: boolean
 *           description: Indicates whether the task has a specific time or just a date
 *           example: false
 *       - name: priority
 *         in: query
 *         required: false
 *         schema:
 *           type: string
 *           enum: [low, medium, high, none]
 *           example: low
 *       - name: status
 *         in: query
 *         required: false
 *         schema:
 *           type: string
 *           enum: [scheduled, pending, completed]
 *           example: scheduled
 *       - name: sortBy
 *         in: query
 *         required: false
 *         schema:
 *           type: string
 *           enum: [createdAt, updatedAt, dueDate]
 *           example: createdAt
 *       - name: orderBy
 *         in: query
 *         required: false
 *         schema:
 *           type: string
 *           enum: [asc, desc]
 *           example: asc
 *     responses:
 *       200:
 *         description: Tasks retrieved successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Tasks retrieved successfully
 *                  meta:
 *                    type: object
 *                    properties:
 *                      page:
 *                        type: integer
 *                        description: current page
 *                        example: 1
 *                      limit:
 *                        type: integer
 *                        description: number of tasks per page
 *                        example: 10
 *                      total:
 *                        type: integer
 *                        description: total number of tasks
 *                        example: 10
 *                      pages:
 *                        type: integer
 *                        description: total number of pages
 *                        example: 1
 *                      orderBy:
 *                        type: string
 *                        enum: [createdAt, updatedAt, dueDate]
 *                        example: createdAt
 *                      sortBy:
 *                        enum: [asc, desc]
 *                        type: string
 *                        example: asc
 *                  data:
 *                    type: array
 *                    items:
 *                      $ref: '#/components/schemas/TaskWithSubtasks'
 *       400:              
 *         $ref: '#/components/responses/400'   
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.get('/', jwtMiddleware, TaskMiddleware.getTasksMiddleware, TaskController.getTasks);

/** 
 * @openapi
 * '/api/tasks/sync':
 *   get:
 *     tags:
 *       - Tasks
 *     summary: Sync tasks
 *     description: |
 *        Retrieve all tasks for the authenticated user for synchronization purposes.
 *        - Returns all tasks for the authenticated user without pagination.
 *        - Optional field: 'lastSyncTime' to specify the last synchronization time.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: lastSyncTime
 *         in: query
 *         required: false
 *         schema:
 *           type: string
 *           format: date-time
 *           example: "2023-09-20T17:00:00.000Z"
 *     responses:
 *       200:
 *         description: Tasks synced successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Tasks synced successfully
 *                  meta:
 *                    type: object
 *                    properties:
 *                      total:
 *                        type: integer
 *                        description: total number of tasks
 *                        example: 10
 *                  data:
 *                    type: array
 *                    items:
 *                      $ref: '#/components/schemas/TaskWithSubtasks'
 *       400:              
 *         $ref: '#/components/responses/400'   
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.get('/sync', jwtMiddleware, TaskMiddleware.getSyncTasksMiddleware, TaskController.getSyncTasks);

/** 
 * @openapi
 * '/api/tasks/{taskId}':
 *   get:
 *     tags:
 *       - Tasks
 *     summary: Get single task details
 *     description: |
 *        Retrieve details of a specific task including subtasks for the authenticated user using the task ID.
 *        - The task ID is required as a path parameter.
 *        - Return the details of the task if found.
 *        - Return 404 if the task is not found.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 43532sdf32fds3
 *     responses:
 *       200:
 *         description: Task retrieved successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Task retrieved successfully
 *                  data:
 *                    type: array
 *                    items:
 *                      $ref: '#/components/schemas/TaskWithSubtasks'
 *       400:              
 *         $ref: '#/components/responses/400'   
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.get(':taskId', jwtMiddleware, TaskMiddleware.getTaskMiddleware, TaskController.getTask);

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
router.patch('/bulk', jwtMiddleware, TaskMiddleware.updateTasksBulkMiddleware, TaskController.updateTasksBulk);

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
 *               localId:
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
 *         description: Task updated successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Task updated successfully
 *                  data: 
 *                    type: object
 *                    properties:
 *                      localId:
 *                        type: int
 *                        example: 13
 *                        description: The local id of task (usually used in local database)
 *                      id:
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
 *     summary: Partially update a task by ID.
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
 *               localId:
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
 *         description: Task partially updated successfully
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
 *                      localId:
 *                        type: int
 *                        example: 13
 *                        description: The local id of task (usually used in local database)
 *                      id:
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

/** 
 * @openapi
 * '/api/tasks':
 *   delete:
 *     tags:
 *       - Tasks
 *     summary: Delete tasks and related subtasks by tasks ID.
 *     description: |
 *          Remove multiple tasks identified by taskIds including all its subtasks.
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
 *                     type: string
 *                     example: 507f1f77bcf86cd799439011
 * 
 *     responses:
 *       200:
 *         description: Multiple tasks and related subtasks deleted successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Delete multiple tasks successfully
 *                  data: 
 *                    type: object
 *                    properties:
 *                      deleteCount:
 *                        type: int
 *                        example: 2
 *                      deleteFailed:
 *                        type: int
 *                        example: 0
 *                      deletedTasks:
 *                        type: array
 *                        items:
 *                          type: object
 *                          properties:
 *                              taskId:
 *                                  type: string
 *                                  example: '507f1f77bcf86cd799439011'
 *                              subtaskIds:
 *                                  type: array
 *                                  items:
 *                                      type: string
 *                                      example: '507f1f77bcf86cd799439011'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.delete('/', jwtMiddleware, TaskMiddleware.deleteBulkTasksMiddleware, TaskController.deleteBulkTasks);

/** 
 * @openapi
 * '/api/tasks/{taskId}':
 *   delete:
 *     tags:
 *       - Tasks
 *     summary: Delete a task and related subtasks by task ID.
 *     description: |
 *          Remove a task identified by taskId including all its subtasks.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd799439011
 *     responses:
 *       200:
 *         description: Task and related subtasks deleted successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Delete task successfully
 *                  data: 
 *                    type: object
 *                    properties:
 *                      taskId:
 *                        type: string
 *                        example: 66fdc011c0662027f2361
 *                      subtaskIds:
 *                        type: array
 *                        items:
 *                          type: string
 *                          example: 507f1f77bcf86cd799439011
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.delete('/:taskId', jwtMiddleware,TaskMiddleware.deleteTaskMiddleware, TaskController.deleteTask);


/** 
 * @openapi
 * '/api/tasks/{taskId}/subtasks':
 *   get:
 *     tags:
 *       - Subtasks
 *     summary: Get subtasks by task ID
 *     description: |
 *          Retrieve all subtasks for a task identified by taskId. 
 *          Query parameters can be used for filtering title and isCompleted field.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd799439011
 *       - name: title
 *         in: query
 *         required: false
 *         schema:
 *           type: string
 *           example: Task 1
 *       - name: isCompleted
 *         in: query
 *         required: false
 *         schema:
 *           type: boolean
 *           example: true
 *     responses:
 *       200:
 *         description: Subtasks retrieved successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Subtasks retrieved successfully
 *                  data: 
 *                    type: array
 *                    items:
 *                      $ref: '#/components/schemas/Subtask'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.get('/:taskId/subtasks', jwtMiddleware,SubtaskMiddleware.getSubtasksMiddleware, SubtaskController.getSubtasks);

/** 
 * @openapi
 * '/api/tasks/{taskId}/subtasks/{subtaskId}':
 *   get:
 *     tags:
 *       - Subtasks
 *     summary: Get single subtask by task & subtask ID
 *     description: |
 *          Retrieve details of a specific subtask for a task identified by taskId and subtaskId. 
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *       - name: subtaskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd799
 *     responses:
 *       200:
 *         description: Subtask retrieved successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Subtask retrieved successfully
 *                  data: 
 *                    $ref: '#/components/schemas/Subtask'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.get('/:taskId/subtasks/:subtaskId', jwtMiddleware,SubtaskMiddleware.getSubtaskMiddleware, SubtaskController.getSubtask);

/** 
 * @openapi
 * '/api/tasks/{taskId}/subtasks':
 *   post:
 *     tags:
 *       - Subtasks
 *     summary: Create a new subtask in a task
 *     description: |
 *          Create a new subtask in a task identified by taskId.
 *          - The task ID is required as a path parameter.
 *          - The subtask data (title is required, isCompleted is optional) is provided in the request body as a JSON object.
 *          
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - title
 *             properties:
 *               title:
 *                 type: string
 *                 example: Task 1
 *               isCompleted:
 *                 type: boolean
 *                 example: true
 *     responses:
 *       201:
 *         description: Subtask created successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Subtask created successfully
 *                  data: 
 *                    $ref: '#/components/schemas/Subtask'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.post('/:taskId/subtasks', jwtMiddleware, SubtaskMiddleware.createSubtaskMiddleware, SubtaskController.createSubtask);

/** 
 * @openapi
 * '/api/tasks/{taskId}/subtasks/bulk':
 *   post:
 *     tags:
 *       - Subtasks
 *     summary: Create multiple subtasks in a task
 *     description: |
 *          Create multiple subtasks in a task identified by taskId.
 *          - The task ID is required as a path parameter.
 *          - The request body should contain an array of subtask data (title is required, isCompleted is optional).
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - subtasks
 *             properties:
 *               subtasks:
 *                 type: array
 *                 items:
 *                   type: object
 *                   required:
 *                     - title
 *                   properties:
 *                     title:
 *                       type: string
 *                       example: Task 1
 *                     isCompleted:
 *                       type: boolean
 *                       example: true
 *     responses:
 *       201:
 *         description: Multiple subtasks created successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Multiple subtasks created successfully
 *                  data: 
 *                    type: array
 *                    items:
 *                      $ref: '#/components/schemas/Subtask'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.post('/:taskId/subtasks/bulk', jwtMiddleware, SubtaskMiddleware.createSubtasksMiddleware, SubtaskController.createSubtasks);


/** 
 * @openapi
 * '/api/tasks/{taskId}/subtasks/{subtaskId}':
 *   put:
 *     tags:
 *       - Subtasks
 *     summary: Update a subtask in a task by replacing all fields
 *     description: |
 *          Update a subtask in a task identified by taskId and subtaskId.
 *          - The task ID and subtask ID are required as path parameters.
 *          - The request body should contain the updated subtask data (title, isCompleted is required).
 *          - The field "localId" in the request body is an optional field that can be used to mark the updating of a local subtask.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *       - name: subtaskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - title
 *               - isCompleted
 *             properties:
 *               title:
 *                 type: string
 *                 example: Task 1
 *               isCompleted:
 *                 type: boolean
 *                 example: true
 *               localId:
 *                 type: integer
 *                 example: 1
 *     responses:
 *       200:
 *         description: Subtask updated successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Subtask updated successfully
 *                  data: 
 *                    type: array
 *                    items:
 *                      $ref: '#/components/schemas/SubtaskWithLocalId'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.put('/:taskId/subtasks/:subtaskId', jwtMiddleware, SubtaskMiddleware.updateSubtaskFullMiddleware, SubtaskController.updateSubtaskFull);

/** 
 * @openapi
 * '/api/tasks/{taskId}/subtasks/{subtaskId}':
 *   patch:
 *     tags:
 *       - Subtasks
 *     summary: Update some fields of a subtask in a task
 *     description: |
 *          Update some fields of a subtask in a task identified by taskId and subtaskId.
 *          - The task ID and subtask ID are required as path parameters.
 *          - The request body should contain the updated subtask data (title, isCompleted is optional).
 *          - The field "localId" in the request body is an optional field that can be used to mark the updating of a local subtask.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *       - name: subtaskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               title:
 *                 type: string
 *                 example: Task 1
 *               isCompleted:
 *                 type: boolean
 *                 example: true
 *               localId:
 *                 type: integer
 *                 example: 1
 *     responses:
 *       200:
 *         description: Subtask updated successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Subtask updated successfully
 *                  data: 
 *                    type: array
 *                    items:
 *                      $ref: '#/components/schemas/SubtaskWithLocalId'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.patch('/:taskId/subtasks/:subtaskId', jwtMiddleware, SubtaskMiddleware.updateSubtaskPartialMiddleware, SubtaskController.updateSubtaskPartial);


/** 
 * @openapi
 * '/api/tasks/{taskId}/subtasks':
 *   delete:
 *     tags:
 *       - Subtasks
 *     summary: Delete single subtask
 *     description: |
 *          Delete a subtask in a task identified by taskId and subtaskId.
 *          - The task ID and subtask ID are required as path parameters.
 *          - Return the id of deleted subtask.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *       - name: subtaskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *     responses:
 *       200:
 *         description: Subtask deleted successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Subtask deleted successfully
 *                  data: 
 *                    type: object
 *                    properties:
 *                      id:
 *                        type: string
 *                        example: 507f1f77bcf86cd7
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.delete('/:taskId/subtasks', jwtMiddleware, SubtaskMiddleware.deleteAllSubtasksMiddleware, SubtaskController.deleteAllSubtasks);

/** 
 * @openapi
 * '/api/tasks/{taskId}/subtasks/{subtaskId}':
 *   delete:
 *     tags:
 *       - Subtasks
 *     summary: Delete all subtasks in a task
 *     description: |
 *          Delete all subtask in a task identified by taskId
 *          - The task ID are required as path parameters.
 *          - Return the ids and total number of deleted subtasks
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: taskId
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *     responses:
 *       200:
 *         description: Subtasks deleted successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Subtasks deleted successfully
 *                  data: 
 *                    type: object
 *                    properties:
 *                      ids:
 *                        type: array
 *                        items:
 *                          type: string
 *                          example: 507f1f77bcf86cd7
 *                      deleteCount:
 *                        type: integer
 *                        example: 3
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.delete('/:taskId/subtasks/:subtaskId', jwtMiddleware, SubtaskMiddleware.deleteSubtaskMiddleware, SubtaskController.deleteSubtask);

export default router;
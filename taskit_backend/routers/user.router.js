import express from 'express';
import * as AuthController from '../controller/auth.controller.js';
import * as AuthMiddleware from '../middleware/auth.middleware.js';
import * as UserMiddleware from '../middleware/user.middleware.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';    
import {upload} from '../middleware/upload.middleware.js';
import * as UserController from '../controller/user.controller.js';
import { multerErrorHandler } from '../middleware/multer.middleware.js';

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
router.post('/signup', AuthMiddleware.signupMiddleware, AuthController.signup);




router.post('/signup/verify',AuthMiddleware.signup_verify, AuthController.signup_verify);

/** 
 * @openapi
 * '/api/user/login':
 *  post:
 *    tags:
 *      - User
 *    summary: Login
 *    description: Login into user's account using email and password
 *    requestBody:
 *      require: true
 *      content:
 *        application/json:
 *          schema:
 *           type: object
 *           required:
 *              - email
 *              - password
 *           properties:
 *              email:
 *                  type: string
 *                  example: 'email@example.com'
 *              password:
 *                  type: string
 *                  example: ''
 *    responses:
 *      200:
 *          description: Login successfully!
 *          content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Login successfully!
 *                  data:
 *                    type: object
 *                    properties:
 *                      accessToken:
 *                        type: string
 *                        example: eyJhbGciOiJIUzI1Ni
 *      400:
 *        description: Login Bad Request
 *        content:
 *          application/json:
 *            schema: 
 *              type: object
 *              properties:
 *                message:
 *                  type: string
 *                  example: "Login Bad Request: Password is required"
 *                data:
 *                  type: object
 *      401:
 *        description: Invalid Password
 *        content:
 *          application/json:
 *            schema: 
 *              type: object
 *              properties:
 *                message:
 *                  type: string
 *                  example: "Invalid password"
 *                data:
 *                  type: object  
 *      500:
 *        description: Server Error
 *        content:
 *          application/json:
 *            schema: 
 *              type: object
 *              properties:
 *                message:
 *                  type: string
 *                  example: "Login Error"
 *                data:
 *                  type: object
 */
router.post('/login',AuthMiddleware.login, AuthController.login);

router.post('/forgot-password',AuthMiddleware.forgot_password, AuthController.forgot_password);
router.post('/forgot-password/verify',AuthMiddleware.forgot_password_verify, AuthController.forgot_password_verify);
router.put('/forgot-password/reset', AuthMiddleware.forgot_password_reset,AuthController.forgot_password_reset);
router.get('/login/verify', AuthController.login_verify);

router.put('/',jwtMiddleware, upload.single('avatar'), UserController.update_profile,multerErrorHandler);
router.put('/email', jwtMiddleware,UserMiddleware.update_email, UserController.update_email);
router.put('/email/verify', jwtMiddleware,UserMiddleware.update_email_verify, UserController.update_email_verify);
router.put('/password', jwtMiddleware, UserMiddleware.update_password, UserController.update_password);
router.delete('/', jwtMiddleware, UserController.delete_account);

export default router;
import express from 'express';
import * as AuthController from '../controller/user.auth.controller.js';
import * as AuthMiddleware from '../middleware/user.auth.middleware.js';
import * as UserMiddleware from '../middleware/user.middleware.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';    
import {upload} from '../middleware/upload.middleware.js';
import * as UserController from '../controller/user.controller.js';
import { multerErrorHandler } from '../middleware/multer.middleware.js';

const router = express.Router();

router.post('/signup', AuthMiddleware.signup, AuthController.signup);
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
 *           require:
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
 *                      token:
 *                        type: string
 *                        example: eyJhbGciOiJIUzI1Ni
 *                      setting:
 *                        $ref: '#/components/schemas/Setting'
 *                      tasks:
 *                        type: array
 *                        items: 
 *                          $ref: '#/components/schemas/Task'
 *                      categories:
 *                        type: array
 *                        items:
 *                          $ref: '#/components/schemas/Category'
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
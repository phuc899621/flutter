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
 * '/api/auth/signup':
 *   post:
 *     tags:
 *       - Auth
 *     summary: Create a new user
 *     description: |
 *       This endpoint allows user to signup, but before that user has to verify their email
 *       - Send user details in the request body (email, password, name)
 *       - Server will send a verification code to the user's email
 *       - Return the userId for user to include in the verify request
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *      require: true
 *      content:
 *        application/json:
 *          schema:
 *            type: object
 *            required:
 *              - email
 *              - password
 *              - name
 *            properties:
 *              email:
 *                  type: string
 *                  example: 'email@gmail.com'
 *              name:
 *                  type: string
 *                  example: 'John Doe'
 *              password:
 *                  type: string
 *                  example: '******'
 *     responses:
 *       201:
 *         description: Signup successfully! Please verify your email
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Task created successfully
 *                  data:
 *                    type: object
 *                    properties:
 *                      id:
 *                        type: string
 *                        example: "60df59f2fc13ae1c4e000001"
 *       400:
 *         $ref: '#/components/responses/400'
 *       409:
 *         $ref: '#/components/responses/409'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.post('/signup', AuthMiddleware.signupMiddleware, AuthController.signup);



/** 
 * @openapi
 * '/api/auth/signup/verify':
 *   post:
 *     tags:
 *       - Auth
 *     summary: Verify user account
 *     description: |
 *       Verify user account by activating their account
 *       - Send user id and OTP code in the request body
 *       - Server will activate the user's account for user to login
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *      require: true
 *      content:
 *        application/json:
 *          schema:
 *            type: object
 *            required:
 *              - id
 *              - otp
 *            properties:
 *              id:
 *                  type: string
 *                  example: '60df59f2fc13ae1c4e000001'
 *              otp:
 *                  type: string
 *                  example: '1443'
 *     responses:
 *       200:
 *         description: Verify user account successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Verify your account successfully!
 *                  data:
 *                    type: object
 *       400:
 *         $ref: '#/components/responses/400'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.post('/signup/verify',AuthMiddleware.verifySignupMiddleware, AuthController.verifySignup);

/** 
 * @openapi
 * '/api/auth/signup/resend':
 *   post:
 *     tags:
 *       - Auth
 *     summary: Resend verification code
 *     description: |
 *       Resend verification code for activating user account 
 *       - Send user id in the request body
 *       - Server will resend a verification code (4 digits) to the user
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *      require: true
 *      content:
 *        application/json:
 *          schema:
 *            type: object
 *            required:
 *              - id
 *            properties:
 *              id:
 *                  type: string
 *                  example: '60df59f2fc13ae1c4e000001'
 *     responses:
 *       200:
 *         description: Send verification code successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Verify otp for signup has been send to your email
 *                  data:
 *                    type: object
 *       400:
 *         $ref: '#/components/responses/400'
 *       404:
 *         $ref: '#/components/responses/404'
 *       409:
 *         $ref: '#/components/responses/409'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.post('/signup/resend',AuthMiddleware.resendSignupOtpMiddleware, AuthController.resendSignupOtp);


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



export default router;
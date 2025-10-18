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
 *       - Send user details in the request body (email, password, username, name)
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
 *              - username
 *            properties:
 *              email:
 *                  type: string
 *                  example: 'email@gmail.com'
 *              name:
 *                  type: string
 *                  description: User's full name (must be at least 3 characters long)
 *                  example: 'John Doe'
 *              password:
 *                  type: string
 *                  example: '******'
 *              username:
 *                  type: string
 *                  description: User's username (must be at least 6 characters long; can contain letters, numbers, and special characters; must start with a letter)
 *                  example: 'johndoe'
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
 *      - Auth
 *    summary: Login
 *    description: |
 *      Login into user's account using email and password
 *      - Send email/username and password in the request body
 *      - Server will return accessToken, refreshToken and expired time for user to include in the verify request
 *    requestBody:
 *      require: true
 *      content:
 *        application/json:
 *          schema:
 *           type: object
 *           required:
 *              - identifier
 *              - password
 *           properties:
 *              identifier:
 *                  type: string
 *                  example: 'email@example.com'
 *              password:
 *                  type: string
 *                  example: '*****'
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
 *                        description: Access token for user to include in the verify request
 *                      refreshToken:
 *                        type: string
 *                        example: eyJhbGciOiJIUzI1Ni
 *                        description: Refresh token for user to include in the verify request
 *                      expiresAt:
 *                        type: string
 *                        format: date-time
 *                        example: 2021-05-31T00:00:00.000Z
 *                        description: Expired time of access token for app to refresh token
 *      400:
 *        '$ref': '#/components/responses/400'
 *      401:
 *        '$ref': '#/components/responses/401'
 *      404:
 *        '$ref': '#/components/responses/404'
 *      409:
 *        '$ref': '#/components/responses/409'
 *      500:
 *        $ref: '#/components/responses/500'
 */
router.post('/login',AuthMiddleware.loginMiddleware, AuthController.login);

/** 
 * @openapi
 * '/api/auth/forgot-password':
 *  post:
 *    tags:
 *      - Auth
 *    summary: Verify email for forgot password
 *    description: |
 *      Verify user account to reset user's password
 *      - Send email in the request body
 *      - Server will send a verification code to the user's email
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
 *    responses:
 *      201:
 *          description: Verify code sent successfully!
 *          content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: OTP for verify has been send to your email!
 *                  data:
 *                    type: object
 *      400:
 *        '$ref': '#/components/responses/400'
 *      404:
 *        '$ref': '#/components/responses/404'
 *      500:
 *        $ref: '#/components/responses/500'
 */
router.post('/forgot-password',AuthMiddleware.forgotPasswordMiddleware, AuthController.forgotPassword);

/** 
 * @openapi
 * '/api/auth/forgot-password/verify':
 *  post:
 *    tags:
 *      - Auth
 *    summary: Get reset token for forgot password
 *    description: |
 *      Get reset token for forgot password
 *      - Send email and verified code in the request body
 *      - Server will return a reset token for user to include in the reset password request
 *  
 *    requestBody:
 *      require: true
 *      content:
 *        application/json:
 *          schema:
 *           type: object
 *           required:
 *              - email
 *              - otp
 *           properties:
 *              email:
 *                  type: string
 *                  example: 'email@example.com'
 *              otp:
 *                  type: string
 *                  example: '1236'
 *    responses:
 *      201:
 *          description: Verify successfully!
 *          content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Verify successfully!
 *                  data:
 *                    type: object
 *                    properties:
 *                      resetToken:
 *                        type: string
 *                        example: eyJhbGciOiJIUzI1Ni
 *      400:
 *        '$ref': '#/components/responses/400'
 *      404:
 *        '$ref': '#/components/responses/404'
 *      500:
 *        $ref: '#/components/responses/500'
 */
router.post('/forgot-password/verify',AuthMiddleware.forgotPasswordVerifyMiddleware, AuthController.forgotPasswordVerify);

/** 
 * @openapi
 * '/api/auth/forgot-password/reset':
 *  put:
 *    tags:
 *      - Auth
 *    summary: Reset password
 *    description: |
 *      Change the password that user has forgotten
 *      - User has to include reset token, password, password confirmation and email in the request body
 *      - Server will hash the password and update the user's password
 *    parameters:
 *      - in: header
 *        name: Reset-Token
 *        required: true
 *        schema:
 *          type: string
 *          example: eyJhbGciOiJIUzI1Ni
 *        description: Reset token for user to include in the reset password request
 *    requestBody:
 *      require: true
 *      content:
 *        application/json:
 *          schema:
 *           type: object
 *           required:
 *              - email
 *              - password
 *              - passwordConfirm
 *              - resetToken
 *           properties:
 *              email:
 *                  type: string
 *                  example: 'email@example.com'
 *              password:
 *                  type: string
 *                  example: '****'
 *              passwordConfirm:
 *                  type: string
 *                  example: '****'
 *              resetToken:
 *                  type: string
 *                  example: 'eyJhbGciOiJIUzI1Ni'
 *    responses:
 *      201:
 *          description: Reset password successfully!
 *          content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Reset password successfully!
 *                  data:
 *                    type: object
 *                    example: {}
 *      400:
 *        '$ref': '#/components/responses/400'
 *      404:
 *        '$ref': '#/components/responses/404'
 *      500:
 *        $ref: '#/components/responses/500'
 */
router.put('/forgot-password/reset',AuthMiddleware.resetPasswordMiddleware, AuthController.resetPassword);

export default router;
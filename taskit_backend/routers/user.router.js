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
router.post('/login',AuthMiddleware.login, AuthController.login);
router.post('/forgot-password',AuthMiddleware.forgot_password, AuthController.forgot_password);
router.post('/forgot-password/verify',AuthMiddleware.forgot_password_verify, AuthController.forgot_password_verify);
router.put('/forgot-password/reset', AuthMiddleware.forgot_password_reset,AuthController.forgot_password_reset);
router.get('/login/verify', AuthController.login_verify);

router.put('/profile',jwtMiddleware, upload.single('avatar'), UserController.update_profile,multerErrorHandler);
router.put('/profile/email', jwtMiddleware,UserMiddleware.update_email, UserController.update_email);
router.put('/profile/email/verify', jwtMiddleware,UserMiddleware.update_email_verify, UserController.update_email_verify);
router.put('/profile/password', jwtMiddleware, UserMiddleware.update_password, UserController.update_password);
router.delete('/profile', jwtMiddleware, UserController.delete_account);

export default router;
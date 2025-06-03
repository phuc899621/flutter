import express from 'express';
import * as AuthController from '../controller/auth.controller.js';
import * as AuthMiddleware from '../middleware/auth.middleware.js';

const router = express.Router();

router.post('/auth/signup', AuthMiddleware.signup, AuthController.signup);
router.post('/auth/signup-verify', AuthController.verifyEmail);
router.post('/auth/login', AuthController.login);
router.post('/auth/forgot-password', AuthController.forgotPasswordVerifyEmail);
router.post('/auth/forgot-password/verify', AuthController.forgotPasswordVerifyOtp);
router.put('/auth/forgot-password/reset', AuthController.resetPassword);
router.get('/auth/login/verify', AuthController.verifyLogin);

export default router;
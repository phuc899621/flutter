import express from 'express';
import * as AuthController from './auth.controller.js';
import * as AuthValidate from './auth.validate.js';


const router = express.Router();
router.post('/signup', AuthValidate.signupValidate, AuthController.signup);
router.post('/signup/verify',AuthValidate.verifySignupMiddleware, AuthController.verifySignup);
router.post('/signup/resend',AuthValidate.resendSignupOtpMiddleware, AuthController.resendSignupOtp);
router.post('/login',AuthValidate.loginMiddleware, AuthController.login);
router.post('/forgot-password',AuthValidate.forgotPasswordMiddleware, AuthController.forgotPassword);
router.post('/forgot-password/verify',AuthValidate.forgotPasswordVerifyMiddleware, AuthController.forgotPasswordVerify);
router.put('/forgot-password/reset',AuthValidate.resetPasswordMiddleware, AuthController.resetPassword);

export default router;
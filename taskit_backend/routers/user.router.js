const router=require('express').Router();
const AuthController=require('../controller/auth.controller');

router.post('/auth/signup',AuthController.signup);
router.post('/auth/signup-verify',AuthController.verifyEmail);
router.post('/auth/login',AuthController.login);
router.post('/auth/forgot-password',AuthController.forgotPasswordVerifyEmail);
router.post('/auth/forgot-password/verify',AuthController.forgotPasswordVerifyOtp);
router.put('/auth/reset-password',AuthController.resetPassword);
module.exports=router;
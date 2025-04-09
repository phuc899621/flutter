const router=require('express').Router();
const AuthController=require('../controller/auth.controller');

router.post('/auth/signup',AuthController.signup);
router.post('/auth/signup-verify',AuthController.verifyEmail);
router.post('/auth/login',AuthController.login);
module.exports=router;
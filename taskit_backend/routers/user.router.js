const router=require('express').Router();
const UserController=require('../controller/user.controller');

router.post('/auth/signup',UserController.signup);
router.post('/auth/signup-verify',UserController.verifyEmail);
module.exports=router;
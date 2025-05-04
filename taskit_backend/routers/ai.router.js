const router=require('express').Router();
const AIController=require('../controller/ai.controller');
const AuthMiddleware=require('../middleware/auth.middleware');

router.get('/category',AuthMiddleware,AIController.suggestCategories);


module.exports=router;
const router=require('express').Router();
const CategoryController=require('../controller/category.controller');
const AuthMiddleware=require('../middleware/auth.middleware');

router.get('/',AuthMiddleware,CategoryController.findAllCategories);
router.post('/',AuthMiddleware,CategoryController.addCategory);
router.put('/',AuthMiddleware,CategoryController.updateCategory);
router.delete('/',AuthMiddleware,CategoryController.deleteCategory);

module.exports=router;
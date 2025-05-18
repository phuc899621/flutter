const router=require('express').Router();
const TaskController=require('../controller/task.controller');
const CategoryController=require('../controller/category.controller');
const AuthMiddleware=require('../middleware/auth.middleware');

router.post('/add',AuthMiddleware,TaskController.createTask);
router.post('/add/subtask/:taskId',AuthMiddleware,TaskController.addListSubtask);
router.put('/update/:taskId/subtask/:subtaskId',AuthMiddleware,TaskController.updateSubtask);
router.put('/update/subtask/:taskId',AuthMiddleware,TaskController.updateListSubtask);
router.put('/update/:taskId',AuthMiddleware,TaskController.updateTask);
router.delete('/delete/:taskId',AuthMiddleware,TaskController.deleteTask);
router.delete('/delete/subtask/:taskId',AuthMiddleware,TaskController.deleteSubtask);
router.get('/',AuthMiddleware,TaskController.findTaskById);
router.get('/subtask/:taskId',AuthMiddleware,TaskController.findAllSubTaskByUserId);

router.get('/category',AuthMiddleware,CategoryController.findAllCategories);
router.post('/category',AuthMiddleware,CategoryController.addCategory);
router.put('/category',AuthMiddleware,CategoryController.updateCategory);
router.delete('/category',AuthMiddleware,CategoryController.deleteCategory);

module.exports=router;
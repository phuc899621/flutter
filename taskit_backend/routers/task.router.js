const router=require('express').Router();
const TaskController=require('../controller/task.controller');
const AuthMiddleware=require('../middleware/auth.middleware');

router.get('/',AuthMiddleware,TaskController.findAllTasks);
router.post('/',AuthMiddleware,TaskController.addTaskWithSubtasks);
router.put('/',AuthMiddleware,TaskController.updateTask);
router.delete('/',AuthMiddleware,TaskController.deleteTask);
router.delete('/list',AuthMiddleware,TaskController.deleteListTasks);
router.delete('/all',AuthMiddleware,TaskController.deleteAllTasks);

module.exports=router;
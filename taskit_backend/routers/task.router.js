const router=require('express').Router();
const TaskController=require('../controller/task.controller');
const AuthMiddleware=require('../middleware/auth.middleware');

router.post('/add',AuthMiddleware,TaskController.createTask);
router.post('/add/subtask/:taskId',AuthMiddleware,TaskController.addListSubtask);
router.put('/update/:taskId/subtask/:subtaskId',AuthMiddleware,TaskController.updateSubtask);
router.put('/update/subtask/:taskId',AuthMiddleware,TaskController.updateListSubtask);
router.put('/update/:taskId',AuthMiddleware,TaskController.updateTask);
router.delete('/delete/:taskId',AuthMiddleware,TaskController.deleteTask);
router.delete('/delete/subtask/:taskId',AuthMiddleware,TaskController.deleteSubtask);
router.get('/:taskId',AuthMiddleware,TaskController.findTaskById);
router.get('',AuthMiddleware,TaskController.findAllTaskByUserId);
router.get('/subtask/:taskId',AuthMiddleware,TaskController.findAllSubTaskByUserId);



module.exports=router;
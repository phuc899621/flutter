const router=require('express').Router();
const SubtaskController=require('../controller/subtask.controller');
const AuthMiddleware=require('../middleware/auth.middleware');

router.get('/',AuthMiddleware,SubtaskController.findAllSubtasks);
router.post('/',AuthMiddleware,SubtaskController.addSubtask);
router.post('/list',AuthMiddleware,SubtaskController.addListSubtasks);
router.put('/',AuthMiddleware,SubtaskController.updateSubtask);
router.delete('/',AuthMiddleware,SubtaskController.deleteSubtask);
router.delete('/list',AuthMiddleware,SubtaskController.deleteListSubtasks);
router.delete('/all',AuthMiddleware,SubtaskController.deleteAllSubtasks);

module.exports=router;
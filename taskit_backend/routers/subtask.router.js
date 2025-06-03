import express from 'express';
import * as SubtaskController from '../controller/subtask.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';

const router = express.Router();

router.get('/', jwtMiddleware, SubtaskController.findAllSubtasks);
router.post('/', jwtMiddleware, SubtaskController.addSubtask);
router.post('/list', jwtMiddleware, SubtaskController.addListSubtasks);
router.put('/', jwtMiddleware, SubtaskController.updateSubtask);
router.delete('/', jwtMiddleware, SubtaskController.deleteSubtask);
router.delete('/list', jwtMiddleware, SubtaskController.deleteListSubtasks);
router.delete('/all', jwtMiddleware, SubtaskController.deleteAllSubtasks);

export default router;
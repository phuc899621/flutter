import express from 'express';
import * as TaskController from '../controller/task.controller.js';
import * as SubtaskController from '../controller/subtask.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';
import * as TaskMiddleware from '../middleware/task.middleware.js';
import * as SubtaskMiddleware from '../middleware/subtask.middleware.js';

const router = express.Router();

router.get('/', jwtMiddleware, TaskController.get_task);
router.post('/', jwtMiddleware,TaskMiddleware.create_task, TaskController.create_task);
router.patch('/:taskId', jwtMiddleware, TaskController.update_task);
router.delete('/all', jwtMiddleware, TaskController.delete_all_task);
router.delete('/:taskId', jwtMiddleware,TaskMiddleware.delete_task, TaskController.delete_task);

router.get('/:taskId/subtask', jwtMiddleware, SubtaskController.get_subtasks);
router.post('/:taskId/subtask', jwtMiddleware, SubtaskMiddleware.add_subtasks, SubtaskController.add_subtasks);
router.delete('/:taskId/subtask', jwtMiddleware, SubtaskMiddleware.delete_all_subtasks, SubtaskController.delete_all_subtasks);

export default router;
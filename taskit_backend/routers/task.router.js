import express from 'express';
import * as TaskController from '../controller/task.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';

const router = express.Router();

router.get('/', jwtMiddleware, TaskController.findAllTasks);
router.post('/', jwtMiddleware, TaskController.addTaskWithSubtasks);
router.put('/', jwtMiddleware, TaskController.updateTask);
router.delete('/', jwtMiddleware, TaskController.deleteTask);
router.delete('/list', jwtMiddleware, TaskController.deleteListTasks);
router.delete('/all', jwtMiddleware, TaskController.deleteAllTasks);

export default router;
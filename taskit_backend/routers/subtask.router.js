import express from 'express';
import * as SubtaskController from '../controller/subtask.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';
import * as SubtaskMiddleware from '../middleware/subtask.middleware.js';

const router = express.Router();

router.put('/',jwtMiddleware, SubtaskMiddleware.update_subtasks, SubtaskController.update_subtasks);
router.delete('/:subtaskId', jwtMiddleware, SubtaskController.delete_subtask);

export default router;
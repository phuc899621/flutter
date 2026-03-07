import express from 'express';
import * as AIController from '../controller/ai.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';
import * as AIMiddleware from '../middleware/ai.middleware.js';

const router = express.Router();

router.get('/category', jwtMiddleware,AIMiddleware.ai_category, AIController.suggestCategories);
router.get('/task', jwtMiddleware,AIMiddleware.ai_create_task, AIController.createTaskUsingAi);
router.get('/question', jwtMiddleware,AIMiddleware.ai_answer_task_question, AIController.answerTaskQuestion);

export default router;
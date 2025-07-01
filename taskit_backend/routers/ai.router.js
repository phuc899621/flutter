import express from 'express';
import * as AIController from '../controller/ai.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';
import * as AIMiddleware from '../middleware/ai.middleware.js';

const router = express.Router();

router.get('/category', jwtMiddleware,AIMiddleware.ai_category, AIController.suggestCategories);
router.get('/task', jwtMiddleware,AIMiddleware.ai_category, AIController.getTaskAi);

export default router;
import express from 'express';
import * as AIController from '../controller/ai.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';

const router = express.Router();

router.get('/category', jwtMiddleware, AIController.suggestCategories);

export default router;
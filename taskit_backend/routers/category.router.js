import express from 'express';
import * as CategoryController from '../controller/category.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';

const router=express.Router();

router.get('/',jwtMiddleware,CategoryController.findAllCategories);
router.post('/',jwtMiddleware,CategoryController.addCategory);
router.put('/',jwtMiddleware,CategoryController.updateCategory);
router.delete('/',jwtMiddleware,CategoryController.deleteCategory);

export default router;
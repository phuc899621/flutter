import express from 'express';
import * as CategoryController from '../controller/category.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';
import * as CategoryMiddleware from '../middleware/category.middleware.js';

const router=express.Router();

router.get('/',jwtMiddleware,CategoryController.get_category);
router.post('/',jwtMiddleware,CategoryMiddleware.create_category,CategoryController.create_category);
router.patch('/:categoryId',jwtMiddleware,CategoryMiddleware.update_category,CategoryController.update_category);
router.delete('/bulk', jwtMiddleware, CategoryMiddleware.delete_category_bulk,CategoryController.delete_category_bulk);
router.delete('/all', jwtMiddleware, CategoryController.delete_all_categories);
router.delete('/:categoryId',jwtMiddleware,CategoryMiddleware.delete_category,CategoryController.delete_category);

export default router;
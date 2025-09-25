import express from 'express';
import * as CategoryController from '../controller/category.controller.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';
import * as CategoryMiddleware from '../middleware/category.middleware.js';

const router=express.Router();

/** 
 * @openapi
 * '/api/categories':
 *   get:
 *     tags:
 *       - Categories
 *     summary: Get all categories of a user
 *     description: |
 *          Retrieve all categories for the authenticated user.
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Categories retrieved successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Categories retrieved successfully
 *                  data: 
 *                    type: array
 *                    items:
 *                      $ref: '#/components/schemas/Category'
 * 
 *       401:
 *         $ref: '#/components/responses/401'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.get('/',jwtMiddleware,CategoryController.getCategories);

/** 
 * @openapi
 * '/api/categories/{id}':
 *   get:
 *     tags:
 *       - Categories
 *     summary: Get single category by ID
 *     description: |
 *          Retrieve details of a specific category for the authenticated user using the category ID.
 *          - The category ID is required as a path parameter.
 *          - Return the details of the category if found, otherwise return 404.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           example: 507f1f77bcf86cd7
 *     responses:
 *       200:
 *         description: Category retrieved successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Category retrieved successfully
 *                  data: 
 *                    $ref: '#/components/schemas/Category'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.get('/:id',jwtMiddleware,CategoryMiddleware.getCategoryMiddleware,CategoryController.getCategory);

/** 
 * @openapi
 * '/api/categories':
 *   post:
 *     tags:
 *       - Categories
 *     summary: Create a new category
 *     description: |
 *          Create a new category for the authenticated user.
 *          - The category data is required in the request body.
 *          - The name must be at least 3 characters long and must not the same as another category.
 *          - Return the details of the created category.
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - name
 *             properties:
 *               name:
 *                 type: string
 *                 example: Shopping
 *               localId:
 *                 type: integer
 *                 example: 1
 *     responses:
 *       201:
 *         description: Category created successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Category created successfully
 *                  data: 
 *                    '#/components/schemas/CategoryWithLocalId'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.post('/',jwtMiddleware,CategoryMiddleware.createCategoryMiddleware,CategoryController.createCategory);


/** 
 * @openapi
 * '/api/categories/{id}':
 *   put:
 *     tags:
 *       - Categories
 *     summary: Update a category by ID
 *     description: |
 *          Update a category for the authenticated user using the category ID with all fields required.
 *          - The category data is required in the request body and it must include name.
 *          - The name must be at least 3 characters long and must not the same as another category.
 *  
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - name
 *             properties:
 *               name:
 *                 type: string
 *                 example: Shopping
 *     responses:
 *       200:
 *         description: Category updated successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Category updated successfully
 *                  data: 
 *                    '#/components/schemas/Category'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.put('/:id',jwtMiddleware,CategoryMiddleware.updateCategoryFullMiddleware,CategoryController.updateCategoryFull);

/** 
 * @openapi
 * '/api/categories/{id}':
 *   patch:
 *     tags:
 *       - Categories
 *     summary: Update a category by ID
 *     description: |
 *          Update a category for the authenticated user using the category ID with all fields are optional.
 *          - The name must be at least 3 characters long and must not the same as another category.
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *                 example: Shopping
 *     responses:
 *       200:
 *         description: Category updated successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Category updated successfully
 *                  data: 
 *                    '#/components/schemas/Category'
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.patch('/:id',jwtMiddleware,CategoryMiddleware.updateCategoryPartialMiddleware,CategoryController.updateCategoryPartial);

/** 
 * @openapi
 * '/api/categories/{id}':
 *   delete:
 *     tags:
 *       - Categories
 *     summary: Delete a category by ID
 *     description: |
 *          Delete a category for the authenticated user using the category ID.
 *          - If the category is the default category, it cannot be deleted.
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Category deleted successfully
 *         content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *                    example: Category deleted successfully
 *                  data: 
 *                    type: object
 *                    properties:
 *                      id:
 *                        type: string
 *                        example: "507f1f77bcf86cd7"
 * 
 *       400:
 *         $ref: '#/components/responses/400'
 *       401:
 *         $ref: '#/components/responses/401'
 *       404:
 *         $ref: '#/components/responses/404'
 *       500:
 *         $ref: '#/components/responses/500'
 */
router.delete('/:id',jwtMiddleware,CategoryMiddleware.deleteCategoryMiddleware,CategoryController.deleteCategory);


export default router;
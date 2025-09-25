import {body, header, param, validationResult} from "express-validator";

const validateResult = (prefix = 'Validation') => (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    const firstError = errors.array()[0].msg;
    return res.status(400).json({
      message: `${prefix} error: ${firstError}`,
      data: {}
    });
  }
  next();
};
export const getCategoryMiddleware = [
  param('id')
    .exists()
    .withMessage('Category ID is required')
    .isMongoId()
    .withMessage('Invalid Category ID format'),
  validateResult('Get Category')
];

export const createCategoryMiddleware = [
  body('name')
    .trim()
    .notEmpty()
    .withMessage('Category name is required')
    .isLength({min: 3})
    .withMessage('Name must be at least 3 characters long'),
   body('localId')
   .optional()
   .isInt()
   .withMessage('Category\'s localId must be an integer'),
  validateResult('Create Category')
];
export const updateCategoryFullMiddleware = [
  param('id')
    .exists()
    .withMessage('Category ID is required')
    .isMongoId()
    .withMessage('Category ID must be a valid MongoDB ObjectId'),
  body('name')
    .trim()
    .notEmpty()
    .withMessage('Category name is required')
    .isLength({min: 3})
    .withMessage('Name must be at least 3 characters long'),
  validateResult('Update Category')
];
export const updateCategoryPartialMiddleware = [
  param('id')
    .exists()
    .withMessage('Category ID is required')
    .isMongoId()
    .withMessage('Category ID must be a valid MongoDB ObjectId'),
  body('name')
    .trim()
    .optional()
    .isLength({min: 3})
    .withMessage('Name must be at least 3 characters long'),
  validateResult('Update Category')
];
export const deleteCategoryMiddleware = [
  param('id')
    .exists()
    .withMessage('Category ID is required')
    .isMongoId()
    .withMessage('Category ID must be a valid MongoDB ObjectId'),
  validateResult('Delete Category')
];
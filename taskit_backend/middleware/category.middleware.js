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

export const create_category = [
  body('*.name')
    .trim()
    .notEmpty()
    .withMessage('Category name is required')
    .isLength({min: 3})
    .withMessage('Name must be at least 3 characters long'),
   body('*localId')
   .optional()
   .trim(),
  validateResult('Create Category')
];
export const update_category = [
  param('categoryId')
    .exists()
    .withMessage('Category ID is required')
    .isMongoId()
    .withMessage('Invalid Category ID format'),
  body('name')
    .optional()
    .trim()
    .isLength({min: 3})
    .withMessage('Name must be at least 3 characters long'),
  validateResult('Update Category')
];
export const delete_category = [
  param('categoryId')
    .exists()
    .withMessage('Category ID is required')
    .isMongoId()
    .withMessage('Invalid Category ID format'),
  validateResult('Delete Category')
];
export const delete_category_bulk = [
  body('ids')
    .exists()
    .withMessage('IDs are required')
    .isArray({min: 1})
    .withMessage('IDs must be a non-empty array'),
  validateResult('Delete Categories Bulk')
];
import { body, header, param, validationResult } from 'express-validator';
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
export const create_task = [
  body('title')
    .notEmpty()
    .withMessage('Title is required')
    .isString()
    .withMessage('Title must be a string'),
    body('description')
    .optional()
    .isString()
    .withMessage('Description must be a string'),
    body('dueDate')
    .optional({ nullable: true })
    .isISO8601()
    .withMessage('Due date must be a valid date in ISO 8601 format'),
    body('hasTime')
    .optional()
    .isBoolean()
    .withMessage('Has Time must be a boolean'),
    body('priority')
    .optional()
    .isIn(['low', 'medium', 'high', 'none'])
    .withMessage('Priority must be one of: low, medium, high, none'),
    body('category')
    .optional()
    .isString()
    .withMessage('Category must be a string'),
    body('status')
    .optional()
    .isIn(['pending', 'scheduled', 'completed'])
    .withMessage('Status must be one of: pending, scheduled, completed'),
    body('subtasks')
    .optional()
    .isArray()
    .withMessage('Subtasks must be an array'),
    body('subtasks.*.title')
    .notEmpty()
    .withMessage('Subtask title is required')
    .isString()
    .withMessage('Subtask title must be a string'),
    validateResult('Create task validation error')
];
export const update_task = [
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
  body('title')
    .optional()
    .isString()
    .withMessage('Title must be a string'),
    body('description')
    .optional()
    .isString()
    .withMessage('Description must be a string'),
    body('dueDate')
    .optional({ nullable: true })
    .isISO8601()
    .withMessage('Due date must be a valid date in ISO 8601 format'),
    body('hasTime')
    .optional()
    .isBoolean()
    .withMessage('Has Time must be a boolean'),
    body('priority')
    .optional()
    .isIn(['low', 'medium', 'high', 'none'])
    .withMessage('Priority must be one of: low, medium, high, none'),
    body('category')
    .optional()
    .isString()
    .withMessage('Category must be a string'),
    body('status')
    .optional()
    .isIn(['pending', 'scheduled', 'completed'])
    .withMessage('Status must be one of: pending, scheduled, completed'),

  validateResult('Update task validation error')
];
export const delete_task = [
  param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
  validateResult('Delete task validation error')
];

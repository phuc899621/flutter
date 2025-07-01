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

export const add_subtasks=[
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    body('subtasks')
    .isArray()
    .withMessage('Subtasks must be an array'),
    body('subtasks.*.title')
    .notEmpty()
    .withMessage('Title is required')
    .isString()
    .withMessage('Title must be a string'),
    body('subtasks.*.isCompleted')
    .optional()
    .isBoolean()
    .withMessage('isCompleted must be a boolean'),
    validateResult('Add subtasks')
]

export const get_subtasks=[
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    validateResult('Get subtasks')
]
export const update_subtasks=[
    body('subtasks')
    .isArray()
    .withMessage('Subtasks must be an array'),
    body('subtasks.*.localId')
    .optional()
    .isInt()
    .withMessage('Local ID must be an integer'),
    body('subtasks.*.id')
    .notEmpty()
    .withMessage('Subtask ID is required')
    .isMongoId()
    .withMessage('Subtask ID must be a valid MongoDB ObjectId'),

    body('subtasks.*.title')
    .optional()
    .isString()
    .withMessage('Title must be a string'),
    body('subtasks.*.isCompleted')
    .optional()
    .isBoolean()
    .withMessage('isCompleted must be a boolean'),
    validateResult('Add subtasks')
]
export const delete_all_subtasks=[
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    validateResult('Delete subtasks')

]
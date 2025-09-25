import { body, header, param, query, validationResult } from 'express-validator';
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


export const createSubtaskMiddleware=[
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    body('title')
    .notEmpty()
    .withMessage('Title is required')
    .isString()
    .withMessage('Title must be a string'),
    body('isCompleted')
    .optional()
    .isBoolean()
    .withMessage('isCompleted must be a boolean'),
    validateResult('Create subtask')
]

export const createSubtasksMiddleware=[
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    body('subtasks')
    .notEmpty()
    .withMessage('Subtasks are required')
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
    validateResult('Create subtask')
]


export const getSubtasksMiddleware=[
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    query('title')
    .optional()
    .isString()
    .withMessage('Title must be a string'),
    query('isCompleted')
    .optional()
    .isBoolean()
    .withMessage('isCompleted must be a boolean'),
    validateResult('Get subtasks')
]
export const getSubtaskMiddleware=[
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    param('subtaskId')
    .notEmpty()
    .withMessage('Subtask ID is required')
    .isMongoId()
    .withMessage('Subtask ID must be a valid MongoDB ObjectId'),
    validateResult('Get subtask')
]
export const updateSubtaskFullMiddleware=[
  param('taskId')
  .notEmpty()
  .withMessage('Task ID is required')
  .isMongoId()
  .withMessage('Task ID must be a valid MongoDB ObjectId'),
  param('subtaskId')
  .notEmpty()
  .withMessage('Subtask ID is required')
  .isMongoId()
  .withMessage('Subtask ID must be a valid MongoDB ObjectId'),
  body('localId')
  .optional()
  .isInt()
  .withMessage('localId must be an integer'),
  body('title')
  .notEmpty()
  .withMessage('Title is required')
  .isString()
  .withMessage('Title must be a string'),
  body('isCompleted')
  .notEmpty()
  .withMessage('isCompleted is required')
  .isBoolean()
  .withMessage('isCompleted must be a boolean'),
  validateResult('Update subtask full')
]
export const updateSubtaskPartialMiddleware=[
  param('taskId')
  .notEmpty()
  .withMessage('Task ID is required')
  .isMongoId()
  .withMessage('Task ID must be a valid MongoDB ObjectId'),
  body('localId')
  .optional()
  .isInt()
  .withMessage('localId must be an integer'),
  param('subtaskId')
  .notEmpty()
  .withMessage('Subtask ID is required')
  .isMongoId()
  .withMessage('Subtask ID must be a valid MongoDB ObjectId'),
  body('title')
  .optional()
  .isString()
  .withMessage('Title must be a string'),
  body('isCompleted')
  .optional()
  .isBoolean()
  .withMessage('isCompleted must be a boolean'),
  validateResult('Update subtask full')
]



export const deleteSubtaskMiddleware=[
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    param('subtaskId')
    .notEmpty()
    .withMessage('Subtask ID is required')
    .isMongoId()
    .withMessage('Subtask ID must be a valid MongoDB ObjectId'),
    validateResult('Delete subtask')
]
export const deleteAllSubtasksMiddleware=[
  param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    validateResult('Delete subtask')
]
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
export const createTaskMiddleware = [
  body('title')
    .notEmpty().withMessage('Title is required')
    .isString()
    .withMessage('Title must be a string'),
    body('description')
    .optional()
    .isString()
    .withMessage('Description must be a string'),
    body('categoryId')
    .notEmpty()
    .withMessage('Category ID is required')
    .isMongoId()
    .withMessage('Category ID must be a valid MongoDB ObjectId'),
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
    validateResult('Create task validation')
];
export const updateTaskFullMiddleware = [
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    body('taskLocalId')
    .optional()
    .isInt()
    .withMessage('localTaskId must be an integer'),
  body('title')
    .notEmpty()
    .withMessage('Title is required')
    .isString()
    .withMessage('Title must be a string'),
    body('description')
    .custom((value) => {
    if (value === null) {
      throw new Error("Description is required");
    }
    return true;
    })
    .isString()
    .withMessage('Description must be a string'),
    body('dueDate')
    .optional({ nullable: true })
    .isISO8601()
    .withMessage('Due date must be a valid date in ISO 8601 format'),
    body('hasTime')
    .notEmpty()
    .withMessage('Has Time is required')
    .isBoolean()
    .withMessage('Has Time must be a boolean'),
    body('priority')
    .notEmpty()
    .withMessage('Priority is required')
    .isIn(['low', 'medium', 'high', 'none'])
    .withMessage('Priority must be one of: low, medium, high, none'),
    body('categoryId')
    .notEmpty()
    .withMessage('Category ID is required')
    .isString()
    .withMessage('Category must be a string')
    .isMongoId()
    .withMessage('Category ID must be a valid MongoDB ObjectId'),
    body('status')
    .notEmpty()
    .withMessage('Status is required')
    .isString()
    .withMessage('Status must be a string')
    .isIn(['pending', 'scheduled', 'completed'])
    .withMessage('Status must be one of: pending, scheduled, completed'),

  validateResult('Full task updated validation')
];

export const updateTaskPartialMiddleware = [
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    body('taskLocalId')
    .optional()
    .isInt()
    .withMessage('localTaskId must be an integer'),
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
    body('categoryId')
    .optional()
    .isString()
    .withMessage('Category must be a string')
    .isMongoId()
    .withMessage('Category ID must be a valid MongoDB ObjectId'),
    body('status')
    .optional()
    .isString()
    .withMessage('Status must be a string')
    .isIn(['pending', 'scheduled', 'completed'])
    .withMessage('Status must be one of: pending, scheduled, completed'),

  validateResult('Partial task updated validation')
];

export const updateTasksBulkMiddleware = [
  body('ids')
    .notEmpty()
    .withMessage('Task IDs are required')
    .isArray()
    .withMessage('Task IDs must be an array'),
    body('ids.*')
    .optional()
    .isObject()
    .withMessage('Task IDs must be an array of objects'),
    body('ids.*.taskLocalId')
    .optional()
    .isInt()
    .withMessage('Task Local ID must be an integer'),
    body('ids.*.taskId')
    .notEmpty()
    .withMessage('Task ID is required for each task')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    body('data')
    .notEmpty()
    .withMessage('Data is required')
    .isObject()
    .withMessage('Data must be an object'),
    body('data.title')
    .optional()
    .isString()
    .withMessage('Title must be a string'),
    body('data.description')
    .optional()
    .isString()
    .withMessage('Description must be a string'),
    body('data.dueDate')
    .optional({ nullable: true })
    .isISO8601()
    .withMessage('Due date must be a valid date in ISO 8601 format'),
    body('data.hasTime')
    .optional()
    .isBoolean()
    .withMessage('Has Time must be a boolean'),
    body('data.priority')
    .optional()
    .isIn(['low', 'medium', 'high', 'none'])
    .withMessage('Priority must be one of: low, medium, high, none'),
    body('data.categoryId')
    .optional()
    .isString()
    .withMessage('Category must be a string')
    .isMongoId()
    .withMessage('Category ID must be a valid MongoDB ObjectId'),
    body('data.status')
    .optional()
    .isString()
    .withMessage('Status must be a string')
    .isIn(['pending', 'scheduled', 'completed'])
    .withMessage('Status must be one of: pending, scheduled, completed'),
  validateResult('Bulk task updated validation')
];


export const updateMultipleTasksMiddleware = [
  body('tasks')
    .notEmpty()
    .withMessage('List of updated tasks are required')
    .isArray()
    .withMessage('List of updated tasks must be an array'),
    body('tasks.*.taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    body('tasks.*.taskLocalId')
    .optional()
    .isInt()
    .withMessage('taskLocalId must be an integer'),
    body('tasks.*.data')
    .notEmpty()
    .withMessage('Update data is required') 
    .isObject()
    .withMessage('Update data must be an object'),
    body('tasks.*.data.title')
    .optional()
    .isString()
    .withMessage('Title must be a string'),
    body('tasks.*.data.description')
    .optional()
    .isString()
    .withMessage('Description must be a string'),
    body('tasks.*.data.dueDate')
    .optional({ nullable: true })
    .isISO8601()
    .withMessage('Due date must be a valid date in ISO 8601 format'),
    body('tasks.*.data.hasTime')
    .optional()
    .isBoolean()
    .withMessage('Has Time must be a boolean'),
    body('tasks.*.data.priority')
    .optional()    
    .isIn(['low', 'medium', 'high', 'none'])
    .withMessage('Priority must be one of: low, medium, high, none'),
    body('tasks.*.data.categoryId')
    .optional()
    .isString()
    .withMessage('Category must be a string')
    .isMongoId()
    .withMessage('Category ID must be a valid MongoDB ObjectId'),
    body('tasks.*.data.status')
    .optional()
    .isString()
    .withMessage('Status must be a string')
    .isIn(['pending', 'scheduled', 'completed'])
    .withMessage('Status must be one of: pending, scheduled, completed'),
  validateResult('Multiple tasks updated validation')
];


export const deleteTaskMiddleware = [
  param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
  validateResult('Delete task validation')
];

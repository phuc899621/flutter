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
//#region Get Tasks
export const getTasksMiddleware = [
  query('title')
    .optional()
    .isString()
    .withMessage('Title must be a string'),
  query('description')
    .optional()
    .isString()
    .withMessage('Description must be a string'),
  query('dueDate')
    .optional({ nullable: true })
    .isISO8601()
    .withMessage('Due date must be a valid date in ISO 8601 format'),
  query('hasTime')
    .optional()
    .isBoolean()
    .withMessage('Has Time must be a boolean'),
  query('priority')
    .optional()
    .isIn(['low', 'medium', 'high', 'none'])
    .withMessage('Priority must be one of: low, medium, high, none'),

  query('categoryId')
    .optional()
    .isMongoId()
    .withMessage('Category ID must be a valid MongoDB ObjectId'),
  query('status')
    .optional()
    .isIn(['pending', 'scheduled', 'completed'])
    .withMessage('Status must be one of: pending, scheduled, completed'),
  query('page')
    .optional()
    .isInt()
    .withMessage('Page must be an integer'),
  query('limit')
    .optional()
    .isInt()
    .withMessage('Limit must be an integer'),
    query('sortBy')
    .optional()
    .isIn(['createdAt', 'updatedAt', 'dueDate'])
    .withMessage('SortBy must be one of: createdAt, updatedAt, dueDate'),
    query('sortOrder')
    .optional()
    .isIn(['asc', 'desc'])
    .withMessage('SortOrder must be one of: asc, desc'),
  validateResult('Get tasks validation')
]
//#endregion

//#region Get Sync Task
export const getSyncTasksMiddleware = [
  query('lastSyncTime')
    .optional()
    .isISO8601()
    .withMessage('Last sync time must be a valid date in ISO 8601 format'),
  validateResult('Get tasks validation')
]
//#region Get 1 task
export const getTaskMiddleware = [
  param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
  validateResult('Get task validation')
];
//#endregion

//#region Create Task
export const createTaskMiddleware = [
  body('localId')
    .optional()
    .isInt()
    .withMessage('Local ID must be an integer'),
  body('title')
    .notEmpty().withMessage('Title is required')
    .isString()
    .withMessage('Title must be a string'),
    body('description')
    .optional()
    .isString()
    .withMessage('Description must be a string'),
    body('categoryId')
    .optional()
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
    body('subtasks.*.localId')
    .optional()
    .isInt()
    .withMessage('Subtask\'s localId must be an integer'),
    body('subtasks.*.title')
    .notEmpty()
    .withMessage('Subtask title is required')
    .isString()
    .withMessage('Subtask title must be a string'),
    body('subtasks.*.isCompleted')
    .optional()
    .isBoolean()
    .withMessage('isCompleted must be a boolean'),
    validateResult('Create task validation')
];
//#endregion

//#region Update Full Task
export const updateTaskFullMiddleware = [
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    body('localId')
    .optional()
    .isInt()
    .withMessage('task\'s localId must be an integer'),
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
//#endregion

//#region Update Partial Task
export const updateTaskPartialMiddleware = [
    param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    body('localId')
    .optional()
    .isInt()
    .withMessage('task\'s localId must be an integer'),
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
//#endregion

//#region Update Tasks Bulk
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
    body('ids.*.localId')
    .optional()
    .isInt()
    .withMessage('Task\'s localId must be an integer'),
    body('ids.*.id')
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
//#endregion

//#region Update Multiple Tasks
export const updateMultipleTasksMiddleware = [
  body('tasks')
    .notEmpty()
    .withMessage('List of updated tasks are required')
    .isArray()
    .withMessage('List of updated tasks must be an array'),
    body('tasks.*.id')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
    body('tasks.*.localId')
    .optional()
    .isInt()
    .withMessage('Task\'s localId must be an integer'),
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
//#endregion

//#region Delete Task
export const deleteTaskMiddleware = [
  param('taskId')
    .notEmpty()
    .withMessage('Task ID is required')
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
  validateResult('Delete task validation')
];
//#endregion

//#region Delete Bulk Tasks
export const deleteBulkTasksMiddleware = [
  body('ids')
    .notEmpty()
    .withMessage('List of task IDs are required')
    .isArray()
    .withMessage('List of task IDs must be an array'),
    body('ids.*')
    .optional()
    .isMongoId()
    .withMessage('Task ID must be a valid MongoDB ObjectId'),
  validateResult('Delete bulk tasks validation')
]

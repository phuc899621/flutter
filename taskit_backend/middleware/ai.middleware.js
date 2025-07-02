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
export const ai_category=[
  body('title')
  .exists()
  .withMessage('title is required')
  .isString()
  .withMessage('title must be a string'),
  body('excludedCategories')
  .optional()
  .isArray()
  .withMessage('excludedCategories must be an array'),
  body('excludedCategories.*')
  .optional()
  .isString()
  .withMessage('excludedCategories must be a string array'),
  validateResult('AI Category')
]

export const ai_create_task=[
  body('text')
  .exists()
  .withMessage('text is required')
  .isString()
  .withMessage('text must be a string'),
  header('utcOffset')
  .optional()
  .isString()
  .withMessage('user-utc-offset must be a string'),
  validateResult('AI Create Task')
]

export const ai_answer_task_question=[
  body('text')
  .exists()
  .withMessage('text is required')
  .isString()
  .withMessage('text must be a string'),
  header('utcOffset')
  .optional()
  .isString()
  .withMessage('user-utc-offset must be a string'),
  body('language')
  .optional()
  .isIn(['en', 'vi'])
  .withMessage('language must be one of: en, vi'),
  validateResult('AI Answer Task Question')
]
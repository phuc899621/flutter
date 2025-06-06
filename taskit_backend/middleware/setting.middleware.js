import { body, header, validationResult } from 'express-validator';

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

export const update_setting=[
    body('isNotificationEnabled')
        .optional()
        .isBoolean()
        .withMessage('isNotificationEnabled must be a boolean'),
    
    body('language')
        .optional()
        .isIn(['en', 'vi'])
        .withMessage('Language must be one of: en, vi'),
    
    body('theme')
        .optional()
        .isIn(['light', 'dark'])
        .withMessage('Theme must be one of: light, dark'),
    
    body('remindBefore')
        .optional()
        .isIn([15, 30, 60, 1440, 10080])
        .withMessage('RemindBefore must be one of: 15, 30, 60, 1440, 10080'),
    validateResult('Update setting validation error')
]
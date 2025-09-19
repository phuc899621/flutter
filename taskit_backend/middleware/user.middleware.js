import { body, header, validationResult } from 'express-validator';

const validateResult = (prefix = 'Validation') => (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    const firstError = errors.array()[0].msg;
    return res.status(400).json({
      message: `${prefix} Bad Request: ${firstError}`,
      data: {}
    });
  }
  next();
};

export const update_email = [
  body('email')
    .trim()
    .notEmpty()
    .withMessage('Email is required')
    .isEmail()
    .withMessage('Invalid email address'),
    validateResult('Email update')
];
export const update_email_verify = [
  body('otp')
    .trim()
    .notEmpty()
    .withMessage('OTP is required')
    .isNumeric()
    .withMessage('OTP must be numeric'),
  body('email')
    .trim()
    .notEmpty()
    .withMessage('Email is required')
    .isEmail()
    .withMessage('Invalid email address'),
  validateResult('Email update verification')
];
export const update_password = [
  body('oldPassword')
    .trim()
    .notEmpty()
    .withMessage('Old password is required'),
  body('newPassword')
    .trim()
    .notEmpty()
    .withMessage('New password is required')
    .isLength({ min: 3 })
    .withMessage('New password must be at least 3 characters long'),
  body('newPasswordConfirm')
    .trim()
    .notEmpty()
    .withMessage('New password confirmation is required')
    .custom((value, { req }) => {
      if (value !== req.body.newPassword) {
        throw new Error('New password confirmation does not match');
      }
      return true;
    }), 
  validateResult('Password update')
];

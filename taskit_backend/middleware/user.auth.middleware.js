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


export const signup = [
  body('name')
    .trim()
    .notEmpty()
    .withMessage('Name is required')
    .isLength({ min: 3 })
    .withMessage('Name must be at least 3 characters long'),

  body('email')
    .trim()
    .notEmpty()
    .withMessage('Email is required')
    .isEmail()
    .withMessage('Invalid email address'),

  body('password')
    .trim()
    .notEmpty()
    .withMessage('Password is required')
    .isLength({ min: 3 })
    .withMessage('Password must be at least 3 characters'),
  body('passwordConfirm')
    .trim()
    .notEmpty()
    .withMessage('Password confirmation is required')
    .custom((value, { req }) => {
      if (value !== req.body.password) {
        throw new Error('Passwords do not match');
      }
      return true;
    }),

  validateResult('Signup')
];

export const signup_verify = [
  body('email')
    .trim()
    .notEmpty()
    .withMessage('Email is required')
    .isEmail()
    .withMessage('Invalid email address'),

  body('otp')
    .trim()
    .notEmpty()
    .withMessage('OTP is required')
    .isLength({ min: 4, max: 4 })
    .withMessage('OTP must be exactly 4 characters long'),
  validateResult('Signup verification')
];
export const login = [
  body('email')
    .trim()
    .notEmpty()
    .withMessage('Email is required')
    .isEmail()
    .withMessage('Invalid email address'),

  body('password')
    .trim()
    .notEmpty()
    .withMessage('Password is required')
    .isLength({ min: 3 })
    .withMessage('Password must be at least 3 characters'),

  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      const firstError = errors.array()[0].msg;
      return res.status(400).json({
        message: `Login error: ${firstError}`,
        data: {}
      });
    }
    next();
  },
];

export const forgot_password = [
  body('email')
    .trim()
    .notEmpty()
    .withMessage('Email is required')
    .isEmail()
    .withMessage('Invalid email address'),
  validateResult('Forgot password')
];
export const forgot_password_verify = [
  body('email')
    .trim()
    .notEmpty()
    .withMessage('Email is required')
    .isEmail()
    .withMessage('Invalid email address'),

  body('otp')
    .trim()
    .notEmpty()
    .withMessage('OTP is required')
    .isLength({ min: 4, max: 4 })
    .withMessage('OTP must be exactly 4 characters long'),

  validateResult('Forgot password verification')
];
export const forgot_password_reset = [
  header('reset-token')
    .notEmpty()
    .withMessage('Reset token is required'),
  body('email')
    .trim()
    .notEmpty()
    .withMessage('Email is required')
    .isEmail()
    .withMessage('Invalid email address'),
  body('password')
    .trim()
    .notEmpty()
    .withMessage('Password is required')
    .isLength({ min: 3 })
    .withMessage('Password must be at least 3 characters'),
  body('passwordConfirm')
    .trim()
    .notEmpty()
    .withMessage('Password confirmation is required')
    .custom((value, { req }) => {
      if (value !== req.body.password) {
        throw new Error('Passwords do not match');
      }
      return true;
    }),
  validateResult('Forgot password reset')
];

export const login_verify = [
  header('authorization')
    .notEmpty()
    .withMessage('Authorization header is required')
    .custom((value) => {
      if (!value.startsWith('Bearer ')) {
        throw new Error('Authorization header must start with Bearer');
      }
      return true;
    }),
  validateResult('Login verification')
]

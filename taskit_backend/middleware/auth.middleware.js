import { body, header, validationResult } from 'express-validator';

const validateResult = (prefix = 'Validation') => (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    const firstError = errors.array()[0].msg;
    return res.status(400).json({
      message: `${firstError}`,
      data: {}
    });
  }
  next();
};



export const signupMiddleware = [
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
  body('username')
    .trim()
    .notEmpty()
    .withMessage('Username is required')
    .isLength({ min: 6 })
    .withMessage('Username must be at least 6 characters long')
    .custom((value) => {
      if(!/^[A-Za-z]/.test(value)) {
        throw new Error('Username must start with a letter');
      }
    }),

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

export const verifySignupMiddleware = [
  body('id')
    .trim()
    .notEmpty()
    .withMessage('user Id is required')
    .isMongoId()
    .withMessage('User ID must be a valid MongoDB ObjectId'),
  body('otp')
    .trim()
    .notEmpty()
    .withMessage('OTP is required')
    .isString()
    .withMessage('OTP must be a string of number')
    .isLength({ min: 4, max: 4 })
    .withMessage('OTP must be exactly 4 characters long'),
  validateResult('Signup verification')
];

export const resendSignupOtpMiddleware = [
  body('id')
    .trim()
    .notEmpty()
    .withMessage('User id is required')
    .isMongoId()
    .withMessage('User ID must be a valid MongoDB ObjectId'),
  validateResult('Send verify otp')
]

export const loginMiddleware = [
  body('identifier')
    .trim()
    .notEmpty()
    .withMessage('Email or username is required'),

  body('password')
    .trim()
    .notEmpty()
    .withMessage('Password is required')
    .isLength({ min: 3 })
    .withMessage('Password must be at least 3 characters'),
  validateResult('Login')
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

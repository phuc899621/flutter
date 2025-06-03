import { body, validationResult } from 'express-validator';

export const signup = [
  body('name')
    .trim()
    .notEmpty()
    .withMessage('Name is required')
    .isLength({ min: 3 })
    .withMessage('Name must be at least 3 characters long'),

  body('email')
    .trim()
    .isEmail()
    .withMessage('Invalid email address'),

  body('password')
    .isLength({ min: 6 })
    .withMessage('Password must be at least 6 characters'),
  body('passwordConfirm')
    .custom((value, { req }) => {
      if (value !== req.body.password) {
        throw new Error('Passwords do not match');
      }
      return true;
    }),

  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      const firstError = errors.array()[0].msg;
      return res.status(400).json({
        message: `Signup error: ${firstError}`,
        data: {}
      });
    }

    next();
  },
];

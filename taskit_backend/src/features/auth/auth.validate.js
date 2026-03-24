
import Joi from 'joi';
import validate  from '../../middleware/validate.js';
import { joiMsg } from '../../utils/joi.helper.js';

export const signupValidate = validate({
  body: Joi.object({
    email: Joi.string()
      .trim()
      .email()
      .required()
      .messages(joiMsg("Email", { email: true })),

    password: Joi.string()
      .trim()
      .min(8)
      .required()
      .messages(joiMsg("Password", { min: 8 })),
  })
})

export const verifySignupMiddleware = validate(Joi.object({

  id: Joi.string()
    .length(24)
    .required()
    .messages({
      "string.empty": "user Id is required",
      "string.length": "User ID must be a valid MongoDB ObjectId"
    }),

  otp: Joi.string()
    .length(4)
    .required()
    .messages({
      "string.empty": "OTP is required",
      "string.length": "OTP must be exactly 4 characters long"
    })

}))
export const resendSignupOtpMiddleware = validate(Joi.object({

  id: Joi.string()
    .length(24)
    .required()
    .messages({
      "string.empty": "User id is required",
      "string.length": "User ID must be a valid MongoDB ObjectId"
    })

}))

export const loginMiddleware = validate(Joi.object({

  identifier: Joi.string()
    .trim()
    .required()
    .messages({
      "string.empty": "Email or username is required"
    }),

  password: Joi.string()
    .trim()
    .min(3)
    .required()
    .messages({
      "string.empty": "Password is required",
      "string.min": "Password must be at least 3 characters"
    })

}))

export const forgotPasswordMiddleware = validate(Joi.object({

  email: Joi.string()
    .trim()
    .email()
    .required()
    .messages({
      "string.empty": "Email is required",
      "string.email": "Invalid email address"
    })

}))
export const forgotPasswordVerifyMiddleware = validate(Joi.object({

  email: Joi.string()
    .trim()
    .email()
    .required(),

  otp: Joi.string()
    .length(4)
    .required()
    .messages({
      "string.empty": "OTP is required",
      "string.length": "OTP must be exactly 4 characters long"
    })

}))
export const resetPasswordMiddleware = validate(Joi.object({

  email: Joi.string()
    .trim()
    .email()
    .required()
    .messages({
      "string.empty": "Email is required",
      "string.email": "Invalid email address"
    }),

  password: Joi.string()
    .trim()
    .min(3)
    .required()
    .messages({
      "string.empty": "Password is required",
      "string.min": "Password must be at least 3 characters"
    }),

  passwordConfirm: Joi.any()
    .valid(Joi.ref("password"))
    .required()
    .messages({
      "any.only": "Passwords do not match"
    })

}))

export const loginVerifyHeaderMiddleware = validate(Joi.object({

  authorization: Joi.string()
    .pattern(/^Bearer\s.+$/)
    .required()
    .messages({
      "any.required": "Authorization header is required",
      "string.pattern.base":
        "Authorization header must start with Bearer"
    })

}).unknown(true),"headers")
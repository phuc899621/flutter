import Joi from "joi";
import validate from "../../middleware/validate.js";
import { joiMsg } from "../../utils/joi.helper.js";

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
  }),
});

export const verifySignupValidate = validate({
  body: Joi.object({
    email: Joi.string()
      .required()
      .email()
      .messages(joiMsg("Email", { email: true })),

    otp: Joi.string()
      .length(4)
      .required()
      .messages(joiMsg("OTP", { min: 4 })),
  }),
});
export const resendSignupOtpValidate = validate({
  params: Joi.object({
    email: Joi.string()
      .trim()
      .required()
      .email()
      .messages(joiMsg("Email", { email: true })),
  }),
});

export const loginValidate = validate({
  body: Joi.object({
    email: Joi.string()
      .trim()
      .required()
      .email()
      .messages(joiMsg("Email", { email: true })),

    password: Joi.string()
      .trim()
      .min(8)
      .required()
      .messages(joiMsg("Password", { min: 8 })),
  }),
});

export const forgotPasswordMiddleware = validate(
  Joi.object({
    email: Joi.string().trim().email().required().messages({
      "string.empty": "Email is required",
      "string.email": "Invalid email address",
    }),
  }),
);
export const forgotPasswordVerifyMiddleware = validate(
  Joi.object({
    email: Joi.string().trim().email().required(),

    otp: Joi.string().length(4).required().messages({
      "string.empty": "OTP is required",
      "string.length": "OTP must be exactly 4 characters long",
    }),
  }),
);
export const resetPasswordMiddleware = validate(
  Joi.object({
    email: Joi.string().trim().email().required().messages({
      "string.empty": "Email is required",
      "string.email": "Invalid email address",
    }),

    password: Joi.string().trim().min(3).required().messages({
      "string.empty": "Password is required",
      "string.min": "Password must be at least 3 characters",
    }),

    passwordConfirm: Joi.any().valid(Joi.ref("password")).required().messages({
      "any.only": "Passwords do not match",
    }),
  }),
);

export const loginVerifyHeaderMiddleware = validate(
  Joi.object({
    authorization: Joi.string()
      .pattern(/^Bearer\s.+$/)
      .required()
      .messages({
        "any.required": "Authorization header is required",
        "string.pattern.base": "Authorization header must start with Bearer",
      }),
  }).unknown(true),
  "headers",
);

import Joi from "joi";
import validate from "../../middleware/validate.js";
import { joiMsg } from "../../shared/helpers/validation.helper.js";

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
  body: Joi.object({
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
export const refreshTokenValidate = validate({
  body: Joi.object({
    refreshToken: Joi.string().required().messages(joiMsg("Refresh token")),
  }),
});
export const logoutValidate = validate({
  body: Joi.object({
    refreshToken: Joi.string().required().messages(joiMsg("Refresh token")),
  }),
});

export const loginWithGoogleValidate = validate({
  body: Joi.object({
    token: Joi.string().required().messages(joiMsg("Token")),
  }),
});
export const forgotPasswordValidate = validate({
  body: Joi.object({
    email: Joi.string()
      .trim()
      .email()
      .required()
      .messages(joiMsg("Email", { email: true })),
  }),
});
export const forgotPasswordVerifyValidate = validate({
  body: Joi.object({
    email: Joi.string()
      .trim()
      .email()
      .required()
      .messages(joiMsg("Email", { email: true })),
    otp: Joi.string()
      .length(4)
      .required()
      .messages(joiMsg("OTP", { exactly: 4 })),
  }),
});
export const resetPasswordValidate = validate({
  body: Joi.object({
    resetToken: Joi.string().trim().required().messages(joiMsg("Reset token")),
    password: Joi.string()
      .trim()
      .min(8)
      .required()
      .messages(joiMsg("Password", { min: 8 })),
  }),
});

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

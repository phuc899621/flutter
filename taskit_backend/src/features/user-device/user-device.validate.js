import Joi from "joi";
import { joiMsg } from "../../shared/helpers/validation.helper.js";
import validate from "../../middleware/validate.js";
export const registerDeviceValidate = validate({
  body: Joi.object({
    fcmToken: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Fcm token", { required: true, string: true })),
    platform: Joi.string()
      .trim()
      .required()
      .valid("android", "ios")
      .messages(
        joiMsg("Platform", {
          required: true,
          string: true,
          values: ["android", "ios"],
        }),
      ),
    deviceId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Device id", { required: true, string: true })),
  }),
});

export const updateFcmTokenValidate = validate({
  body: Joi.object({
    fcmToken: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Fcm token", { required: true, string: true })),
    platform: Joi.string()
      .trim()
      .required()
      .valid("android", "ios")
      .messages(
        joiMsg("Platform", {
          required: true,
          string: true,
          values: ["android", "ios"],
        }),
      ),
    deviceId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Device id", { required: true, string: true })),
  }),
});

export const removeDeviceValidate = validate({
  body: Joi.object({
    deviceId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Device id", { required: true, string: true })),
  }),
});

import Joi from "joi";
import validate from "../../middleware/validate.js";
import { joiMsg } from "../../shared/helpers/validation.helper.js";
import { body, header, param } from "express-validator";

export const getCategoriesValidate = validate({
  query: Joi.object({
    lastSyncTime: Joi.date()
      .optional()
      .messages(joiMsg("Last sync time", { date: true })),
  }),
});
export const getCategoryValidate = validate({
  params: Joi.object({
    id: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Id", { required: true })),
  }),
});
export const createCategoryValidate = validate({
  body: Joi.object({
    localId: Joi.number()
      .optional()
      .messages(joiMsg("Local id", { number: true })),
    name: Joi.string()
      .trim()
      .required()
      .min(3)
      .messages(joiMsg("Name", { required: true, min: 3 })),
  }),
});
export const updateCategoryValidate = validate({
  params: Joi.object({
    id: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Id", { required: true })),
  }),
  body: Joi.object({
    name: Joi.string()
      .trim()
      .required()
      .min(3)
      .messages(joiMsg("Name", { required: true, min: 3 })),
  }),
});
export const deleteCategoryValidate = validate({
  params: Joi.object({
    id: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Id", { required: true })),
  }),
});

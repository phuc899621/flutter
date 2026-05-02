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
export const pullCategoriesValidate = validate({
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
export const syncCategoriesValidate = validate({
  body: Joi.object({
    categories: Joi.array()
      .items(
        Joi.object({
          id: Joi.string()
            .trim()
            .allow(null)
            .optional()
            .messages(joiMsg("Id", { string: true })),
          localId: Joi.number()
            .required()
            .messages(joiMsg("Local id", { number: true })),
          name: Joi.string()
            .trim()
            .required()
            .messages(joiMsg("Name", { required: true })),
          updatedAt: Joi.date()
            .optional()
            .allow(null)
            .messages(joiMsg("Updated at", { date: true })),
        }),
      )
      .required()
      .messages(joiMsg("Categories", { required: true, array: true })),
  }),
});
export const syncDeletedValidate = validate({
  body: Joi.object({
    categories: Joi.array()
      .items(
        Joi.object({
          id: Joi.string()
            .trim()
            .required()
            .messages(joiMsg("Id", { string: true, required: true })),
          localId: Joi.number()
            .required()
            .messages(joiMsg("Local id", { number: true })),
        }),
      )
      .required()
      .messages(joiMsg("Categories", { required: true, array: true })),
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

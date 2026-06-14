import validate from "../../middleware/validate.js";
import Joi from "joi";
import { joiMsg } from "../../shared/helpers/validation.helper.js";
import { param } from "express-validator";

export const syncSubtasksValidate = validate({
  body: Joi.object({
    subtasks: Joi.array()
      .items(
        Joi.object({
          id: Joi.string()
            .trim()
            .allow(null)
            .optional()
            .messages(joiMsg("Id", { string: true })),
          taskId: Joi.string()
            .trim()
            .required()
            .messages(joiMsg("Task id", { required: true })),
          localId: Joi.number()
            .optional()
            .messages(joiMsg("Local id", { number: true })),
          deleted: Joi.boolean()
            .default(false)
            .messages(joiMsg("Is deleted", { boolean: true })),
          title: Joi.string()
            .trim()
            .required()
            .messages(joiMsg("Title", { required: true })),
          completedAt: Joi.date()
            .optional()
            .allow(null)
            .messages(joiMsg("Completed at", { date: true })),
          completed: Joi.boolean()
            .default(false)
            .messages(joiMsg("Is completed", { boolean: true })),
          updatedAt: Joi.date()
            .optional()
            .allow(null)
            .messages(joiMsg("Updated at", { date: true })),
        }),
      )
      .required()
      .messages(joiMsg("Subtasks", { required: true, array: true })),
  }),
});

export const syncDeletedSubtasksValidate = validate({
  body: Joi.object({
    subtasks: Joi.array()
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
      .messages(joiMsg("Subtasks", { required: true, array: true })),
  }),
});
export const createSubtaskValidate = validate({
  params: Joi.object({
    taskId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Task id", { required: true, string: true })),
  }),
  body: Joi.object({
    title: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Title", { required: true })),
  }),
});

export const updateSubtaskValidate = validate({
  params: Joi.object({
    taskId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Task id", { required: true, string: true })),
    subtaskId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Subtask id", { required: true, string: true })),
  }),
  body: Joi.object({
    title: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Title", { required: true })),
    completed: Joi.boolean()
      .optional()
      .messages(joiMsg("Is completed", { boolean: true })),
    completedAt: Joi.date()
      .optional()
      .allow(null)
      .messages(joiMsg("Completed at", { date: true })),
  }),
});

export const deleteSubtaskValidate = validate({
  params: Joi.object({
    taskId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Task id", { required: true, string: true })),
    subtaskId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Subtask id", { required: true, string: true })),
  }),
});

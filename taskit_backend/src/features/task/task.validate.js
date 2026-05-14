import validate from "../../middleware/validate.js";
import Joi from "joi";
import { joiMsg } from "../../shared/helpers/validation.helper.js";
export const createTaskValidate = validate({
  body: Joi.object({
    localId: Joi.number()
      .optional()
      .messages(joiMsg("Local id", { number: true })),
    title: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Title", { required: true })),
    description: Joi.string()
      .trim()
      .allow("")
      .default("")
      .messages(joiMsg("Description", { string: true })),
    categoryId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Category id", { required: true })),
    priority: Joi.string()
      .trim()
      .valid("low", "medium", "high", "none")
      .default("none")
      .messages(
        joiMsg("Priority", {
          string: true,
          values: ["low", "medium", "high", "none"],
        }),
      ),
    status: Joi.string()
      .trim()
      .valid("pending", "scheduled", "completed")
      .default("pending")
      .messages(
        joiMsg("Status", {
          string: true,
          values: ["pending", "scheduled", "completed"],
        }),
      ),
    dueDate: Joi.date()
      .allow(null)
      .default(null)
      .messages(joiMsg("Due date", { date: true })),
    hasTime: Joi.boolean()
      .default(false)
      .messages(joiMsg("Has time", { boolean: true })),
    subtasks: Joi.array()
      .items(
        Joi.object({
          localId: Joi.number()
            .optional()
            .messages(joiMsg("Subtask local id", { number: true })),
          title: Joi.string()
            .trim()
            .required()
            .messages(joiMsg("Subtask title", { required: true })),
          completed: Joi.boolean()
            .default(false)
            .messages(joiMsg("Is completed", { boolean: true })),
        }),
      )
      .default([]),
  }),
});

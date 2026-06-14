import validate from "../../middleware/validate.js";
import Joi from "joi";
import { joiMsg } from "../../shared/helpers/validation.helper.js";
import { param } from "express-validator";

export const getTaskValidate = validate({
  params: Joi.object({
    taskId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Task id", { required: true })),
  }),
});

export const getTasksValidate = validate({
  query: Joi.object({
    title: Joi.string()
      .optional()
      .trim()
      .messages(joiMsg("Title", { string: true })),
    status: Joi.string()
      .optional()
      .trim()
      .valid("scheduled", "pending", "completed")
      .messages(
        joiMsg("Status", {
          string: true,
          values: ["scheduled", "pending", "completed"],
        }),
      ),
    priority: Joi.string()
      .optional()
      .trim()
      .valid("low", "medium", "high", "none")
      .messages(
        joiMsg("Priority", {
          string: true,
          values: ["low", "medium", "high", "none"],
        }),
      ),
    dueDate: Joi.date()
      .optional()
      .messages(joiMsg("Due date", { date: true })),
    hasTime: Joi.boolean()
      .optional()
      .messages(joiMsg("Has time", { boolean: true })),
    categoryId: Joi.string()
      .optional()
      .trim()
      .messages(joiMsg("Category id", { string: true })),
    page: Joi.number()
      .optional()
      .messages(joiMsg("Page", { number: true })),
    limit: Joi.number()
      .optional()
      .messages(joiMsg("Limit", { number: true })),
    sortBy: Joi.string()
      .optional()
      .trim()
      .valid("createdAt", "updatedAt", "dueDate")
      .messages(
        joiMsg("Sort by", {
          string: true,
          values: ["createdAt", "updatedAt", "dueDate"],
        }),
      ),
    sortOrder: Joi.string()
      .optional()
      .valid("asc", "desc")
      .messages(
        joiMsg("Sort order", { string: true, values: ["asc", "desc"] }),
      ),
  }),
});

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

export const syncTasksValidate = validate({
  body: Joi.object({
    tasks: Joi.array().items(
      Joi.object({
        id: Joi.string()
          .required()
          .trim()
          .messages(joiMsg("Id", { string: true, required: true })),
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
        completedAt: Joi.date()
          .optional()
          .allow(null)
          .messages(joiMsg("Completed at", { date: true })),
        dueDate: Joi.date()
          .allow(null)
          .default(null)
          .messages(joiMsg("Due date", { date: true })),
        hasTime: Joi.boolean()
          .default(false)
          .messages(joiMsg("Has time", { boolean: true })),
        updatedAt: Joi.date()
          .optional()
          .messages(joiMsg("Updated at", { date: true })),
      }),
    ),
  }),
});
export const pullTasksValidate = validate({
  query: Joi.object({
    lastSyncTime: Joi.date()
      .optional()
      .messages(joiMsg("Last sync time", { date: true })),
  }),
});
export const syncDeletedValidate = validate({
  body: Joi.object({
    tasks: Joi.array()
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
      .messages(joiMsg("Tasks", { required: true, array: true })),
  }),
});
export const updateTaskValidate = validate({
  params: Joi.object({
    taskId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Task id", { required: true, string: true })),
  }),
  body: Joi.object({
    localId: Joi.number()
      .optional()
      .messages(joiMsg("Local id", { number: true })),
    title: Joi.string()
      .trim()
      .optional()
      .messages(joiMsg("Title", { string: true })),
    completedAt: Joi.date()
      .optional()
      .allow(null)
      .messages(joiMsg("Completed at", { date: true })),
    description: Joi.string()
      .optional()
      .trim()
      .allow("")
      .messages(joiMsg("Description", { string: true })),
    dueDate: Joi.date()
      .optional()
      .allow(null)
      .messages(joiMsg("Due date", { date: true })),
    hasTime: Joi.boolean()
      .optional()
      .messages(joiMsg("Has time", { boolean: true })),
    categoryId: Joi.string()
      .optional()
      .trim()
      .messages(joiMsg("Category id", { string: true })),
    priority: Joi.string()
      .optional()
      .trim()
      .valid("low", "medium", "high", "none")
      .messages(
        joiMsg("Priority", {
          string: true,
          values: ["low", "medium", "high", "none"],
        }),
      ),
    status: Joi.string()
      .optional()
      .trim()
      .valid("pending", "scheduled", "completed")
      .messages(
        joiMsg("Status", {
          string: true,
          values: ["pending", "scheduled", "completed"],
        }),
      ),
  })
    .min(1)
    .messages({
      "object.min": "At least one field is required",
    }),
});

export const deleteTaskValidate = validate({
  params: Joi.object({
    taskId: Joi.string()
      .trim()
      .required()
      .messages(joiMsg("Task id", { required: true })),
  }),
});

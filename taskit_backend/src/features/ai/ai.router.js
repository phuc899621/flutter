import express from "express";
import * as AIController from "./ai.controller.js";
import * as AIMiddleware from "./ai.middleware.js";
import { authMiddleware } from "../../middleware/auth.middleware.js";

const router = express.Router();

router.get(
  "/category",
  authMiddleware,
  AIMiddleware.ai_category,
  AIController.suggestCategories,
);
router.get(
  "/task",
  authMiddleware,
  AIMiddleware.ai_create_task,
  AIController.createTaskUsingAi,
);
router.get(
  "/question",
  authMiddleware,
  AIMiddleware.ai_answer_task_question,
  AIController.answerTaskQuestion,
);

export default router;

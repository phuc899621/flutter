import express from "express";
import * as CategoryController from "./category.controller.js";
import { authMiddleware } from "../../middleware/auth.middleware.js";
import * as CategoryValidate from "./category.validate.js";
import { sessionMiddleware } from "../../middleware/session.middleware.js";
const router = express.Router();
router.get(
  "/",
  authMiddleware,
  CategoryValidate.getCategoriesValidate,
  CategoryController.getCategories,
);
router.get(
  "/pull",
  authMiddleware,
  CategoryValidate.pullCategoriesValidate,
  CategoryController.pullCategories,
);
router.get(
  "/:id",
  authMiddleware,
  CategoryValidate.getCategoryValidate,
  CategoryController.getCategory,
);
router.post(
  "/",
  sessionMiddleware,
  CategoryValidate.createCategoryValidate,
  CategoryController.createCategory,
);
router.post(
  "/sync",
  sessionMiddleware,
  CategoryValidate.syncCategoriesValidate,
  CategoryController.syncCategories,
);
router.delete(
  "/sync",
  sessionMiddleware,
  CategoryValidate.syncDeletedValidate,
  CategoryController.syncDeletedCategories,
);
router.put(
  "/:id",
  sessionMiddleware,
  CategoryValidate.updateCategoryValidate,
  CategoryController.updateCategoryFull,
);

router.delete(
  "/:id",
  sessionMiddleware,
  CategoryValidate.deleteCategoryValidate,
  CategoryController.deleteCategory,
);

export default router;

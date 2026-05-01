import express from "express";
import * as CategoryController from "./category.controller.js";
import { authMiddleware } from "../../middleware/auth.middleware.js";
import * as CategoryValidate from "./category.validate.js";
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
  authMiddleware,
  CategoryValidate.createCategoryValidate,
  CategoryController.createCategory,
);
router.post(
  "/sync",
  authMiddleware,
  CategoryValidate.syncCategoriesValidate,
  CategoryController.syncCategories,
);
router.delete(
  "/sync",
  authMiddleware,
  CategoryValidate.syncDeletedValidate,
  CategoryController.syncDeletedCategories,
);
router.put(
  "/:id",
  authMiddleware,
  CategoryValidate.updateCategoryValidate,
  CategoryController.updateCategoryFull,
);

router.delete(
  "/:id",
  authMiddleware,
  CategoryValidate.deleteCategoryValidate,
  CategoryController.deleteCategory,
);

export default router;

import express from "express";
import * as SettingController from "./setting.controller.js";
import * as SettingMiddleware from "./setting.middleware.js";
import { authMiddleware } from "../../middleware/auth.middleware.js";
const router = express.Router();

router.get("/", authMiddleware, SettingController.get_setting);
router.patch(
  "/",
  authMiddleware,
  SettingMiddleware.update_setting,
  SettingController.update_setting,
);
router.delete("/", authMiddleware, SettingController.delete_setting);

export default router;

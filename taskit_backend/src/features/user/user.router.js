import express from "express";
import * as AuthController from "../auth/auth.controller.js";
import * as UserMiddleware from "../user/user.middleware.js";
import { upload } from "../upload/upload.middleware.js";
import * as UserController from "../user/user.controller.js";
import { multerErrorHandler } from "../upload/multer.middleware.js";
import { authMiddleware } from "../../middleware/auth.middleware.js";

const router = express.Router();

router.get("/login/verify", AuthController.login_verify);

router.put(
  "/",
  authMiddleware,
  upload.single("avatar"),
  UserController.update_profile,
  multerErrorHandler,
);
router.put(
  "/email",
  authMiddleware,
  UserMiddleware.update_email,
  UserController.update_email,
);
router.put(
  "/email/verify",
  authMiddleware,
  UserMiddleware.update_email_verify,
  UserController.update_email_verify,
);
router.put(
  "/password",
  authMiddleware,
  UserMiddleware.update_password,
  UserController.update_password,
);
router.delete("/", authMiddleware, UserController.delete_account);

export default router;

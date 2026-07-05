import express from "express";
import * as UserDeviceController from "./user-device.controller.js";
import { authMiddleware } from "../../middleware/auth.middleware.js";
import { sessionMiddleware } from "../../middleware/session.middleware.js";

import {
  registerDeviceValidate,
  removeDeviceValidate,
  updateFcmTokenValidate,
} from "./user-device.validate.js";
const router = express.Router();
router.post(
  "/",
  authMiddleware,
  registerDeviceValidate,
  UserDeviceController.registerDevice,
);
router.put(
  "/",
  authMiddleware,
  updateFcmTokenValidate,
  UserDeviceController.updateFcmToken,
);

router.delete(
  "/",
  authMiddleware,
  removeDeviceValidate,
  UserDeviceController.removeDevice,
);
export default router;

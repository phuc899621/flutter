import express from "express";
import userRouter from "../../features/user/user.router.js";
import taskRouter from "../../features/task/task.router.js";
import aiRouter from "../../features/ai/ai.router.js";
import categoryRouter from "../../features/category/category.router.js";
import authRouter from "../../features/auth/auth.router.js";
import settingRouter from "../../features/setting/setting.router.js";
import deviceRoutes from "../../features/user-device/user-device.routes.js";
const router = express.Router();
router.use("/user", userRouter);
router.use("/auth", authRouter);
router.use("/tasks", taskRouter);
router.use("/devices", deviceRoutes);
router.use("/ai", aiRouter);
router.use("/categories", categoryRouter);
router.use("/uploads", express.static("uploads"));
router.use("/settings", settingRouter);

export default router;

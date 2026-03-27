import express from "express";
import * as AuthController from "./auth.controller.js";
import * as AuthValidate from "./auth.validate.js";

const router = express.Router();
router.post("/signup", AuthValidate.signupValidate, AuthController.signup);
router.post(
  "/signup/verify",
  AuthValidate.verifySignupValidate,
  AuthController.verifySignup,
);
router.post(
  "/signup/resend/:email",
  AuthValidate.resendSignupOtpValidate,
  AuthController.resendSignupOtp,
);
router.post("/login", AuthValidate.loginValidate, AuthController.login);
router.post(
  "/forgot-password",
  AuthValidate.forgotPasswordValidate,
  AuthController.forgotPassword,
);
router.post(
  "/forgot-password/verify",
  AuthValidate.forgotPasswordVerifyValidate,
  AuthController.forgotPasswordVerify,
);
router.put(
  "/forgot-password/reset",
  AuthValidate.resetPasswordValidate,
  AuthController.resetPassword,
);

export default router;

import e from "express";
import AuthService from "./auth.service.js";

export const signup = async (req, res, next) => {
  try {
    await AuthService.signup(req.body);
    return res.status(201).json({
      message: "Please check your email to verify your account",
    });
  } catch (e) {
    next(e);
  }
};
export const verifySignup = async (req, res, next) => {
  try {
    const { email, otp } = req.body;
    await AuthService.verifySignup(email, otp);
    return res.status(200).json({
      message: "Your account has been activated!",
    });
  } catch (e) {
    next(e);
  }
};
export const resendSignupOtp = async (req, res, next) => {
  try {
    const { email } = req.body;
    await AuthService.resendSignupOtp(email);
    return res.status(200).json({
      message: "OTP code has been resend to your email!",
    });
  } catch (e) {
    next(e);
  }
};

export const login = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const result = await AuthService.login(email, password);
    return res.status(200).json({
      message: "Login successfully!",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const fetchCurrentUser = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    const result = await AuthService.fetchCurrentUser(userId);
    return res.status(200).json({
      message: "Fetch current user successfully!",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const loginWithGoogle = async (req, res, next) => {
  try {
    const { token } = req.body;
    const result = await AuthService.loginWithGoogle(token);
    return res.status(200).json({
      message: "Login successfully!",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const refreshToken = async (req, res, next) => {
  try {
    const result = await AuthService.refreshToken(req.refreshToken);
    return res.status(200).json({
      message: "Refresh token successfully!",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const logout = async (req, res, next) => {
  try {
    const result = await AuthService.logout(req.refreshToken);
    return res.status(200).json({
      message: "Logout successfully!",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};

export const forgotPassword = async (req, res, next) => {
  try {
    await AuthService.forgotPassword(req.body);
    return res.status(201).json({
      message: "OTP for verify has been send to your email!",
    });
  } catch (e) {
    next(e);
  }
};

export const forgotPasswordVerify = async (req, res, next) => {
  try {
    const result = await AuthService.forgotPasswordVerify(req.body);
    return res.status(201).json({
      message: "Verify account for forgot password successfully!",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const resendForgotPasswordOtp = async (req, res, next) => {
  try {
    const { email } = req.body;
    await AuthService.resendForgotPasswordOtp(email);
    return res.status(200).json({
      message: "OTP code has been resend to your email!",
    });
  } catch (e) {
    next(e);
  }
};

export const resetPassword = async (req, res, next) => {
  try {
    await AuthService.resetPassword(req.body);
    return res.status(201).json({
      message: "Reset password successfully!",
    });
  } catch (e) {
    next(e);
  }
};

export const login_verify = async (req, res) => {
  try {
    const token = req.headers["authorization"].split(" ")[1];
    const result = await UserServices.login_verify(token);
    return res.status(200).json({
      message: "Token is valid!",
      data: result,
    });
  } catch (e) {
    const statusCode = e.statusCode || 500;
    return res.status(statusCode).json({
      message: e.message,
      data: {},
    });
  }
};

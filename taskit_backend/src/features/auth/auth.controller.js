import e from "express";
import AuthServices from "./auth.service.js";

export const signup = async (req, res, next) => {
  try {
    await AuthServices.signup(req.body);
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
    await AuthServices.verifySignup(email, otp);
    return res.status(200).json({
      message: "Your account has been activated!",
    });
  } catch (e) {
    next(e);
  }
};
export const resendSignupOtp = async (req, res, next) => {
  try {
    const { email } = req.params;
    await AuthServices.resendSignupOtp(email);
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
    const result = await AuthServices.login(email, password);
    return res.status(200).json({
      message: "Login successfully!",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const refresh = async (req, res, next) => {
  try {
    const result = await AuthServices.refreshToken(req.refreshToken);
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
    const result = await AuthServices.logout(req.refreshToken);
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
    await AuthServices.forgotPassword(req.body);
    return res.status(201).json({
      message: "OTP for verify has been send to your email!",
    });
  } catch (e) {
    next(e);
  }
};

export const forgotPasswordVerify = async (req, res, next) => {
  try {
    const result = await AuthServices.forgotPasswordVerify(req.body);
    return res.status(201).json({
      message: "Verify account for forgot password successfully!",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};

export const resetPassword = async (req, res, next) => {
  try {
    await AuthServices.resetPassword(req.body);
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

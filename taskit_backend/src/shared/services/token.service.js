import logger from "../utils/logger.js";
import { AuthorizationError, BaseError, ServerError } from "../utils/error.js";
import { OTP_PURPOSE } from "../constants/otpPurpose.js";
import { signToken, verifyToken } from "../helpers/jwt.helper.js";
import { JWT_CONFIG } from "../../config/jwt.config.js";
import { isTokenResetUsed, saveUsedResetToken } from "./redis.service.js";
export const generateAccessToken = (user) => {
  try {
    logger.info(`Generate access token for ${user.email}`);
    return signToken({ userId: user.id }, JWT_CONFIG.ACCESS);
  } catch (e) {
    if (e instanceof BaseError) throw e;
    throw new ServerError(`JWT error: ${e.message}`);
  }
};
export const generateRefreshToken = (user) => {
  try {
    logger.info(`Generate refresh token for ${user.email}`);
    return signToken({ userId: user.id }, JWT_CONFIG.REFRESH);
  } catch (e) {
    if (e instanceof BaseError) throw e;
    throw new ServerError(`JWT error: ${e.message}`);
  }
};
export const generateForgotPasswordToken = (user) => {
  try {
    logger.info(`Generate forgot password token for ${user.email}`);
    return signToken(
      { userId: user.id, purpose: OTP_PURPOSE.FORGOT_PASSWORD },
      JWT_CONFIG.FORGOT_PASSWORD,
    );
  } catch (e) {
    if (e instanceof BaseError) throw e;
    throw new ServerError(`JWT error: ${e.message}`);
  }
};
export const verifyForgotPasswordToken = (token) => {
  try {
    logger.info(`Verify forgot password token for ${token.email}`);
    const decoded = verifyToken(token, JWT_CONFIG.FORGOT_PASSWORD);
    if (decoded.purpose !== OTP_PURPOSE.FORGOT_PASSWORD)
      throw new AuthorizationError("Invalid forgot password token");
    if (isTokenResetUsed(decoded))
      throw new AuthorizationError("Forgot password token expired");
    return decoded;
  } catch (e) {
    throw new AuthorizationError("Forgot password token expired");
  }
};
export const markForgotPasswordTokenAsUsed = async (token) => {
  try {
    logger.info(`Mark forgot password token as used for ${token.email}`);
    await saveUsedResetToken(token.token, token.userId);
  } catch (e) {
    if (e instanceof BaseError) throw e;
    throw new ServerError(`Redis error: ${e.message}`);
  }
};
export const verifyAccessToken = (token) => {
  try {
    logger.info(`Verify access token for ${token.email}`);
    return verifyToken(token, JWT_CONFIG.ACCESS);
  } catch (e) {
    throw new AuthorizationError("Access token expired");
  }
};
export const verifyRefreshToken = (token) => {
  try {
    logger.info(`Verify refresh token for ${token.email}`);
    return verifyToken(token, JWT_CONFIG.REFRESH);
  } catch (e) {
    throw new AuthorizationError("Invalid refresh token");
  }
};

import logger from "../utils/logger.js";
import { AuthenticationError, BaseError, ServerError } from "../utils/error.js";
import { OTP_PURPOSE } from "../constants/otpPurpose.js";
import { signToken, verifyToken } from "../helpers/jwt.helper.js";
import { JWT_CONFIG } from "../../config/jwt.config.js";
import { isTokenResetUsed, saveUsedResetToken } from "./redis.service.js";
import { v4 as uuid } from "uuid";
export const generateAccessToken = (userId) => {
  try {
    return signToken({ userId }, JWT_CONFIG.ACCESS);
  } catch (e) {
    if (e instanceof BaseError) throw e;
    throw new ServerError(`JWT error: ${e.message}`);
  }
};
export const generateRefreshToken = (userId) => {
  try {
    return signToken({ userId }, JWT_CONFIG.REFRESH);
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
export const generateSessionId = () => uuid();
export const verifyForgotPasswordToken = async (token) => {
  try {
    logger.info(`Verify forgot password token for ${token.email}`);
    const decoded = verifyToken(token, JWT_CONFIG.FORGOT_PASSWORD);
    if (decoded.purpose !== OTP_PURPOSE.FORGOT_PASSWORD)
      throw new AuthorizationError("Invalid forgot password token");
    if (await isTokenResetUsed(token))
      throw new AuthorizationError("Forgot password token expired");
    return decoded;
  } catch (e) {
    throw new AuthorizationError("Forgot password token expired");
  }
};
export const markForgotPasswordTokenAsUsed = async (token, userId) => {
  try {
    logger.info(`Mark forgot password token as used for ${userId}`);
    await saveUsedResetToken(token, userId);
  } catch (e) {
    if (e instanceof BaseError) throw e;
    throw new ServerError(`Redis error: ${e.message}`);
  }
};
export const verifyAccessToken = (token) => {
  try {
    logger.info(`Verify access token for ${token}`);
    console.log(verifyToken(token, JWT_CONFIG.ACCESS));
    return verifyToken(token, JWT_CONFIG.ACCESS);
  } catch (e) {
    throw new AuthenticationError("Access token expired");
  }
};
export const verifyRefreshToken = (token) => {
  try {
    logger.info(`Verify refresh token for ${token}`);
    return verifyToken(token, JWT_CONFIG.REFRESH);
  } catch (e) {
    throw new AuthenticationError("Invalid refresh token");
  }
};

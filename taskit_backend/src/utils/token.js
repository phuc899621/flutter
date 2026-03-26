import jwt from "jsonwebtoken";
import logger from "./logger.js";
import "dotenv/config";
import { AuthorizationError, BaseError, ServerError } from "./error.js";
export const generateAccessToken = (user) => {
  try {
    logger.info(`Generate access token for ${user.email}`);
    logger.info(`Access token exp: ${process.env.JWT_ACCESS_SECRET}`);
    return jwt.sign(
      { userId: user.id, email: user.email },
      process.env.JWT_ACCESS_SECRET,
      { expiresIn: process.env.ACCESS_TOKEN_EXP },
    );
  } catch (e) {
    if (e instanceof BaseError) throw e;
    throw new ServerError(`JWT error: ${e.message}`);
  }
};
export const generateRefreshToken = (user) => {
  try {
    logger.info(`Generate refresh token for ${user.email}`);
    return jwt.sign({ userId: user.id }, process.env.JWT_REFRESH_SECRET, {
      expiresIn: process.env.REFRESH_TOKEN_EXP,
    });
  } catch (e) {
    if (e instanceof BaseError) throw e;
    throw new ServerError(`JWT error: ${e.message}`);
  }
};
export const verifyAccessToken = (token) => {
  try {
    logger.info(`Verify access token for ${token.email}`);
    return jwt.verify(token, process.env.JWT_ACCCESS_SECRET);
  } catch (e) {
    throw new AuthorizationError("Access token expired");
  }
};
export const verifyRefreshToken = (token) => {
  try {
    logger.info(`Verify refresh token for ${token.email}`);
    return jwt.verify(token, process.env.JWT_REFRESH_SECRET);
  } catch (e) {
    throw new AuthorizationError("Invalid refresh token");
  }
};

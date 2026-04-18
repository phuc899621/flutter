import logger from "../utils/logger.js";
import redisClient from "../utils/redis.client.js";
import "dotenv/config";
const expiresInSeconds = process.env.REFRESH_TTL_SECONDS || 60 * 60 * 24 * 7;
const expiresForForgotPassword = 60 * 15;
export const saveRefreshToken = async (token, userId) => {
  await redisClient.set(`refresh_${token}`, userId, {
    EX: parseInt(expiresInSeconds),
  });
  logger.info(`Refresh token saved for ${userId}:${expiresInSeconds}:${token}`);
};

export const saveUsedResetToken = async (token, userId) => {
  await redisClient.set(`reset_used_${token}`, userId, {
    EX: parseInt(expiresForForgotPassword),
  });
  logger.info(`Reset token saved for ${userId}:${expiresInSeconds}:${token}`);
};

export const addTokenToBlacklist = async (token) => {
  await redisClient.set(`blacklist_${token}`, "revoked", {
    EX: expiresInSeconds,
  });
};

export const isTokenBlacklisted = async (token) => {
  const result = await redisClient.get(`blacklist_${token}`);
  return result === "revoked";
};

export const isTokenResetUsed = async (token) => {
  const userId = await redisClient.get(`reset_used_${token}`);
  return userId != null;
};

export const isRefreshTokenValid = async (token) => {
  const userId = await redisClient.get(`refresh_${token}`);
  return userId ?? null;
};
export const revokeRefreshToken = async (token) => {
  await redisClient.del(`refresh_${token}`);
};

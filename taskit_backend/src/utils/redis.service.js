import logger from "./logger.js";
import redisClient from "./redis.js";
import "dotenv/config";
const expiresInSeconds = process.env.REFRESH_TTL_SECONDS || 60 * 60 * 24 * 7;
export const saveRefreshToken = async (token, userId) => {
  await redisClient.set(`refresh_${token}`, userId, {
    EX: parseInt(expiresInSeconds),
  });
  logger.info(`Refresh token saved for ${userId}:${expiresInSeconds}:${token}`);
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

export const isRefreshTokenValid = async (token) => {
  const userId = await redisClient.get(`refresh_${token}`);
  return userId || null;
};
export const revokeRefreshToken = async (token) => {
  await redisClient.del(`refresh_${token}`);
};

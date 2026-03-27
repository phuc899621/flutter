import "dotenv/config";
export const REDIS_CONFIG = {
  host: process.env.REDIS_HOST || "localhost",
  port: process.env.REDIS_PORT || 6379,
  messages: {
    connected: "Redis client connected",
    failed: "Redis connection failed",
  },
};

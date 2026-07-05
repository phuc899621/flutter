import IORedis from "ioredis";
import { REDIS_CONFIG } from "./redis.config.js";

export const redisConnection = new IORedis({
  host: REDIS_CONFIG.host,
  port: REDIS_CONFIG.port,
  maxRetriesPerRequest: null,
});

redisConnection.on("connect", () => {
  console.log(REDIS_CONFIG.messages.connected);
});

redisConnection.on("error", (err) => {
  console.error(REDIS_CONFIG.messages.failed, err);
});

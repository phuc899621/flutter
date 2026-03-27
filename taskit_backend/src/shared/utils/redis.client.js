import { createClient } from "redis";
import logger from "./logger.js";
import { REDIS_CONFIG } from "../../config/redis.config.js";
const redisClient = createClient({
  url: `redis://${REDIS_CONFIG.host}:${REDIS_CONFIG.port}`,
});

redisClient.on("error", (err) =>
  logger.error(REDIS_CONFIG.messages.failed, err),
);

await redisClient.connect();

logger.info(REDIS_CONFIG.messages.connected);
export default redisClient;

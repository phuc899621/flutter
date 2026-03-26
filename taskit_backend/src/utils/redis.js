import { createClient } from "redis";
import logger from "./logger.js";

const REDIS_PORT = process.env.REDIS_PORT || 6379;
const redisClient = createClient({
  url: `redis://localhost:${REDIS_PORT}`,
});

redisClient.on("error", (err) => logger.error(err));

await redisClient.connect();

logger.info("Redis client connected");
const user = 1234;
await redisClient.set(`refresh_${user}`, user, { EX: 60 });
export default redisClient;

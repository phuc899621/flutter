import { Queue } from "bullmq";
import { redisConnection } from "./redis.connection.js";

export const reminderQueue = new Queue("reminder", {
  connection: redisConnection,
});

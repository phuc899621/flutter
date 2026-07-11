import { Worker } from "bullmq";
import { redisConnection } from "../../config/redis.connection.js";
import "../../config/firebase.js";
import { getMessaging } from "firebase-admin/messaging";
import TaskServices from "../task/task.services.js";
import UserDeviceService from "../user-device/user-device.service.js";
export const schedulerWorker = new Worker(
  "reminder",
  async (job) => {
    console.log(`Processing job: ${job.name}`);
    const { taskId } = job.data;
    const task = await TaskServices.getTaskWithoutSubtasks(taskId);
    if (!task) return;
    const { title, dueDate } = task;
    const fcmTokens = await UserDeviceService.getFcmTokensByUserId({
      userId: task.userId,
    });
    let notificationBody =
      dueDate != null
        ? `You have a task due on ${dueDate}`
        : `Don't forget to complete your task!`;
    console.log("validTokens: ", fcmTokens);
    if (fcmTokens.length === 0) {
      console.log("No valid FCM tokens");
      return;
    }
    await getMessaging()
      .sendEachForMulticast({
        tokens: fcmTokens,
        notification: {
          title,
          body: notificationBody,
        },
        android: {
          priority: "high",
        },
      })
      .then((response) => {
        console.log("Successfully sent message:", response);
      })
      .catch((error) => {
        console.log("Error sending message:", error);
      });
  },
  {
    connection: redisConnection,
    concurrency: 10,
  },
);

schedulerWorker.on("ready", () => {
  console.log("Scheduler Worker is ready");
});

schedulerWorker.on("completed", (job) => {
  console.log(`Job ${job.id} completed`);
});

schedulerWorker.on("failed", (job, err) => {
  console.error(`Job ${job?.id} failed:`, err);
});

schedulerWorker.on("error", (err) => {
  console.error("Scheduler Worker Error:", err);
});

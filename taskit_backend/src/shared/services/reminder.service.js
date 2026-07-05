import { reminderQueue } from "../../config/bullmq.js";

export const scheduleReminder = async ({ taskId, delay }) => {
  return await reminderQueue.add(
    "reminder",
    {
      taskId,
    },
    {
      jobId: taskId,
      delay,
      removeOnComplete: true,
      removeOnFail: true,
    },
  );
};

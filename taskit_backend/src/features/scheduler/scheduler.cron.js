import cron from "node-cron";
import { SchedulerService } from "./scheduler.service.js";

export function startSchedulerCron() {
  cron.schedule("* * * * *", async () => {
    try {
      console.log("Scheduler running...");

      await SchedulerService.scheduleUpcomingTasks();
    } catch (e) {
      console.error(e);
    }
  });
}

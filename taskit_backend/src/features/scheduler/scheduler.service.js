import { reminderQueue } from "../../config/bullmq.js";
import { scheduleReminder } from "../../shared/services/reminder.service.js";
import { BaseError } from "../../shared/utils/error.js";
import TaskServices from "../task/task.services.js";

export class SchedulerService {
  static async scheduleUpcomingTasks() {
    console.log("Schedule upcoming tasks");
    try {
      const task = await TaskServices.findUpcommingTasks();
      console.log("[SchedulerService] task: ", task);
      for (const t of task) {
        const job = await reminderQueue.getJob(t._id.toString());
        console.log(t._id);
        console.log("[SchedulerService] job: ", job);
        if (job) {
          continue;
        }
        const delay = t.notifyAt.getTime() - Date.now();
        if (delay <= 0) {
          continue;
        }
        await scheduleReminder({
          taskId: t._id.toString(),
          title: t.title,
          body: t.dueDate ?? "ds",
          fcmToken:
            "ft2DXFq6SQmhR9nQ5nBsKg:APA91bGxBG9OAs_LOm9kdTDXKYPEfmn8rc3QcoX_neyDlg1KfHRyxVdlK_QP0eKS1KFwZBNfmzHRYD--Dn5b94iCSos9UBypdX7lSSRQ6oPBf--wgMkxieo",
          delay,
        });

        console.log("[SchedulerService] Add task ", t.title, delay);
      }
    } catch (e) {
      if (e instanceof BaseError) console.log(e);
      else
        console.error("[SchedulerService] Schedule upcoming tasks error: ", e);
    }
  }

  async scheduleTask() {}

  async cancelTask() {}

  async handleTaskUpdated() {}
}

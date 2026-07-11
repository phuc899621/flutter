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

  static canScheduleTask(task) {
    let notifyTime = SchedulerService.getNotifyTime(task);
    if (!notifyTime) {
      return false;
    }
    const diff = notifyTime.getTime() - Date.now();
    return diff >= 15 * 60 * 1000;
  }
  static getNotifyTime(task) {
    switch (task.reminderType) {
      case "beforeDeadline":
        if (!task.dueDate || task.reminderOffset == null) {
          return null;
        }

        return new Date(
          task.dueDate.getTime() - task.reminderOffset * 60 * 1000,
        );

      case "custom":
        return task.reminderAt ?? null;

      default:
        return null;
    }
  }
  static async scheduleTask(task) {
    try {
      if (!SchedulerService.canScheduleTask(task)) {
        console.log("[SchedulerService] Task can't be scheduled");
        return;
      }
      const job = await reminderQueue.getJob(task._id.toString());
      if (job) {
        console.log("[SchedulerService] Task already scheduled");
        return;
      }
      const notifyTime = SchedulerService.getNotifyTime(task);
      if (!notifyTime) {
        console.log("[SchedulerService] Notify Time null, can't be scheduled");
        return;
      }
      const delay = notifyTime.getTime() - Date.now();
      await scheduleReminder({
        taskId: task._id.toString(),
        title: task.title,
        body: task.dueDate
          ? `You have a task due on ${task.dueDate.toLocaleString()}`
          : "You have a task reminder.",
        fcmToken:
          "ft2DXFq6SQmhR9nQ5nBsKg:APA91bGxBG9OAs_LOm9kdTDXKYPEfmn8rc3QcoX_neyDlg1KfHRyxVdlK_QP0eKS1KFwZBNfmzHRYD--Dn5b94iCSos9UBypdX7lSSRQ6oPBf--wgMkxieo",
        delay,
      });

      console.log(
        "[SchedulerService] Schedule task Successfully ",
        t.title,
        delay,
      );
    } catch (e) {
      if (e instanceof BaseError)
        console.error("[SchedulerService] Schedule task error: ", e);
      else console.error("[SchedulerService] Schedule task error: ", e);
    }
  }

  static async cancelTask(task) {
    try {
      const job = await reminderQueue.getJob(task._id.toString());
      if (job) {
        await job.remove();
      }
    } catch (e) {
      if (e instanceof BaseError)
        console.error("[SchedulerService] Cancel task error: ", e);
      else console.error("[SchedulerService] Cancel task error: ", e);
    }
  }

  static async handleTaskUpdated(task) {
    try {
      await SchedulerService.cancelTask(task);
      await SchedulerService.scheduleTask(task);
      console.log("[SchedulerService] Handle task updated successfully");
    } catch (e) {
      if (e instanceof BaseError)
        console.error("[SchedulerService] Handle task updated error: ", e);
      else console.error("[SchedulerService] Handle task updated error: ", e);
    }
  }
}

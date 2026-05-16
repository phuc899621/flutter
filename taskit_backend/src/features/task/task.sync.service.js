import { getIO } from "../../config/socket.js";
import logger from "../../shared/utils/logger.js";

export default class TaskSyncService {
  static _emit(userId, sessionId, action, data) {
    try {
      const io = getIO();
      logger.info(
        `Emitting task change: userId=${userId}, sessionId=${sessionId}, action=${action}`,
      );
      io.to(userId.toString())
        .except(sessionId.toString())
        .emit("task_changed", {
          action,
          data,
          serverTime: new Date().toISOString(),
        });
    } catch (error) {
      console.error("Eror socket send:", error);
    }
  }

  static notifyCreate(userId, sessionId, task) {
    this._emit(userId, sessionId, "CREATE", task);
  }

  static notifyUpdate(userId, sessionId, task) {
    this._emit(userId, sessionId, "UPDATE", task);
  }

  static notifyDelete(userId, sessionId, taskId) {
    this._emit(userId, sessionId, "DELETE", { id: taskId });
  }
  static notifyBulkSync(userId, sessionId, tasks) {
    this._emit(userId, sessionId, "BULK_SYNC", tasks);
  }
  static notifyBulkDelete(userId, sessionId, tasks) {
    this._emit(userId, sessionId, "BULK_DELETE", tasks);
  }
}

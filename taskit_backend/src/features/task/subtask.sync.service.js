import { getIO } from "../../config/socket.js";
import logger from "../../shared/utils/logger.js";

export default class SubtaskSyncService {
  static _emit(userId, sessionId, action, data) {
    try {
      const io = getIO();
      logger.info(
        `Emitting subtask change: userId=${userId}, sessionId=${sessionId}, action=${action}`,
      );
      io.to(userId.toString())
        .except(sessionId.toString())
        .emit("subtask_changed", {
          action,
          data,
          serverTime: new Date().toISOString(),
        });
    } catch (error) {
      console.error("Eror socket send:", error);
    }
  }

  static notifyCreate(userId, sessionId, subtask) {
    this._emit(userId, sessionId, "CREATE", subtask);
  }

  static notifyUpdate(userId, sessionId, subtask) {
    this._emit(userId, sessionId, "UPDATE", subtask);
  }

  static notifyDelete(userId, sessionId, subtaskId) {
    this._emit(userId, sessionId, "DELETE", { id: subtaskId });
  }
  static notifyBulkSync(userId, sessionId, subtasks) {
    this._emit(userId, sessionId, "BULK_SYNC", subtasks);
  }
  static notifyBulkDelete(userId, sessionId, subtasks) {
    this._emit(userId, sessionId, "BULK_DELETE", subtasks);
  }
}

import { getIO } from "../../config/socket.js";

export default class CategorySyncService {
  static _emit(userId, sessionId, action, data) {
    try {
      const io = getIO();
      io.to(userId.toString())
        .except(sessionId.toString())
        .emit("category_changed", {
          action,
          data,
          serverTime: new Date().toISOString(),
        });
    } catch (error) {
      console.error("Eror socket send:", error);
    }
  }

  static notifyCreate(userId, sessionId, category) {
    this._emit(userId, sessionId, "CREATE", category);
  }

  static notifyUpdate(userId, sessionId, category) {
    this._emit(userId, sessionId, "UPDATE", category);
  }

  static notifyDelete(userId, sessionId, categoryId) {
    this._emit(userId, sessionId, "DELETE", { id: categoryId });
  }
  static notifyBulkSync(userId, sessionId, categories) {
    this._emit(userId, sessionId, "BULK_SYNC", categories);
  }
  static notifyBulkDelete(userId, sessionId, categories) {
    this._emit(userId, sessionId, "BULK_DELETE", categories);
  }
}

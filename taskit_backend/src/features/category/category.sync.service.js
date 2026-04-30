import { getIO } from "../../config/socket.js";

export default class CategorySyncService {
  static _emit(userId, action, data) {
    try {
      const io = getIO();
      io.to(userId.toString()).emit("category_changed", {
        action,
        data,
        serverTime: new Date().toISOString(),
      });
    } catch (error) {
      console.error("Eror socket send:", error);
    }
  }

  static notifyCreate(userId, category) {
    this._emit(userId, "CREATE", category);
  }

  static notifyUpdate(userId, category) {
    this._emit(userId, "UPDATE", category);
  }

  static notifyDelete(userId, categoryId) {
    this._emit(userId, "DELETE", { id: categoryId });
  }
  static notifyBulkSync(userId, categories) {
    this._emit(userId, "BULK_SYNC", categories);
  }
  static notifyBulkDelete(userId, categories) {
    this._emit(userId, "BULK_DELETE", categories);
  }
}

import SubtaskModel from "./subtask.model.js";
import TaskModel from "./task.model.js";
import UserService from "../user/user.service.js";
import {
  BaseError,
  NotFoundError,
  ServerError,
} from "../../shared/utils/error.js";
import SubtaskSyncService from "./subtask.sync.service.js";

class SubtaskServices {
  static async syncSubtasks(userId, sessionId, subtasks) {
    try {
      await UserService.ensureUserExistsById(userId);
      console.log(tasks);
      const accept = [];
      const reject = [];
      const operations = [];
      const ids = subtasks.filter((c) => c.id).map((c) => c.id);
      let insertIndex = 0;
      const existingSubtasks = await SubtaskModel.find({
        _id: { $in: ids },
        userId,
      });

      const existingMap = new Map(
        existingSubtasks.map((c) => [c._id.toString(), c]),
      );
      for (const subtask of subtasks) {
        const { id, localId, updatedAt, ...rest } = subtask;
        const clientUpdatedAt = updatedAt ? new Date(updatedAt) : null;

        if (!id) {
          const currentInsertIndex = insertIndex++;
          operations.push({
            insertOne: {
              document: {
                userId,
                ...rest,
                updatedAt: clientUpdatedAt ?? new Date(),
              },
            },
          });

          accept.push({
            type: "insert",
            localId,
            insertIndex: currentInsertIndex,
          });

          continue;
        }
        const existing = existingMap.get(id);
        if (!existing) {
          reject.push({
            localId,
            id: null,
          });
          continue;
        }

        const serverUpdatedAt = existing.updatedAt
          ? new Date(existing.updatedAt)
          : null;

        const shouldUpdate =
          !serverUpdatedAt ||
          (clientUpdatedAt && serverUpdatedAt <= clientUpdatedAt);

        if (shouldUpdate) {
          operations.push({
            updateOne: {
              filter: {
                _id: id,
                userId,
              },
              update: {
                $set: {
                  ...rest,
                  updatedAt: clientUpdatedAt ?? new Date(),
                },
              },
            },
          });

          accept.push({
            type: "update",
            localId,
            id,
          });
        } else {
          reject.push({
            localId,
            id: existing._id,
          });
        }
      }
      const result = operations.length
        ? await SubtaskModel.bulkWrite(operations)
        : null;

      for (const item of accept) {
        if (item.type === "insert") {
          const insertedId = result?.insertedIds?.[item.insertIndex];
          item.id = insertedId ? insertedId.toString() : null;
          delete item.insertIndex;
        }

        delete item.type;
      }
      const affectedIds = accept.map((i) => i.id).filter(Boolean);
      console.log("affectedIds", affectedIds);
      const freshSubtasks = affectedIds.length
        ? await SubtaskModel.find({
            _id: { $in: affectedIds },
            userId,
          })
        : [];
      console.log("freshSubtasks", freshSubtasks);
      const freshMap = new Map(freshTasks.map((c) => [c._id.toString(), c]));
      console.log("freshMap", freshMap);
      const finalAccept = accept.map((item) => {
        const doc = freshMap.get(item.id?.toString());

        return {
          localId: item.localId,
          ...(doc ? doc.toObject() : {}),
        };
      });

      const rejectedIds = reject
        .filter((item) => item.id)
        .map((item) => item.id);

      const rejectedTasks = rejectedIds.length
        ? await SubtaskModel.find({
            _id: { $in: rejectedIds },
            userId,
          })
        : [];

      const rejectedMap = new Map(
        rejectedTasks.map((c) => [c._id.toString(), c]),
      );

      const finalReject = reject.map((item) => {
        const doc = item.id ? rejectedMap.get(item.id.toString()) : null;
        const obj = doc ? doc.toObject() : { id: null };
        const { id, ...rest } = obj;
        if (obj.id) {
          return {
            localId: item.localId,
            id: obj.id,
            serverData: {
              ...rest,
            },
          };
        }
        return {
          localId: item.localId,
          id: null,
          serverData: null,
        };
      });

      if (finalAccept.length != 0) {
        SubtaskSyncService.notifyBulkSync(userId, sessionId, {
          tasks: finalAccept,
        });
      }

      return {
        accept: finalAccept,
        reject: finalReject,
      };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Sync tasks error: ${e.message}`);
    }
  }
  static async syncDeletedSubtasks(userId, sessionId, subtasks) {
    try {
      await UserService.ensureUserExistsById(userId);
      const operations = subtasks.map((subtask) => {
        const { id, localId } = subtask;
        return {
          updateOne: {
            filter: { _id: id, userId },
            update: {
              $set: {
                deleted: true,
                updatedAt: new Date(),
              },
            },
          },
        };
      });
      const result = await SubtaskModel.bulkWrite(operations);
      console.log(result);
      const synced = subtasks.map((subtask, index) => ({
        localId: subtask.localId,
        id: subtask.id,
      }));
      SubtaskSyncService.notifyBulkDelete(
        userId,
        sessionId,
        synced.map((c) => c.id),
      );
      return synced;
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Sync deleted subtasks error: ${e.message}`);
    }
  }
  //#region CREATE
  static async createSubtask(userId, sessionId, taskId, data) {
    try {
      const task = await TaskModel.findById(taskId);
      if (!task) throw new NotFoundError("Task not found");
      const subtask = await SubtaskModel.create({ ...data, taskId });
      SubtaskSyncService.notifyCreate(userId, sessionId, subtask.toObject());
      return subtask.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Create subtask error: ${e.message}`);
    }
  }
  //#endregion

  //#region UPDATE

  static async updateSubtask(userId, sessionId, taskId, subtaskId, data) {
    try {
      const task = await TaskModel.findById(taskId);
      if (!task) throw new NotFoundError("Task not found");
      const subtask = await SubtaskModel.findOneAndUpdate(
        { _id: subtaskId, taskId },
        { $set: data },
        { new: true },
      );
      if (!subtask) throw new NotFoundError("Subtask not found");
      SubtaskSyncService.notifyUpdate(userId, sessionId, subtask.toObject());
      return {
        localId: subtask.localId,
        ...subtask.toObject(),
      };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Update subtask error: ${e.message}`);
    }
  }
  static async deleteSubtask(userId, sessionId, taskId, subtsakId) {
    try {
      const task = await TaskModel.findById(taskId);
      if (!task) throw new NotFoundError("Task not found");
      const subtask = await SubtaskModel.updateOne(
        { _id: subtaskId, taskId },
        {
          $set: {
            deleted: true,
            updatedAt: new Date(),
          },
        },
        { new: true },
      );
      if (!subtask) throw new NotFoundError("Subtask not found");
      SubtaskSyncService.notifyDelete(
        userId,
        sessionId,
        subtask._id.toString(),
      );

      return {
        id: subtask._id.toString(),
      };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Delete subtask error: ${e.message}`);
    }
  }
  //#endregion
}

export default SubtaskServices;

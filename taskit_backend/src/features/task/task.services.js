import TaskModel from "./task.model.js";
import CategoryServices from "../category/category.services.js";
import CategoryModel from "../category/category.model.js";
import SubtaskModel from "../task/subtask.model.js";
import db from "../../shared/utils/db.js";
import UserModel from "../user/user.model.js";

import {
  BadRequestError,
  BaseError,
  NotFoundError,
  ServerError,
} from "../../shared/utils/error.js";
import TaskSyncService from "./task.sync.service.js";
import UserService from "../user/user.service.js";

class TaskServices {
  //#region CREATE

  static async createTask(data) {
    const session = await db.startSession();
    session.startTransaction();
    try {
      const category = (
        await CategoryModel.findOne({
          _id: data.categoryId,
          deleted: false,
        }).session(session)
      )?.toObject();
      if (!category) {
        throw new NotFoundError("Category not found");
      }
      const [taskCreated] = await TaskModel.create([data], { session });
      console.log("Task created:", taskCreated);
      const subtasksCreated = await SubtaskModel.insertMany(
        data.subtasks.map((subtask) => ({
          ...subtask,
          taskId: taskCreated.id,
        })),
        { session },
      );
      console.log("Subtasks created:", subtasksCreated);
      if (subtasksCreated.length != data.subtasks.length) {
        await session.abortTransaction();
        throw new ServerError("Subtasks were not created");
      }
      await session.commitTransaction();
      const result = {
        ...taskCreated.toObject(),
        ...(data.localId && { localId: data.localId }),
        subtasks: subtasksCreated.map((subtask, index) => ({
          ...(data.subtasks[index]?.localId && {
            localId: data.subtasks[index].localId,
          }),
          ...subtask.toObject(),
        })),
      };
      TaskSyncService.notifyCreate(data.userId, data.sessionId, result);
      return result;
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(e.message);
    } finally {
      await session.endSession();
    }
  }
  //#endregion

  //#region READ
  static async getTasks(userId, query = {}) {
    try {
      const {
        page = 1,
        limit = 10,
        sortBy = "createdAt",
        sortOrder = "desc",
        title,
        status,
        categoryId,
        dueDate,
        priority,
      } = query;
      if (userId) {
        const user = await UserModel.findById(userId);
        if (!user) {
          throw new ServerError("User not found");
        }
      }
      const filter = { userId, deleted: false };
      if (title) {
        filter.title = { $regex: title, $options: "i" };
      }
      if (status) {
        filter.status = status;
      }
      if (categoryId) {
        filter.categoryId = categoryId;
      }
      if (dueDate) {
        const date = new Date(dueDate);
        const startOfDay = new Date(date.setHours(0, 0, 0, 0));
        const endOfDay = new Date(date.setHours(23, 59, 59, 999));
        filter.dueDate = {
          $gte: startOfDay,
          $lte: endOfDay,
        };
      }
      if (priority) {
        filter.priority = priority;
      }
      const skip = (page - 1) * limit;

      const tasks = await TaskModel.find(filter)
        .sort({ [sortBy]: sortOrder })
        .skip(skip)
        .limit(parseInt(limit));
      const subtask = await SubtaskModel.find({
        taskId: { $in: tasks.map((task) => task._id) },
        deleted: false,
      });
      const tasksWithSubtasks = tasks.map((task) => ({
        ...task.toObject(),
        subtasks: subtask
          .filter(
            (subtask) => subtask.taskId.toString() === task._id.toString(),
          )
          .map((subtask) => subtask.toObject()),
      }));
      const total = await TaskModel.countDocuments(filter);
      const pages = Math.ceil((await TaskModel.countDocuments(filter)) / limit);
      return {
        data: tasksWithSubtasks,
        meta: {
          page,
          limit,
          total,
          pages,
          sortBy,
          sortOrder,
        },
      };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(e.message, 500);
    }
  }
  static async getSyncTasks(userId, lastSyncTime) {
    try {
      const user = await UserModel.findById(userId);
      if (!user) {
        throw new ServerError("User not found", 404);
      }

      const filter = { userId };
      if (lastSyncTime) {
        const lastSyncDate = new Date(lastSyncTime);
        filter.updatedAt = { $gt: lastSyncDate };
      }

      const tasks = await TaskModel.find(filter).sort({ updatedAt: 1 });
      const subtasks = await SubtaskModel.find({
        taskId: { $in: tasks.map((t) => t._id) },
      });

      const tasksWithSubtasks = tasks.map((task) => ({
        ...task.toObject(),
        subtasks: subtasks
          .filter(
            (subtask) => subtask.taskId.toString() === task._id.toString(),
          )
          .map((subtask) => subtask.toObject()),
      }));

      return {
        data: tasksWithSubtasks,
        meta: {
          total: tasksWithSubtasks.length,
          lastSyncTime: lastSyncTime || null,
        },
      };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Get sync tasks error: ${e.message}`);
    }
  }

  static async getTask(taskId) {
    try {
      const task = await TaskModel.findOne({
        _id: taskId,
        deleted: false,
      });
      if (!task) {
        throw new ServerError("Task not found");
      }
      const subtasks = await SubtaskModel.find({
        taskId: taskId,
        deleted: false,
      });
      task.subtasks = subtasks.map((subtask) => subtask.toObject());
      return task.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Get task error: ${e.message}`);
    }
  }

  static async syncTasks(userId, sessionId, tasks) {
    try {
      await UserService.ensureUserExistsById(userId);
      console.log(tasks);
      const accept = [];
      const reject = [];
      const operations = [];
      const ids = tasks.filter((c) => c.id).map((c) => c.id);
      let insertIndex = 0;
      const existingTasks = await TaskModel.find({
        _id: { $in: ids },
        userId,
      });

      const existingMap = new Map(
        existingTasks.map((c) => [c._id.toString(), c]),
      );
      for (const task of tasks) {
        const { id, localId, updatedAt, ...rest } = task;
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
        ? await TaskModel.bulkWrite(operations)
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
      const freshTasks = affectedIds.length
        ? await TaskModel.find({
            _id: { $in: affectedIds },
            userId,
          })
        : [];
      console.log("freshTasks", freshTasks);
      const freshMap = new Map(freshTasks.map((c) => [c._id.toString(), c]));
      console.log("freshMap", freshMap);
      const finalAccept = accept.map((item) => {
        const doc = freshMap.get(item.id?.toString());

        return {
          localId: item.localId,
          subtasks: [],
          ...(doc ? doc.toObject() : {}),
        };
      });

      const rejectedIds = reject
        .filter((item) => item.id)
        .map((item) => item.id);

      const rejectedTasks = rejectedIds.length
        ? await TaskModel.find({
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
        TaskSyncService.notifyBulkSync(userId, sessionId, {
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
  static async pullTasks(userId, lastSyncTime = null) {
    try {
      await UserService.ensureUserExistsById(userId);
      const query = lastSyncTime
        ? { userId, updatedAt: { $gt: lastSyncTime } }
        : { userId };
      console.log(userId);
      const tasks = await TaskModel.find(query);
      console.log(`tasks: ${tasks}`);
      if (!tasks?.length) {
        return [];
      }
      const taskIds = tasks.map((task) => task._id);
      console.log(taskIds);
      const subtasks = await SubtaskModel.find({
        taskId: { $in: taskIds },
      });
      console.log(subtasks);
      const subtaskMap = new Map();

      for (const subtask of subtasks) {
        const taskId = subtask.taskId.toString();
        console.log(taskId);
        if (!subtaskMap.has(taskId)) {
          subtaskMap.set(taskId, []);
        }

        subtaskMap.get(taskId).push(subtask);
      }

      return tasks.map((task) => ({
        ...task.toObject(),
        subtasks:
          subtaskMap.get(task._id.toString())?.map((c) => c.toObject()) ?? [],
      }));
    } catch (e) {
      throw new ServerError(`Pull new tasks error: ${e.message}`);
    }
  }
  static async syncDeletedTasks(userId, sessionId, tasks) {
    try {
      await UserService.ensureUserExistsById(userId);
      const operations = tasks.map((task) => {
        const { id, localId } = task;
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
      const result = await TaskModel.bulkWrite(operations);
      console.log(result);
      const synced = tasks.map((task, index) => ({
        localId: task.localId,
        id: task.id,
      }));
      TaskSyncService.notifyBulkDelete(
        userId,
        sessionId,
        synced.map((c) => c.id),
      );
      return synced;
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Sync deleted tasks error: ${e.message}`);
    }
  }

  //#endregion

  //#region UPDATE
  static async updateTask(userId, sessionId, taskId, updateData) {
    const session = await db.startSession();
    try {
      session.startTransaction();
      const task = await TaskModel.findOne({
        _id: taskId,
        deleted: false,
      }).session(session);
      if (!task) {
        throw new NotFoundError("Task not found");
      }

      if (updateData.categoryId) {
        if (!CategoryModel.isValidId(updateData.categoryId)) {
          throw new BadRequestError("Invalid category id");
        }
        const category = await CategoryModel.findOne({
          _id: updateData.categoryId,
          deleted: false,
        }).session(session);
        if (!category) {
          throw new NotFoundError("Category not found");
        }
      }

      const result = (
        await TaskModel.findByIdAndUpdate(
          taskId,
          { $set: updateData },
          { new: true, session },
        )
      ).toObject();
      await session.commitTransaction();
      TaskSyncService.notifyUpdate(userId, sessionId, result);
      return {
        localId: updateData.localId,
        ...result,
      };
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Update task error: ${e.message}`);
    } finally {
      session.endSession();
    }
  }
  static async updateTasksBulk(ids, updateData) {
    const session = await db.startSession();
    session.startTransaction();
    try {
      const updated = [];
      const skipped = [];
      let matchedCount = 0;
      let modifiedCount = 0;

      for (const { id, localId } of ids) {
        const task = await TaskModel.findById(taskId).session(session);

        if (!task) {
          skipped.push({ id, localId, reason: "Task not found" });
          continue;
        }
        matchedCount++;

        if (updateData.categoryId) {
          const category = await CategoryModel.findById(
            updateData.categoryId,
          ).session(session);
          if (!category) {
            skipped.push({ id, localId, reason: "Category not found" });
            continue;
          }
        }

        const updatedTask = await TaskModel.findByIdAndUpdate(
          id,
          { $set: updateData },
          { new: true, session },
        );

        if (updatedTask) {
          modifiedCount++;
          updated.push({
            id,
            localId,
          });
        } else {
          updated.push({
            id,
            localId,
          });
        }
      }

      await session.commitTransaction();

      return {
        matchedCount,
        modifiedCount,
        updated,
        skipped,
      };
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Bulk tasks updated error: ${e.message}`, 500);
    } finally {
      session.endSession();
    }
  }
  static async updateMultipleTasks(updateData) {
    const session = await db.startSession();
    session.startTransaction();
    try {
      const bulkOps = [];
      const skippedTasks = [];
      const updatedTasks = [];

      for (const t of updateData) {
        if (!t.taskId || !t.data) {
          skippedTasks.push({
            id: t.id || null,
            localId: t.localId || null,
          });
          continue;
        }

        const task = await TaskModel.findById(t.id).session(session);
        if (!task) {
          skippedTasks.push({
            taskId: t.id,
            taskLocalId: t.localId,
            reason: "Task not found",
          });
          continue;
        }

        if (t.data.categoryId) {
          const category = await CategoryModel.findById(
            t.data.categoryId,
          ).session(session);
          if (!category) {
            skippedTasks.push({
              id: t.id,
              localId: t.localId,
              reason: "Category not found",
            });
            continue;
          }
        }

        bulkOps.push({
          updateOne: {
            filter: { _id: t.id },
            update: { $set: t.data },
          },
        });

        updatedTasks.push({
          id: t.id,
          localId: t.localId,
        });
      }

      let result = { matchedCount: 0, modifiedCount: 0 };
      if (bulkOps.length > 0) {
        result = await TaskModel.bulkWrite(bulkOps, { session });
      }

      await session.commitTransaction();

      return {
        matchedCount: result.matchedCount,
        modifiedCount: result.modifiedCount,
        updated: updatedTasks,
        skipped: skippedTasks,
      };
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Bulk tasks updated error: ${e.message}`, 500);
    } finally {
      session.endSession();
    }
  }
  //#endregion

  //#region DELETE
  static async deleteTask(userId, sessionId, taskId) {
    const session = await db.startSession();
    try {
      session.startTransaction();
      const task = (
        await TaskModel.findById(taskId).session(session)
      ).toObject();
      if (!task) throw new NotFoundError("Task not found");
      const subtaskIds = await SubtaskModel.find(
        { taskId },
        { _id: 1, deleted: false },
      ).session(session);
      await TaskModel.updateOne(
        { _id: taskId },
        {
          $set: {
            deleted: true,
            updatedAt: new Date(),
          },
        },
        { session },
      );

      await SubtaskModel.updateMany(
        { taskId },
        {
          $set: {
            deleted: true,
            updatedAt: new Date(),
          },
        },
        { session },
      );
      await session.commitTransaction();
      TaskSyncService.notifyDelete(userId, sessionId, taskId);
      return {
        taskId,
        subtaskIds,
      };
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Delete task error: ${e.message}`);
    } finally {
      await session.endSession();
    }
  }
  static async deleteBulkTasks(userId, ids) {
    const session = await db.startSession();
    try {
      session.startTransaction();
      const user = await UserModel.findById(userId).session(session);
      if (!user) throw new NotFoundError("User not found", 404);
      let deleteCount = 0;
      let deleteFailed = 0;
      if (ids.length === 0) {
        return {
          deleteCount,
          deleteFailed,
          deletedTasks: [],
        };
      }

      const tasks = await TaskModel.find({ _id: { $in: ids }, userId }).session(
        session,
      );
      const taskIds = tasks.map((task) => task._id);

      const subtasks = await SubtaskModel.find({
        taskId: { $in: taskIds },
      }).session(session);
      const subtasksByTask = {};
      for (const subtask of subtasks) {
        const taskId = subtask.taskId.toString();
        if (!subtasksByTask[taskId]) subtasksByTask[taskId] = [];
        subtasksByTask[taskId].push(subtask._id.toString());
      }

      await SubtaskModel.deleteMany({ taskId: { $in: taskIds } }, { session });
      const result = await TaskModel.deleteMany(
        { _id: { $in: taskIds }, userId },
        { session },
      );
      deleteCount = result.deletedCount;
      deleteFailed = ids.length - deleteCount;
      await session.commitTransaction();
      return {
        deleteCount,
        deleteFailed,
        deletedTasks: taskIds.map((taskId) => ({
          taskId,
          subtaskIds: subtasksByTask[taskId] || [],
        })),
      };
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Delete multiple tasks error: ${e.message}`, 500);
    } finally {
      await session.endSession();
    }
  }
  //#endregion
}

export default TaskServices;

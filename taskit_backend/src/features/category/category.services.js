import CategoryModel from "./category.model.js";
import TaskModel from "../task/task.model.js";
import db from "../../shared/utils/db.js";
import {
  BadRequestError,
  BaseError,
  ConflictError,
  NotFoundError,
  ServerError,
} from "../../shared/utils/error.js";
import UserService from "../user/user.service.js";
import CategorySyncService from "./category.sync.service.js";

class CategoryService {
  //#region CREATE
  static async createCategory(userId, data) {
    try {
      await UserService.ensureUserExistsById(userId);
      const created = await CategoryModel.create({ ...data, userId });
      console.log(data);
      return {
        localId: parseInt(data.localId, 10),
        ...created.toObject(),
      };
    } catch (e) {
      if (e.code === 11000) {
        throw new ConflictError("Category name already exists");
      }
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Create category ServerError: ${e.message}`);
    }
  }
  //#endregion

  //#region READ
  static async getCategories(userId, lastSyncTime = null) {
    try {
      await UserService.ensureUserExistsById(userId);
      const query = lastSyncTime
        ? { userId, updatedAt: { $gt: lastSyncTime }, deleted: false }
        : { userId, deleted: false };
      console.log(query, userId);
      const categories = await CategoryModel.find(query);
      return categories?.length != 0
        ? categories.map((category) => category.toObject())
        : [];
    } catch (e) {
      throw new ServerError(`Get all categories ServerError: ${e.message}`);
    }
  }
  static async pullCategories(userId, lastSyncTime = null) {
    try {
      await UserService.ensureUserExistsById(userId);
      const query = lastSyncTime
        ? { userId, updatedAt: { $gt: lastSyncTime } }
        : { userId };
      console.log(query, userId);
      const categories = await CategoryModel.find(query);
      return categories?.length != 0
        ? categories.map((category) => category.toObject())
        : [];
    } catch (e) {
      throw new ServerError(`Get all categories ServerError: ${e.message}`);
    }
  }
  static async getCategory(userId, id) {
    try {
      await UserService.ensureUserExistsById(userId);
      const category = await CategoryModel.findOne({
        _id: id,
        userId,
        deleted: false,
      });
      if (!category) {
        throw new NotFoundError("Category not found");
      }
      return category.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Get category ServerError: ${e.message}`);
    }
  }

  //#region DELETE

  static async deleteOne(userId, id) {
    const session = await db.startSession();
    session.startTransaction();
    try {
      await UserService.ensureUserExistsById(userId);
      const category = await CategoryModel.findOne({ _id: id });
      if (!category) {
        throw new NotFoundError("Category not found");
      }
      if (category.default) {
        throw new ConflictError("Cannot delete default category");
      }

      const defaultCategory = await CategoryModel.findOne({
        default: true,
        userId,
      });
      if (!defaultCategory) {
        throw new NotFoundError("Default category not found");
      }
      const tasks = await TaskModel.find({ categoryId: category._id }, null, {
        session,
      });
      if (tasks.length > 0) {
        const taskIds = tasks.map((task) => task._id);
        await TaskModel.updateMany(
          { _id: { $in: taskIds } },
          { $set: { categoryId: defaultCategory._id } },
          { session },
        );
      }
      await CategoryModel.updateOne(
        { _id: id, userId },
        { $set: { deleted: true } },
        { session },
      );
      await session.commitTransaction();
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Delete category error: ${e.message}`);
    } finally {
      session.endSession();
    }
  }
  //#endregion

  //#region UPDATE
  static async updateCategoryFull(userId, id, updateData) {
    try {
      await UserService.ensureUserExistsById(userId);
      const category = await CategoryModel.findOneAndUpdate(
        { _id: id, userId, deleted: false, default: false },
        { ...updateData, userId },
        { new: true, overwrite: true },
      );
      if (!category) {
        throw new NotFoundError(
          "Can not update category that does not exist or is default",
        );
      }
      return category.toObject();
    } catch (e) {
      if (e.code === 11000) {
        throw new BadRequestError("Category name already exists");
      }
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Update category ServerError: ${e.message}`);
    }
  }

  static async syncCategories(userId, categories) {
    try {
      await UserService.ensureUserExistsById(userId);
      const accept = [];
      const reject = [];
      const operations = [];
      const ids = categories.filter((c) => c.id).map((c) => c.id);

      const existingCategories = await CategoryModel.find({
        _id: { $in: ids },
        userId,
      });

      const existingMap = new Map(
        existingCategories.map((c) => [c._id.toString(), c]),
      );
      for (const category of categories) {
        const { id, localId, updatedAt, ...rest } = category;
        const clientUpdatedAt = updatedAt ? new Date(updatedAt) : null;

        if (!id) {
          const operationsIndex = operations.length;
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
            operationsIndex,
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
          (clientUpdatedAt && serverUpdatedAt < clientUpdatedAt);

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
        ? await CategoryModel.bulkWrite(operations)
        : null;

      for (const item of accept) {
        if (item.type === "insert") {
          item.id = result?.insertedIds?.[item.operationIndex] ?? null;
          delete item.operationIndex;
        }

        delete item.type;
      }
      const acceptedIds = accept.map((item) => item.id);
      const acceptedCategories = acceptedIds.length
        ? await CategoryModel.find({
            _id: { $in: acceptedIds },
            userId,
          })
        : [];
      const acceptedMap = new Map(
        acceptedCategories.map((c) => [c._id.toString(), c]),
      );

      const finalAccept = accept.map((item) => {
        const doc = acceptedMap.get(item.id.toString());

        return {
          localId: item.localId,
          ...(doc ? doc.toObject() : {}),
        };
      });

      const rejectedIds = reject
        .filter((item) => item.id)
        .map((item) => item.id);

      const rejectedCategories = rejectedIds.length
        ? await CategoryModel.find({
            _id: { $in: rejectedIds },
            userId,
          })
        : [];

      const rejectedMap = new Map(
        rejectedCategories.map((c) => [c._id.toString(), c]),
      );

      const finalReject = reject.map((item) => {
        const doc = item.id ? rejectedMap.get(item.id.toString()) : null;

        return {
          localId: item.localId,
          ...(doc ? doc.toObject() : { id: null }),
        };
      });

      CategorySyncService.notifyBulkSync(userId, {
        accept: finalAccept,
        reject: finalReject,
      });

      return {
        accept: finalAccept,
        reject: finalReject,
      };
    } catch (e) {
      throw new ServerError(`update bulk categories ServerError: ${e.message}`);
    }
  }
  static async syncDeletedCategories(userId, categories) {
    try {
      await UserService.ensureUserExistsById(userId);
      const operations = categories.map((category) => {
        const { id, localId } = category;
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
      const result = await CategoryModel.bulkWrite(operations);
      console.log(result);
      const synced = categories.map((category, index) => ({
        localId: category.localId,
        id: category.id,
      }));
      CategorySyncService.notifyBulkDelete(userId, synced);
      return synced;
    } catch (e) {
      throw new ServerError(`update bulk categories ServerError: ${e.message}`);
    }
  }
  static async updateCategoryPartial(userId, id, updateData) {
    try {
      const user = await UserModel.findById(userId);
      if (!user) throw new HttpServerError("User not found", 404);
      const category = await CategoryModel.findOneAndUpdate(
        { _id: id, userId },
        { $set: updateData },
        { new: true },
      );
      if (!category) {
        throw new NotFoundError("Category not found", 404);
      }
      return category.toObject();
    } catch (e) {
      if (err.code === 11000) {
        throw new BadRequestError("Category name already exists", 400);
      }
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Update category ServerError: ${e.message}`);
    }
  }
  //#endregion
  //#region UTILS
  static async createDefaultCategories(userId, session = null) {
    try {
      const defaultCategories = [
        { name: "Work", userId },
        { name: "Personal", userId },
        { name: "Shopping", userId },
        { name: "Health", userId },
        { name: "General", userId, default: true },
      ];
      const bulkOps = defaultCategories.map((cat) => ({
        updateOne: {
          filter: { userId: cat.userId, name: cat.name },
          update: { $setOnInsert: cat },
          upsert: true,
        },
      }));
      await CategoryModel.bulkWrite(bulkOps, { session });
    } catch (e) {
      throw new ServerError(
        `Create default category ServerError: ${e.message}`,
      );
    }
  }
}

export default CategoryService;

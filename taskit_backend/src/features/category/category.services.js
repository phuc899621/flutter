import CategoryModel from "./category.model.js";
import TaskModel from "../task/task.model.js";
import db from "../../shared/utils/db.js";
import {
  BadRequestError,
  BaseError,
  NotFoundError,
  ServerError,
} from "../../shared/utils/error.js";

class CategoryServices {
  //#region CREATE
  static async createCategory(userId, data) {
    try {
      const user = await UserModel.findById(userId);
      if (!user) throw new NotFoundError("User not found", 404);
      const created = await CategoryModel.create({ ...data, userId });
      return {
        localId: parseInt(data.localId, 10),
        ...created.toObject(),
      };
    } catch (e) {
      if (err.code === 11000) {
        throw new BadRequestServerError("Category name already exists", 400);
      }
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Create category ServerError: ${e.message}`);
    }
  }
  //#endregion

  //#region READ
  static async getCategories(userId) {
    try {
      const categories = await CategoryModel.find({ userId });
      return categories.map((category) => category.toObject());
    } catch (e) {
      throw new ServerError(`Get all categories ServerError: ${e.message}`);
    }
  }
  static async getCategory(id) {
    try {
      const category = await CategoryModel.findById(id);
      if (!category) {
        throw new NotFoundError("Category not found", 404);
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
    try {
      const category = await CategoryModel.findOne({ _id: id });
      if (!category) {
        throw new NotFoundError("Category not found", 404);
      }
      if (category.isDefault) {
        throw new BadRequestError("Cannot delete default category", 400);
      }

      const defaultCategory = await CategoryModel.findOne({
        isDefault: true,
        userId,
      });
      if (!defaultCategory) {
        throw new NotFoundError("Default category not found", 404);
      }

      session.startTransaction();

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
      await CategoryModel.deleteOne({ _id: id }, { session });
      await session.commitTransaction();
      return id;
    } catch (e) {
      await session.abortTransaction();
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Delete category ServerError: ${e.message}`);
    } finally {
      session.endSession();
    }
  }
  //#endregion

  //#region UPDATE
  static async updateCategoryFull(userId, id, updateData) {
    try {
      const user = await UserModel.findById(userId);
      if (!user) throw new HttpServerError("User not found", 404);
      const category = await CategoryModel.findOneAndUpdate(
        { _id: id, userId },
        { ...updateData, userId },
        { new: true, overwrite: true },
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
        { name: "Any", userId },
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

export default CategoryServices;

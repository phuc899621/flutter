import CategoryModel from "../models/category.model.js";
import HttpError from "../utils/http.error.js";
import TaskModel from "../models/task.model.js";
import db from "../config/db.js";

class CategoryServices {
   //#region CREATE
    static async createCategory(userId, data) {
        try {
            const user=await UserModel.findById(userId);
            if(!user) throw new HttpError("User not found",404);
            const created = await CategoryModel.create({ ...data, userId });
            return {
                localId: parseInt(data.localId, 10),
                ...created.toObject(),
            };
        } catch (e) {
            if (err.code === 11000) {
                throw new HttpError("Category name already exists", 400);
            }
            if (e instanceof HttpError) throw e;
            throw new Error(`Create category error: ${e.message}`);
        }

    }
    //#endregion

    //#region READ
    static async getCategories(userId) {
        try {
            const categories = await CategoryModel.find({ userId });
            return categories.map(category => category.toObject());
        } catch (e) {
            throw new Error(`Get all categories error: ${e.message}`);
        }
    }
    static async getCategory(id) {
        try {
            const category = await CategoryModel.findById(id);
            if (!category) {
                throw new HttpError("Category not found", 404);
            }
            return category.toObject();
        } catch (e) {
            if (e instanceof HttpError) throw e;
            throw new Error(`Get category error: ${e.message}`);
        }
    }

    //#region DELETE
    
    static async deleteOne(userId,id) {
        const session = await db.startSession();
        try {
            const category = await CategoryModel.findOne({ _id: id });
            if (!category) {
                throw new HttpError("Category not found", 404);
            }
            if (category.isDefault) {
                throw new HttpError("Cannot delete default category", 400);
            }

            const defaultCategory = await CategoryModel.findOne({ isDefault: true,userId });
            if (!defaultCategory) {
                throw new HttpError("Default category not found", 404);
            }
           

            session.startTransaction();

            const tasks = await TaskModel.find({ categoryId: category._id }, null, { session });
            if (tasks.length > 0) {
            const taskIds = tasks.map(task => task._id);
            await TaskModel.updateMany(
                { _id: { $in: taskIds } },
                { $set: { categoryId: defaultCategory._id } },
                { session }
            );
            }
            await CategoryModel.deleteOne({ _id: id},{ session });
            await session.commitTransaction();
            return id;

            
        } catch (e) {
            await session.abortTransaction(); 
            if (e instanceof HttpError) throw e;
            throw new Error(`Delete category error: ${e.message}`);
        } finally {
            session.endSession();
        }
    }
    //#endregion

    //#region UPDATE
    static async updateCategoryFull(userId,id, updateData) {
        try {
            const user=await UserModel.findById(userId);
            if(!user) throw new HttpError("User not found",404);
            const category = await CategoryModel.findOneAndUpdate(
                {_id:id,userId}, 
                { ...updateData,userId },
                { new: true, overwrite: true });
            if (!category) {
                throw new HttpError("Category not found", 404);
            }
            return category.toObject();
        }
        catch (e) {
            if (err.code === 11000) {
                throw new HttpError("Category name already exists", 400);
            }
            if (e instanceof HttpError) throw e;
            throw new Error(`Update category error: ${e.message}`);
        }
    }
    static async updateCategoryPartial(userId,id, updateData) {
        try {
            const user=await UserModel.findById(userId);
            if(!user) throw new HttpError("User not found",404);
            const category = await CategoryModel.findOneAndUpdate(
                {_id:id,userId}, 
                { $set: updateData },
                { new: true });
            if (!category) {
                throw new HttpError("Category not found", 404);
            }
            return category.toObject();
        }
        catch (e) {
            if (err.code === 11000) {
                throw new HttpError("Category name already exists", 400);
            }
            if (e instanceof HttpError) throw e;
            throw new Error(`Update category error: ${e.message}`);
        }
    }
    //#endregion
    //#region UTILS
    static async createDefaultCategories(userId,session=null) {
        try {
            const defaultCategories = [
                { name: 'Work', userId },
                { name: 'Personal', userId },
                { name: 'Shopping', userId },
                { name: 'Health', userId },
                { name: 'Any', userId },
            ];  
            await CategoryModel.insertMany(defaultCategories,{session});
        } catch (e) {
            throw new Error(`Create default category error: ${e.message}`);
        }
    }

  
}

export default CategoryServices;
import CategoryModel from "../models/category.model.js";
import HttpError from "../utils/http.error.js";
import TaskModel from "../models/task.model.js";
import db from "../config/db.js";

class CategoryServices {
    static async findAll() {
        return await CategoryModel.find();
    }
    static async findByUserId(userId) {
        return await CategoryModel.find({userId});
    }
    static async findByName(name){
        return await CategoryModel.findOne({name});
    }
    static async findById(id) {
        return await CategoryModel.findOne({_id: id});
    }

    static async create(userId, request) {
        try {
            const {localId,name}= request;
            const existing = await CategoryModel.findOne({ userId, name });
            if( existing) {
                throw new HttpError("Category name already exists", 400);
            }
            const created = await CategoryModel.create({ userId, name, localId });
            const result = {
                localId: parseInt(localId, 10),
                id: created._id,
            };
            return result;
        } catch (e) {
            throw new Error(`Create category error: ${e.message}`);
        }

    }
    
    static async deleteOne(id) {
        const session = await db.startSession();
        let transactionStarted = false; // 👈 thêm flag
        try {
            const category = await CategoryModel.findOne({ _id: id });
            if (!category) {
                throw new HttpError("Category not found", 404);
            }

            const AnyCategory = await CategoryModel.findOne({ name: { $regex: /^any$/i } });
            if (!AnyCategory) {
                throw new HttpError("Default category 'Any' not found", 404);
            }

            session.startTransaction();
            transactionStarted = true; 

            const tasks = await TaskModel.find({ categoryId: category._id }, null, { session });
            if (tasks.length > 0) {
            const taskIds = tasks.map(task => task._id);
            await TaskModel.updateMany(
                { _id: { $in: taskIds } },
                { $set: { categoryId: AnyCategory._id } },
                { session }
            );
            }

            const result = await CategoryModel.deleteOne(
            { _id: id, name: { $not: /^any$/i } },
            { session }
            );

            if (result.deletedCount === 0) {
            throw new HttpError("Category not found or protected", 404);
            }

            await session.commitTransaction();
        } catch (e) {
            if (transactionStarted) {
                await session.abortTransaction(); 
            }
            throw new Error(`Delete one category by id error: ${e.message}`);
        } finally {
            session.endSession();
        }
    }
    static async deleteMany(ids) {
        try {
            const result = await CategoryModel.deleteMany({ _id: { $in: ids },name: {$nin: ["Any"]} });
            if (result.deletedCount === 0) {
                throw new HttpError("No categories found to delete", 404);
            }
        } catch (e) {
            throw new Error(`Delete many categories by ids error: ${e.message}`);
        }
    }
    static async deleteAll(userId) {
        try {
            const result = await CategoryModel.deleteMany({userId});
            if (result.deletedCount === 0) {
                throw new HttpError("No categories found to delete", 404);
            }
        } catch (e) {
            throw new Error(`Delete all categories error: ${e.message}`);
        }
    }
    static async updateOne(id, request) {
        try {
            const updatedCategory = await CategoryModel.findOneAndUpdate({_id:id}, request);
            if (!updatedCategory) {
                throw new HttpError("Category not found", 404);
            }
        }
        catch (e) {
            throw new Error(`Update category by id error: ${e.message}`);
        }
    }
    static async updateMany(ids, request) {
        try {
    
            const updatedCategories = await CategoryModel.updateMany(ids, request);
            if (updatedCategories.modifiedCount === 0) {
                throw new HttpError("No categories found to update", 404);
            }
        } catch (e) {
            throw new Error(`Update many categories by ids error: ${e.message}`);
        }
    }

  
}

export default CategoryServices;
import CategoryModel from "../models/category.model.js";
import HttpError from "../utils/http.error.js";

class CategoryServices {
    static async findAll() {
        try {
            return await CategoryModel.find();
        } catch (e) {
            throw new Error(`Find all categories error: ${e.message}`);
        }
    }
    static async findAllByUserId(userId) {
        try {
            return await CategoryModel.find({userId});
            
        } catch (e) {
            throw new Error(`Find all categories by userId error: ${e.message}`);
        }
    }

    static async create(userId, request) {
        try {
            const categoryList=request.map(({localId,name})=>({name}));
            const createdCategories = await CategoryModel.create(userId, categoryList);
            const result = createdCategories.map((category,index) => ({
                localId: categoryList[index].localId,
                remoteId: category._id,
                name: category.name
            }));
            return result;
        } catch (e) {
            throw new Error(`Create category error: ${e.message}`);
        }

    }
    static async deleteOne(id) {
        try {
            const result= await CategoryModel.deleteOne({_id: id});
            if(result.deletedCount === 0) {
                throw new HttpError("Category not found",404);
            }
        } catch (e) {
            throw new Error(`Delete one category by id error: ${e.message}`);
        }
    }
    static async deleteMany(ids) {
        try {
            const result = await CategoryModel.deleteMany({ _id: { $in: ids } });
            if (result.deletedCount === 0) {
                throw new HttpError("No categories found to delete", 404);
            }
        } catch (e) {
            throw new Error(`Delete many categories by ids error: ${e.message}`);
        }
    }
    static async deleteAll(userId) {
        try {
            const result = await CategoryModel.deleteAll({userId});
            if (result.deletedCount === 0) {
                throw new HttpError("No categories found to delete", 404);
            }
        } catch (e) {
            throw new Error(`Delete all categories error: ${e.message}`);
        }
    }
    static async updateOne(id, request) {
        try {
            const updatedCategory = await CategoryModel.findOneAndUpdate(id, request);
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
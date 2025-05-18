
const CategoryModel=require("../model/task.category.model");
class CategoryServices{
    static async addCategory(userId,name) {
        try{
            return await CategoryModel.addCategory(userId,name);
        }catch(e){
            throw e;
        }
    }
    static async deleteCategory(id) {
        try{
            return await CategoryModel.deleteCategory(id);
        }catch(e){
            throw e;
        }
    }
    static async updateCategory(id, name) {
        try{
            return await CategoryModel.updateCategory(id, name);
        }catch(e){
            throw e;
        }
    }
    static async findAllCategories(userId) {
        try{
            return await CategoryModel.findAllCategories(userId);
        }catch(e){
            throw e;
        }
    }
    static async addDefaultCategories(userId) {
        try{
            return await CategoryModel.addDefaultCategories(userId);
        }catch(e){
            throw e;
        }
    }
}
module.exports=CategoryServices;
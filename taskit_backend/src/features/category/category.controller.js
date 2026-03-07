
import CategoryServices from '../services/category.services.js';
//#region CREATE
export const createCategory = async (req, res) => {
    try {
        const userId = req.user.id;
        const result=await CategoryServices.createCategory(userId, req.body);
        return res.status(201).json({
            message: "Category created successfully",
            data: result
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
//#endregion

//#region READ
export const getCategories = async (req, res) => {
    try {
        const userId = req.user.id;
        const categories = await CategoryServices.getCategories(userId);
        return res.status(200).json({
            message: "Categories retrieved successfully",
            data: categories
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
export const getCategory= async (req, res) => {
    try{
        const { id } = req.params;
        const category = await CategoryServices.getCategory(id);
        return res.status(200).json({
            message: "Category retrieved successfully",
            data: category
        });
    }catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
//#endregion
//#region UPDATE
export const updateCategoryFull = async (req, res) => {
    try {
        const { id } = req.params;
        const userId = req.user.id;
        const result=await CategoryServices.updateCategoryFull(userId, id, req.body);
        return res.status(200).json({
            message: "Category updated successfully",
            data: result
        });
    }catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
export const updateCategoryPartial = async (req, res) => {
    try {
        const { id } = req.params;
        const userId = req.user.id;
        const result= await CategoryServices.updateCategoryPartial(userId, id, req.body);
        return res.status(200).json({
            message: "Category updated successfully",
            data: result
        });
    }catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
//#endregion
//#region DELETE


export const deleteCategory = async (req, res) => {
    try {
        const { id } = req.params;
        const userId = req.user.id;
        const result=await CategoryServices.deleteOne(userId, id);
        return res.status(200).json({
            message: "Category deleted successfully",
            data: result
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}


//#endregion
import CategoryServices from '../services/category.services.js';

export const create_category = async (req, res) => {
    try {
        const userId = req.user.id;
        const result=await CategoryServices.create(userId, req.body);
        return res.status(201).json({
            message: "Create category successfully",
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
export const update_category = async (req, res) => {
    try {
        const { categoryId } = req.params;
        await CategoryServices.updateOne(categoryId, req.body);
        return res.status(200).json({
            message: "Update category successfully",
            data: {}
        });
    }catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
export const delete_category_bulk = async (req, res) => {
    try {
        const { ids } = req.body;
        await CategoryServices.deleteMany(ids);
        return res.status(200).json({
            message: "Delete categories successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}

export const delete_category = async (req, res) => {
    try {
        const { categoryId } = req.params;
        await CategoryServices.deleteOne(categoryId);
        return res.status(200).json({
            message: "Delete category successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
export const delete_all_categories = async (req, res) => {
    try {
        const userId = req.user.id;
        await CategoryServices.deleteAll(userId);
        return res.status(200).json({
            message: "Delete all categories successfully",
            data: {}
        });
    }
    catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}


export const get_category = async (req, res) => {
    try {
        const userId = req.user.id;
        const categories = await CategoryServices.findByUserId(userId);
        return res.status(200).json({
            message: "Get all categories successfully",
            data: categories
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when get all categories: " + e.message,
            data: {}
        });
    }
}
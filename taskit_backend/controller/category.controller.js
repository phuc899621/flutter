import CategoryServices from '../services/category.services.js';

export const addCategory = async (req, res) => {
    try {
        const { name } = req.body;
        const userId = req.user.id;
        if (!userId || !name) {
            return res.status(400).json({
                message: "Please enter all fields",
                data: {}
            });
        }
        await CategoryServices.addCategory(userId, name);
        return res.status(201).json({
            message: "Create category successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when create category: " + e.message,
            data: {}
        });
    }
}

export const deleteCategory = async (req, res) => {
    try {
        const { categoryId } = req.query;
        if (!categoryId) {
            return res.status(400).json({
                message: "Please enter all fields",
                data: {}
            });
        }
        await CategoryServices.deleteCategory(categoryId);
        return res.status(200).json({
            message: "Delete category successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when delete category: " + e.message,
            data: {}
        });
    }
}

export const updateCategory = async (req, res) => {
    try {
        const { name } = req.body;
        const { categoryId } = req.query;
        if (!categoryId || !name) {
            return res.status(400).json({
                message: "Please give categoryId and name",
                data: {}
            });
        }
        await CategoryServices.updateCategory(categoryId, name);
        return res.status(200).json({
            message: "Update category successfully",
            data: {}
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when update category: " + e.message,
            data: {}
        });
    }
}

export const findAllCategories = async (req, res) => {
    try {
        const userId = req.user.id;
        if (!userId) {
            return res.status(400).json({
                message: "Please enter all fields",
                data: {}
            });
        }
        const categories = await CategoryServices.findAllCategories(userId);
        return res.status(200).json({
            message: "Get all categories successfully",
            data: {
                categories: categories
            }
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when get all categories: " + e.message,
            data: {}
        });
    }
}
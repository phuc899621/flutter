import AIServices from '../services/ai.services.js';
import CategoryServices from '../services/category.services.js';
import UserServices from '../services/user.services.js';

export const suggestCategories = async (req, res) => {
    try {
        const { title, excludedCategories } = req.body;
        const category = await AIServices.suggestCategories(title,excludedCategories);
            return res.status(200).json({
                message: "Suggest category successfully",
                data: category
            });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when suggest category: " + e.message,
            data: {}
        });
    }
};

export const createTaskUsingAi = async (req, res) => {
    try {
        const userId = req.user.id;
        const user=await UserServices.findById(userId);
        if (!user) {
            return res.status(404).json({
                message: "User not found",
                data: {}
            });
        }
        const { text,utcOffset } = req.body;
        const categories = await CategoryServices.findByUserId(userId);
        if(!categories || categories.length === 0) {
            return res.status(404).json({
                message: "Need at least two category to create task using AI",
                data: {}
            });
        }
        const result = await AIServices.createTaskUsingAi(text,categories,utcOffset);
            return res.status(200).json({
                message: "Create task using AI successfully",
                data: result
            });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: `Create task using AI error: ${e.message}`,
            data: {}
        });
    }
};



import AIServices from '../services/ai.services.js';

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

export const getTaskAi = async (req, res) => {
    try {
        const { title, category } = req.body;
        const result = await AIServices.parseTaskInfoFromText(title,category);
            return res.status(200).json({
                message: "Suggest category successfully",
                data: result
            });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when suggest category: " + e.message,
            data: {}
        });
    }
};



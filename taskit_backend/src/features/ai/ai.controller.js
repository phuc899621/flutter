import AIServices from '../services/ai.services.js';
import CategoryServices from '../services/category.services.js';
import UserServices from '../services/user.services.js';
import TaskServices from '../services/task.services.js';
import SubtaskServices from '../services/subtask.services.js';

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
export const answerTaskQuestion = async (req, res) => {
    try {
        const userId = req.user.id;
        const user=await UserServices.findById(userId);
        if (!user) {
            return res.status(404).json({
                message: "User not found",
                data: {}
            });
        }
        const { text,utcOffset,language } = req.body;
        const categories = await CategoryServices.findByUserId(userId);
        if(!categories || categories.length === 0) {
            return res.status(404).json({
                message: "No categories found to answer question",
                data: {}
            });
        }
        //get tasks and subtasks
        const tasks = await TaskServices.findByUserId(userId);
        const taskIds = tasks.map(task => task._id);
        const subtasks = await SubtaskServices.findByTaskIds(taskIds);
        const result = await AIServices.answerTaskQuestion(text,
             categories,tasks,subtasks,language, utcOffset);
            return res.status(200).json({
                message: "Answer question using AI successfully",
                data: result
            });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: `Answer question using AI error: ${e.message}`,
            data: {}
        });
    }
};



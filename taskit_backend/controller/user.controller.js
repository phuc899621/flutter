import UserServices from '../services/user.services.js';

export const update_profile = async (req, res,next) => {
    try {
        const userId = req.user.id; 
        const updateData = {}
        if (req.file) {
            updateData.avatar = `uploads/${req.file.filename}`;
        }
        if (req.body.name) {
            updateData.name = req.body.name;
        }
        const result = await UserServices.update_profile(userId, updateData);
        return res.status(200).json({
            message: "Profile updated successfully!",
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
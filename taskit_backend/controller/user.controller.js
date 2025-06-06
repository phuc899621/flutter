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
export const update_email = async (req, res) => {
    try {
        const userId = req.user.id; 
        const { email } = req.body;
        await UserServices.update_email(userId, email);
        return res.status(200).json({
            message: "Otp has been sent to your email!",
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
export const update_email_verify = async (req, res) => {
    try {
        const userId = req.user.id; 
        const result = await UserServices.update_email_verify(userId, req.body);
        return res.status(200).json({
            message: "Email updated successfully!",
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
export const update_password = async (req, res) => {
    try {
        const userId = req.user.id; 
        await UserServices.update_password(userId, req.body);
        return res.status(200).json({
            message: "Password updated successfully!",
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
export const delete_account = async (req, res) => {
    try {
        const userId = req.user.id; 
        await UserServices.delete_account(userId);
        return res.status(200).json({
            message: "Account deleted successfully!",
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
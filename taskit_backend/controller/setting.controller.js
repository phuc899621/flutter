import SettingServices from "../services/setting.services.js";


export const update_setting = async (req, res) => {
    try {
        const userId = req.user.id;
        await SettingServices.updateByUserId(userId, req.body);
        return res.status(200).json({
            message: "Update setting successfully",
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
export const get_setting = async (req, res) => {
    try {
        const userId = req.user.id;
        const setting = await SettingServices.findByUserId(userId);
        return res.status(200).json({
            message: "Get setting successfully",
            data: setting 
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
}
export const delete_setting = async (req, res) => {
    try {
        const userId = req.user.id;
        await SettingServices.deleteByUserId(userId);
        return res.status(200).json({
            message: "Delete setting successfully",
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
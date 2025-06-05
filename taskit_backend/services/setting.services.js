import SettingModel from "../models/setting.model.js";
import HttpError from "../utils/http.error.js";
class SettingServices {
    static async findByUserId(userId){
        try {
            const setting = await SettingModel.findOne(userId);
            return setting;
        } catch (e) {
            throw new Error(`Find setting by userId error: ${e.message}`);
        }
    }
    static async findAll(){
        try {
            const settings = await SettingModel.find();
            return settings;
        } catch (e) {
            throw new Error(`Find all settings error: ${e.message}`);
        }
    }
    static async findById(id){
        try {
            const setting = await SettingModel.findById(id);
            return setting;
        } catch (e) {
            throw new Error(`Find setting by id error: ${e.message}`);
        }
    }
    static async updateByUserId(userId, request) {
        try {
            const setting = await SettingModel.findOneAndUpdate(
                { userId: userId },
                { $set: request }, 
                { new: true, runValidators: true } 
            )
            if (!setting) {
                throw new HttpError('Setting not found',404);
            }
        } catch (e) {
            throw new Error(`Update setting by userId error: ${e.message}`);
        }
    }
    static async deleteByUserId(userId) {
        try {
            const setting = await SettingModel.findOneAndDelete({ userId: userId });
            if (!setting) {
                throw new HttpError('Setting not found', 404);
            }
        } catch (e) {
            throw new Error(`Delete setting by userId error: ${e.message}`);
        }
    }
}
export default SettingServices;
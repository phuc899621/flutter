import SettingModel from "../models/setting.model.js";
import UserServices from "./user.services.js";
import HttpError from "../utils/http.error.js";
class SettingServices {
    static async createSetting(userId,session=null){ 
        try {
            const options={};
            if(session) options.session=session;
            const request = { userId };
            const setting = new SettingModel(request);
            await setting.save(options);
            return setting.toObject();
        } catch (e) {
            throw new HttpError(`Create setting error: ${e.message}`,500);
        }
    }
    static async findByUserId(userId){
        return await SettingModel.findOne({userId});
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
            const user = await UserServices.findById(userId);
            if (user) {
                throw new HttpError('Unable delete setting because user still exists', 409);
            }
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
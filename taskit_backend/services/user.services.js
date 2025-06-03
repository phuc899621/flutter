import UserModel from '../model/user.model.js';
import UserSettingModel from '../model/setting.model.js';
import bcrypt from "bcryptjs";

class UserServices {
    static async findByEmail(email) {
        return await UserModel.findOne({ email });
    }
    static async findById(id) {
        return await UserModel.findOne({ _id: id });
    }
    static async create({ email, name, password }) {
        try {
            const createUser = new UserModel({
                email,
                name,
                password,
            });
            return await createUser.save();
        } catch (e) {
            throw e;
        }
    }
    static async resetPassword(email, newPassword) {
        try {
            const user = await this.findByEmail(email);
            const salt = await bcrypt.genSalt(10);
            user.password = await bcrypt.hash(newPassword, salt);
            await user.save();
            return user;
        } catch (e) {
            throw e;
        }
    }
    static async comparePassword(password, savePassword) {
        try {
            return await UserModel.comparePassword(password, savePassword);
        } catch (e) {
            throw e;
        }
    }
}

export default UserServices;
const UserModel=require('../model/user.model');
const UserSettingModel=require('../model/user.setting.model');
const bcrypt = require("bcryptjs");
class UserServices{
    static async signup(email,name,password){
        try{
            const createUser=new UserModel({
                email:email,
                name:name,
                password:password,
            });
            return await createUser.save();
        }catch(e){
            throw e;
        }
    }
    static async resetPassword(email,newPassword){
        try{
            const user=await this.findUserByEmail(email);
            const salt = await bcrypt.genSalt(10);
            user.password = await bcrypt.hash(newPassword, salt);
            await user.save();
            return user;
        }catch(e){
            throw e;
        }
    }
    static async findUserByEmail(email){
        try{
            return await UserModel.findUserByEmail(email);
        }catch(e){
            throw e;
        }
    }
    static async comparePassword(password,savePassword){
        try{
            return await UserModel.comparePassword(password,savePassword);
        }catch(e){
            throw e;
        }
    }
    //create method for get user setting by userId
    static async findSettingByUserId(userId){
        try{
            return await UserSettingModel.findSettingByUserId(userId);
        }catch(e){
            throw e;
        }
    }
}
module.exports=UserServices
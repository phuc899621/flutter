const UserModel=require('../model/user.model');
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
}
module.exports=UserServices
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
    static async isEmailExist(email){
        try{
            return await UserModel.isEmailExist(email);
        }catch(e){
            throw e;
        }
    }
}
module.exports=UserServices
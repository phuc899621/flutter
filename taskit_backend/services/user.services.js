const UserModel=require('../model/user.model');
class UserServices{
    static async register(email,name,password){
        try{
            const createUser=new UserModel({
                email:email,
                name:name,
                password:password,
            });
            return await createUser.save();
        }catch(e){
            throw(e);
        }
    }
}
module.exports=UserServices;
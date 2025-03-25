const UserServices=require('../services/user.services');

    exports.register=async(req,res,next)=>{
        try{
            const {name,email,password}=req.body;
            const successRes=await UserServices.registerUser(name,email,password);
            res.json({
                status: true,
                message:"User Registered Successfully",
                data: {
                    name: successRes.name,
                    email: successRes.email,
                    password: successRes.password,
                    avatar: successRes.avatar
                }
            })

        }catch(e){
            throw(e);
        }
    }
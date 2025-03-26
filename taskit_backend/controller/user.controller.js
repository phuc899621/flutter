const UserServices=require('../services/user.services');

    exports.register=async(req,res,next)=>{
        try{
            const {name,email,password}=req.body;
            const isEmailExist=await UserServices.isEmailExist(email);
            if(isEmailExist){
                return res.status(400).json({
                    status: false,
                    message:"Email is already taken!",
                    data: {}
                })
            }
    
            const successRes=await UserServices.register(email,name,password);
            return res.status(201).json({
                status: true,
                message:"User Registered Successfully",
                data: {
                    id: successRes._id,
                    name: successRes.name,
                    email: successRes.email,
                    password: successRes.password,
                    avatar: successRes.avatar
                }
            })

        }catch(e){
            return res.status(500).json({
                status: false,
                message: "An error occurred: "+e.message,
                data: {}
            });
        }
    }
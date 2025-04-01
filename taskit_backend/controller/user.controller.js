const UserServices=require('../services/user.services');
const OtpServices=require('../services/otp.services');
    exports.signup=async(req,res)=>{
        try{
            const {name,email,password,passwordConfirm}=req.body;
            if (!name || !email || !password) {
                return res.status(400).json({
                    status: false,
                    message: "Please enter required information!",
                    data:{}        
                });
              }
            if(password!==passwordConfirm){
                return res.status(400).json({
                    status:false,
                    message: "Passwords do not match!",
                    data:{}
                })
            }
            const isEmailExist=await UserServices.isEmailExist(email);
            if(isEmailExist){
                 return res.status(400).json({
                    status: false,
                    message:"Email is already taken!",
                     data: {}
                 });
            }
            const otp=await OtpServices.generateOTP();
            await OtpServices.sendOTP(email,otp);
            await OtpServices.createOtpUser(email,otp);
            return res.status(201).json({
                status: true,
                message:"Verify code has been sent to your email",
                data: {
                    email: email,
                }
            })

        }catch(e){
            return res.status(500).json({
                status: false,
                message: "An error occurred when sign up: "+e.message,
                data: {}
            });
        }
    }
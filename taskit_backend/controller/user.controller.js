const UserServices=require('../services/user.services');
const OtpServices=require('../services/otp.services');
    exports.signup=async(req,res)=>{
        //try{
            const {name,email,password,passwordConfirm}=req.body;
            if (!name || !email || !password) {
                return res.status(400).json({
                    message: "Please enter required information!",
                    data:{}        
                });
              }
            if(password!==passwordConfirm){
                return res.status(400).json({
                    message: "Passwords do not match!",
                    data:{}
                })
            }
            const isEmailExist=await UserServices.isEmailExist(email);
            if(isEmailExist){
                 return res.status(400).json({
                    message:"Email is already taken!",
                     data: {}
                 });
            }
            const isVerifySend=await OtpServices.isVerifySend(email);
            if(isVerifySend){
                await OtpServices.deleteOtpByEmail(email);
            }
            const otp=await OtpServices.generateOTP();
            await OtpServices.sendOTP(email,otp);
            await OtpServices.createOtpUser(email,otp);
            return res.status(201).json({
                message:"Verify code has been sent to your email",
                data: {
                    email: email,
                }
            })

        // }catch(e){
        //     return res.status(500).json({
        //         message: "An error occurred when sign up: "+e.message,
        //         data: {}
        //     });
        // }
    }

    exports.verifyEmail=async(req,res)=>{
        try{
            const {email,otp}=req.body;
            const getOtp=await OtpServices.findOtpByEmail(email);
            if(getOtp){
                if(getOtp.otp==otp){
                    const {name,password}=getOtp.body;
                    const user=await UserServices.signup(email,password,name);
                    if(user){
                        return res.status(201).json({
                            message:"Verify your account successfully!",
                            data:{}
                        })
                    }
                    else{
                        return res.status(500).json({
                            message: "Failed to verify account!",
                            data:{}
                        })
                    }
                }
                else{
                    return res.status(400).json({
                        message: "Wrong otp for "+email+"!",
                        data:{}
                    }) 
                }
            }
            else{
                return res.status(404).json({
                    message: "Invalid email",
                    data:{}
                });
            }
        }
        catch{
            return res.status(500).json({
                message: "An error occurred when verify sign up otp: "+e.message,
                data: {}
            });
        }
    }
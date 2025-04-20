const UserServices=require('../services/user.services');
const OtpAuthServices=require('../services/otp.auth.services');
const OtpServices=require('../services/otp.services');
const jwt = require("jsonwebtoken");
    exports.signup=async(req,res)=>{
        try{
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
            const isEmailExist=await UserServices.findUserByEmail(email);
            if(isEmailExist){
                 return res.status(400).json({
                    message:"Email is already taken!",
                     data: {}
                 });
            }
            const isVerifySend=await OtpAuthServices.isVerifySend(email);
            if(isVerifySend){
                await OtpAuthServices.deleteOtpByEmail(email);
            }
            const otp=await OtpAuthServices.generateOTP();
            await OtpAuthServices.sendOTP(email,otp);
            await OtpAuthServices.createOtpUser(name,email,otp,password);
            return res.status(201).json({
                message:"Verify code has been sent to your email",
                data: {
                    email: email,
                }
            })

        }catch(e){
            return res.status(500).json({
                message: "An error occurred when sign up: "+e.message,
                data: {}
            });
        }
    }

    exports.verifyEmail=async(req,res)=>{
        try{
            const {email,otp}=req.body;
            const getOtp=await OtpAuthServices.findOtpByEmail(email);
            if(getOtp){
                if(await OtpServices.compareOtp(otp,getOtp.otp)){
                    const {name,password}=getOtp;
                    const user=await UserServices.signup(email,name,password);
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
                return res.status(400).json({
                    message: "Invalid email",
                    data:{}
                });
            }
        }
        catch(e){
            return res.status(500).json({
                message: "An error occurred when verify sign up otp: "+e.message,
                data: {}
            });
        }
        
    }

    exports.login=async(req,res)=>{
        try{
            const { email, password } = req.body;
            if(!email||!password){
                return res.status(400).json({ 
                    message: "Please enter your email and password!",
                    data:{}
                });
            }
            if(!email){
                return res.status(400).json({ 
                    message: "Please enter your email!",
                    data:{}
                });
            }
            if(!password){
                return res.status(400).json({ 
                    message: "Please enter your password!!",
                    data:{}
                });
            }
            const user = await UserServices.findUserByEmail(email);
                
            if (!user) {
                return res.status(400).json({ 
                    message: "User not found!",
                    data:{}
                });
            }
            if(!(await UserServices.comparePassword(password,user.password))){
                return res.status(400).json({ 
                    message: "Wrong password!",
                    data:{}
                });
            }
            const token = jwt.sign(
                { id: user._id, email: user.email },
                process.env.JWT_SECRET || "899621",
                { expiresIn: process.env.JWT_EXPIRES_IN || "1d" }
            );
            return res.status(201).json({
                message: "Login successful",
                data:{
                    token: token
                },
            });
        }catch(e){
            return res.status(500).json({
                message: "An error occurred when login: "+e.message,
                data: {}
            });
        }
    }
    exports.forgotPasswordVerifyEmail=async(req,res)=>{
        try{
            const {email} = req.body;
            if(!email){
                return res.status(400).json({
                    message: "Please enter your email!",
                    data:{}
                });
            }
            const user=await UserServices.findUserByEmail(email);
            const userOtp=await OtpServices.findOtpByEmail(email);
            if(!user){
                return res.status(400).json({
                    message: "User Not Found!",
                    data:{}
                });
            }
            if(userOtp){
                await OtpServices.deleteOtpByEmail(email);
            }
            const otp=await OtpServices.generateOTP();
            const resetToken=await OtpServices.generateResetToken();
            await OtpServices.sendOTP(email,otp);
            await OtpServices.createOtpUser(email,otp,resetToken);
            return res.status(201).json({
                message: "Verify otp has been send to your email",
                data:{}
            });
        
        }catch(e){
            return res.status(500).json({
                message: "An error occurred when verify email for forgot password: "+e.message,
                data: {}
            });
        }
    }
    exports.forgotPasswordVerifyOtp=async(req,res)=>{
        try{
            const {email,otp} = req.body;
            const userOtp=await OtpServices.findOtpByEmail(email);
            if(!userOtp){
                return res.status(400).json({
                    message: "Invalid Email!",
                    data:{}
                });
            }
            if(await OtpServices.compareOtp(otp,userOtp.otp)){
                return res.status(201).json({
                    message: "Verify successfully!",
                    data:{
                        resetToken:userOtp.resetToken,
                    }
                });
            }
            return res.status(400).json({
                message: "Wrong otp!",
                data:{}
            });
        
        }catch(e){
            return res.status(500).json({
                message: "An error occurred when verify otp for forgot password: "+e.message,
                data: {}
            });
        }
    }
    exports.resetPassword=async(req,res)=>{
        try{
            const resetToken=req.headers['reset-token'];
            if(!resetToken){
                return res.status(400).json({
                    message: "Reset token needed!",
                    data:{}
                }); 
            }
            const {email,password,passwordConfirm} = req.body;
            if(!email || !password || !passwordConfirm){
                return res.status(400).json({
                    message: "Please enter required information!",
                    data:{}
                }); 
            }
            if(password!=passwordConfirm){
                return res.status(400).json({
                    message: "Passwords do not match",
                    data:{}
                }); 
            }
            
            const userOtp=await OtpServices.findOtpByEmail(email);
            if(!userOtp){
                return res.status(400).json({
                    message: "Invalid Email!",
                    data:{}
                });
            }
            if(userOtp.resetToken!=resetToken){
                return res.status(400).json({
                    message: "Invalid reset token!",
                    data:{}
                });
            }
            await UserServices.resetPassword(email,password);
            await OtpServices.deleteOtpByEmail(email);
            return res.status(201).json({
                message: "Reset password successfully!",
                data:{}
            });
        
        }catch(e){
            return res.status(500).json({
                message: "An error occurred when reset password: "+e.message,
                data: {}
            });
        }
    }

    exports.verifyLogin=async(req,res)=>{
        try{
            const token=req.headers['authorization'].split(' ')[1];
            if(!token){
                return res.status(400).json({
                    message: "Token needed",
                    data:{}
                });
            }
            const decoded=jwt.verify(token,process.env.JWT_SECRET || "899621");

            const user=await UserServices.findUserByEmail(decoded.email);
            if(!user){
                return res.status(400).json({
                    message: "User not found!",
                    data:{}
                });
            }
            return res.status(200).json({
                message: "Token is valid!",
                data:{
                    user:{
                        name:user.name,
                        email:user.email,
                    }
                }
            });
        }catch(e){
            return res.status(500).json({
                message: "An error occurred when verify token: "+e.message,
                data: {}
            });
        }   
    }
const EmailService=require("../core/emailService");
const OtpAuthModel=require('../model/otp.auth.model');
const bcrypt = require("bcryptjs");
class OtpAuthServices{
    static async createOtpUser(name,email,otp,password){
        const otpUser=new OtpAuthModel({
            email: email,
            otp: otp,
            password:password,
            name: name
        });
        return await otpUser.save();
    }
    static async generateOTP(){
        return await Math.floor(1000+Math.random()*9000).toString();
    }
    static async isVerifySend(email){
        try{
            return await OtpAuthModel.isVerifySend(email);
        }catch(e){
            throw e;
        }
    }
    static async deleteOtpByEmail(email){
        try{
            return await OtpAuthModel.deleteOtpByEmail(email);
        }catch(e){
            throw e;
        }
    }
    static async findOtpByEmail(email){
        try{
            return await OtpAuthModel.findOtpByEmail(email);
        }catch(e){
            throw e;
        }
    }
    static async compareOtp(otp,hashOtp){
        try{
            return await bcrypt.compare(otp,hashOtp) ;
        }catch(e){
            throw e;
        }
    }
    static async sendOTP(email,otp){
        return EmailService.sendEmail(
            email,
            "Verify email for Taskit account",
            "Your OTP is: "+otp +". This OTP only last 15 minutes." 
        );
    }
}
module.exports=OtpAuthServices
const EmailService=require("../core/emailService");
const OtpModel=require('../model/otp.model');
class OtpServices{
    static async createOtpUser(email,otp){
        const otpUser=new OtpModel({
            email: email,
            otp: otp
        });
        return await otpUser.save();
    }
    static async generateOTP(){
        return await Math.floor(1000+Math.random()*9000).toString();
    }
    static async isVerifySend(email){
        try{
            return await OtpModel.isVerifySend(email);
        }catch(e){
            throw e;
        }
    }
    static async deleteOtpByEmail(email){
        try{
            return await OtpModel.deleteOtpByEmail(email);
        }catch(e){
            throw e;
        }
    }
    static async findOtpByEmail(email){
        try{
            return await OtpModel.findOtpByEmail(email);
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
module.exports=OtpServices
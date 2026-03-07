import VerificationModel from '../models/verification.model.js';
import UserServices from './user.services.js';
import HttpError from '../utils/http.error.js';


class VerificationServices {
    static generateOTP() {
        return Math.floor(1000 + Math.random() * 9000).toString();
    }
   
    static async isSignupRequested(userId) {
        if(await VerificationModel.findOne({ userId, type: 'signup' })) return true;
    }
    static async isResetRequested(userId) {
        if(await VerificationModel.findOne({ userId, type: 'reset' })) return true;
    }
    static getVerification(filter) {
        return VerificationModel.findOne(filter);
    }
    static deleteSignup(userId,session=null) {
        return VerificationModel.findOneAndDelete({ userId, type: 'signup' }, { session });
    }

    static deleteReset(userId,session=null) {
        return VerificationModel.findOneAndDelete({ userId, type: 'reset' }, { session });
    }
    static async createSignup(userId, otp,session=null) {
        try{
            const verification=new VerificationModel({ userId, otp, type: 'signup' });
            await verification.save({session});
        }catch(e){
            throw new HttpError(`Create signup verification error: ${e.message}`, 500);
        }
    }
    static async createReset(userId, otp,session=null) {
        try{
            const verification=new VerificationModel({ userId, otp, type: 'reset' });
            await verification.save({session});
        }catch(e){
            throw new HttpError(`Create reset verification error: ${e.message}`, 500);
        }
    }
    static async updateSignup(userId, otp,session=null) {
        try{
            await VerificationModel.findOneAndUpdate({ userId, type: 'signup' }, { otp,createdAt:Date.now() },{session});
        }catch(e){
            throw new HttpError(`Update signup verification error: ${e.message}`, 500);
        }
    }
    static async updateReset(userId, otp,session=null) {
        try{
            await VerificationModel.findOneAndUpdate({ userId, type: 'reset' }, { otp,createdAt:Date.now() },{session});
        }catch(e){
            throw new HttpError(`Update reset verification error: ${e.message}`, 500);
        }
    }
    
  

}

export default VerificationServices;
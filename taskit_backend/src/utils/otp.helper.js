export class OTPHelper {
  static generateOTP() {
    return Math.floor(1000 + Math.random() * 9000);
  }
}

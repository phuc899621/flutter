import VerificationModel from "./verification.model.js";

class VerificationRepository {
  static async upsertByUserId({ userId, otp, purpose }, session) {
    const updateData = {
      otp,
      createdAt: new Date(),
    };
    Object.keys(updateData).forEach((key) => {
      if (updateData[key] == null) {
        delete updateData[key];
      }
    });

    await VerificationModel.findOneAndUpdate(
      { userId, purpose },
      {
        $set: updateData,
      },
      { upsert: true, new: true, session },
    );
    return otp;
  }
  static findByUserIdAndPurpose(userId, purpose) {
    return VerificationModel.findOne({ userId, purpose });
  }
  static deleteByUserIdAndPurpose(userId, purpose, session) {
    return VerificationModel.findOneAndDelete({ userId, purpose }, { session });
  }
}
export default VerificationRepository;

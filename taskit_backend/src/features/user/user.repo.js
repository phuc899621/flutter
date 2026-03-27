import UserModel from "./user.model.js";
class UserRepository {
  static findByEmail(email, options = {}, session) {
    const { status } = options;
    const query = { email };
    if (status) query.status = status;
    return UserModel.findOne(query).session(session);
  }
  static findById(id, options = {}, session) {
    const { status } = options;
    const query = { _id: id };
    if (status) query.status = status;
    return UserModel.findOne(query).session(session);
  }
  static async upsertByEmail({ email, name, password, status }, session) {
    const updateData = {
      name,
      password,
      status,
      updatedAt: new Date(),
    };

    Object.keys(updateData).forEach((key) => {
      if (updateData[key] == null) {
        delete updateData[key];
      }
    });
    const user = await UserModel.findOneAndUpdate(
      { email },
      {
        $set: updateData,
      },
      {
        upsert: true,
        new: true,
        session,
      },
    );
    return user.toObject();
  }
  static async updateById(userId, updateData, session) {
    return UserModel.findByIdAndUpdate(
      userId,
      { $set: updateData },
      { new: true, session },
    );
  }
}
export default UserRepository;

import UserModel from "./user.model.js";
class UserRepository {
  static findByEmail(email, options = {}, session) {
    const { status } = options;
    const query = { email };
    if (status) query.status = status;
    return UserModel.findOne(query).session(session);
  }
  static findBySub(sub, options = {}, session) {
    const { status } = options;
    const query = { "auth.google.sub": sub };
    if (status) query.status = status;
    return UserModel.findOne(query).session(session);
  }
  static findById(id, options = {}, session) {
    const { status } = options;
    const query = { _id: id };
    if (status) query.status = status;
    return UserModel.findOne(query).session(session);
  }
  static async upsertByEmail(
    { email, name, password, sub, status, avatar },
    session,
  ) {
    const updateData = {
      name,
      status,
      "auth.local.password": password,
      "auth.google.sub": sub,
      avatar,
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
    if (updateData.password) {
      updateData["auth.local.password"] = updateData.password;
      delete updateData.password;
    }
    if (updateData.sub) {
      updateData["auth.google.sub"] = updateData.sub;
      delete updateData.sub;
    }
    return UserModel.findByIdAndUpdate(
      userId,
      { $set: updateData },
      { new: true, session },
    );
  }
}
export default UserRepository;

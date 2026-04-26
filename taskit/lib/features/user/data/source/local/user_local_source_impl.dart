import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../../../../../shared/data/source/local/drift/dao/user.dart';
import 'user_local_source.dart';

final userLocalSourceProvider = Provider<UserLocalSource>((ref) {
  final userDao = ref.watch(userDaoProvider);
  return UserLocalSourceImpl(userDao);
});

class UserLocalSourceImpl implements UserLocalSource {
  final UserDao userDao;

  UserLocalSourceImpl(this.userDao);

  @override
  Stream<UserTableData> watchUserByLocalId(int localId) =>
      userDao.watchUserByLocalId(localId);

  @override
  Future<UserTableData?> getUserByLocalId(int localId) =>
      userDao.getUserByLocalId(localId);

  @override
  Future<int> cacheUser(UserData data) async {
    final userTableData = await userDao.getUserByRemoteId(data.id);
    if (userTableData != null) {
      await userDao.updateUser(
        UserTableCompanion(
          localId: Value(userTableData.localId),
          remoteId: Value(data.id),
          name: Value(data.name),
          email: Value(data.email),
          avatar: Value(data.avatar),
        ),
      );
      return userTableData.localId;
    } else {
      return await userDao.insertUser(
        UserTableCompanion(
          remoteId: Value(data.id),
          name: Value(data.name),
          email: Value(data.email),
          avatar: Value(data.avatar),
        ),
      );
    }
  }
}

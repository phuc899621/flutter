import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';
import 'package:taskit/features/auth/data/mapper/user_mapper.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../../shared/data/source/local/drift/dao/user.dart';
import '../../../domain/entity/user_entity.dart';
import 'user_local_source.dart';

final userLocalSourceProvider = Provider<UserLocalSource>((ref) {
  final userDao = ref.watch(userDaoProvider);
  return UserLocalSourceImpl(userDao);
});

class UserLocalSourceImpl implements UserLocalSource {
  final UserDao userDao;

  UserLocalSourceImpl(this.userDao);

  @override
  Stream<UserEntity> watchUserByLocalId(int localId) =>
      (userDao.watchUserByLocalId(
        localId,
      )).where((e) => e.localId == localId).map((e) => e.toEntity());

  @override
  Future<UserEntity?> getUserByLocalId(int localId) async =>
      (await userDao.getUserByLocalId(localId))?.toEntity();

  @override
  Future<UserEntity?> getPreviousUser() async =>
      (await userDao.getPreviousUser())?.toEntity();

  @override
  Future<void> deleteLocalUser(int localId) async =>
      userDao.deleteUser(localId);

  @override
  Future<int> cacheUser(UserData data) async {
    final userTableData = await userDao.getUserByRemoteId(data.id);
    logger.i(userTableData);
    if (userTableData != null) {
      await userDao.updateUser(
        UserTableCompanion(
          localId: Value(userTableData.localId),
          remoteId: Value(data.id),
          name: Value(data.name),
          email: Value(data.email),
          avatar: Value(data.avatar),
          updatedAt: Value(DateTime.now()),
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

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';
import 'package:taskit/features/auth/data/mapper/user_mapper.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

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
  Stream<UserEntity> watchUserByLocalId(int localId) => (userDao.watchById(
    localId,
  )).where((e) => e.localId == localId).map((e) => e.toEntity());

  @override
  Future<UserEntity?> getUserByLocalId(int localId) async =>
      (await userDao.findById(localId))?.toEntity();

  @override
  Future<UserEntity?> getPreviousUser() async =>
      (await userDao.findPrevious())?.toEntity();

  @override
  Future<void> deleteLocalUser(int localId) async => userDao.deleteOne(localId);

  @override
  Future<int> cacheUser(UserData data) async {
    final userTableData = await userDao.findByRemoteId(data.id);
    if (userTableData != null) {
      await userDao.updateOne(
        UserTableCompanion(
          localId: Value(userTableData.localId),
          remoteId: Value(data.id),
          name: Value(data.name),
          email: Value(data.email),
          avatar: Value(data.avatar),
          updatedAt: Value(DateTime.now().toUtc()),
        ),
      );
      return userTableData.localId;
    } else {
      return await userDao.insertOne(
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

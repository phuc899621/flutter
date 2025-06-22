import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/user/data/repo/iuser_repo.dart';
import 'package:taskit/features/user/data/source/local/iuser_local_source.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';
import 'package:taskit/features/user/domain/mapper/iuser_mapper.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';
import 'package:taskit/shared/mixin/dio_exception_mapper.dart';

import '../source/local/user_local_source.dart';

final userRepoProvider = Provider<IUserRepo>((ref) {
  final userLocalSource = ref.watch(userLocalSourceProvider);
  return UserRepo(userLocalSource);
});

class UserRepo with DioExceptionMapper implements IUserMapper, IUserRepo {
  final IUserLocalSource _iUserLocalSource;

  UserRepo(
    this._iUserLocalSource,
  );

  //region Mapper
  @override
  UserEntity toUserEntity(UserTableData data) => UserEntity(
        remoteId: data.remoteId,
        localId: data.localId,
        name: data.name,
        email: data.email,
        avatar: data.avatar,
      );

  @override
  UserTableData toUserTableData(UserEntity entity) => UserTableData(
        remoteId: entity.remoteId,
        localId: entity.localId,
        name: entity.name,
        email: entity.email,
        avatar: entity.avatar,
      );

  @override
  UserTableCompanion toUserTableCompanion(UserEntity entity) =>
      UserTableCompanion(
        remoteId: Value(entity.remoteId),
        localId: Value(entity.localId),
        name: Value(entity.name),
        email: Value(entity.email),
        avatar: Value(entity.avatar),
      );

  //endregion

  @override
  Future<int> getUserLocalId() => _iUserLocalSource.getUserLocalId();

  @override
  Future<UserEntity> getUser() async {
    final result = await _iUserLocalSource.getUser();
    return result == null
        ? UserEntity(
            localId: -1,
            remoteId: '',
            name: '',
            email: '',
            avatar: '',
          )
        : toUserEntity(result);
  }

  @override
  Stream<UserEntity> watchUser() =>
      _iUserLocalSource.watchUser().map(toUserEntity);
}

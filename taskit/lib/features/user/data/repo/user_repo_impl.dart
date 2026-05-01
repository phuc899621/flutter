import 'package:taskit/features/user/data/repo/user_repo.dart';
import 'package:taskit/features/user/data/source/local/user_local_source.dart';
import 'package:taskit/features/user/data/source/remote/user_api.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';
import 'package:taskit/shared/application/session_service.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../shared/data/mapper/result_mapper.dart';
import '../../../../shared/domain/entities/data_result.dart';

class UserRepoImpl with DioExceptionMapper implements UserRepo {
  final UserLocalSource _localSource;
  final UserApi _api;
  final SessionService _storage;

  UserRepoImpl(this._localSource, this._api, this._storage);

  @override
  Stream<UserEntity> watchUserByLocalId(int localId) =>
      _localSource.watchUserByLocalId(localId);

  @override
  Future<UserEntity?> getCurrentUser() => callSafe(() async {
    final userActiveId = _storage.getActiveUserId();
    if (userActiveId == null) return null;
    final user = await _localSource.getUserByLocalId(userActiveId);
    return user;
  }, errorMessage: "Failed to get current user");

  @override
  Future<UserEntity?> getPreviousUser() => callSafe(
    () => _localSource.getPreviousUser(),
    errorMessage: "Failed to get previous user",
  );

  @override
  Future<void> deleteLocalUser(int localId) => callSafe(() async {
    await _localSource.deleteLocalUser(localId);
  });

  @override
  Future<DataResult<UserEntity>> syncUser() => callSafe(() async {
    return callSafe(() async {
      final response = await _api.syncUser();
      logger.i(response);
      final userLocalId = await _localSource.cacheUser(response.data);
      await _storage.saveActiveUserId(userLocalId);
      return response.toResult(
        UserEntity(
          localId: userLocalId,
          remoteId: response.data.id,
          name: response.data.name,
          email: response.data.email,
          avatar: response.data.avatar,
        ),
      );
    });
  });
}

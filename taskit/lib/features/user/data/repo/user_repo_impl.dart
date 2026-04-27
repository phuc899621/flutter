import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/user/data/repo/user_repo.dart';
import 'package:taskit/features/user/data/source/local/user_local_source.dart';
import 'package:taskit/features/user/data/source/remote/user_api.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';
import 'package:taskit/shared/application/session_service.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';

import '../../../../shared/data/mapper/result_mapper.dart';
import '../../../../shared/domain/entities/data_result.dart';
import '../../../auth/data/mapper/user_mapper.dart';
import '../source/local/user_local_source_impl.dart';

final userRepoProvider = Provider<UserRepo>((ref) {
  final userLocalSource = ref.watch(userLocalSourceProvider);
  final userApi = ref.watch(userApiProvider);
  final storage = ref.watch(sessionServiceProvider);
  return UserRepoImpl(userLocalSource, userApi, storage);
});

class UserRepoImpl with DioExceptionMapper implements UserRepo {
  final UserLocalSource _localSource;
  final UserApi _api;
  final SessionService _storage;

  UserRepoImpl(this._localSource, this._api, this._storage);

  @override
  Stream<UserEntity> watchUserByLocalId(int localId) =>
      _localSource.watchUserByLocalId(localId).map((e) => e.toEntity());

  @override
  Future<UserEntity?> getCurrentUser() => callSafe(() async {
    final userActiveId = await _storage.getActiveUserId();
    if (userActiveId == null) return null;
    final user = await _localSource.getUserByLocalId(userActiveId);
    return user?.toEntity();
  }, errorMessage: "Failed to get current user");

  @override
  Future<DataResult<UserEntity>> syncUser() => callSafe(() async {
    return callSafe(() async {
      final response = await _api.syncUser();
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

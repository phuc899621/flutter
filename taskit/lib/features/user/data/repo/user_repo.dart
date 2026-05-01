import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/user/data/repo/user_repo_impl.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';

import '../../../../shared/application/session_service.dart';
import '../../../../shared/domain/entities/data_result.dart';
import '../source/local/user_local_source_impl.dart';
import '../source/remote/user_api.dart';

final userRepoProvider = Provider<UserRepo>((ref) {
  final userLocalSource = ref.watch(userLocalSourceProvider);
  final userApi = ref.watch(userApiProvider);
  final storage = ref.watch(sessionServiceProvider);
  return UserRepoImpl(userLocalSource, userApi, storage);
});

abstract interface class UserRepo {
  Stream<UserEntity> watchUserByLocalId(int localId);

  Future<DataResult<UserEntity>> syncUser();

  Future<UserEntity?> getCurrentUser();

  Future<UserEntity?> getPreviousUser();

  Future<void> deleteLocalUser(int localId);
}

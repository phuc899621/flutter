import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/user/data/repo/iuser_repo.dart';
import 'package:taskit/features/user/data/source/local/iuser_local_source.dart';
import 'package:taskit/features/user/domain/mapper/iuser_mapper.dart';
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

  @override
  Future<int> getUserLocalId() {
    return _iUserLocalSource.getUserLocalId();
  }
}

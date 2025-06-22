import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/user/application/iuser_service.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';

import '../data/repo/iuser_repo.dart';
import '../data/repo/user_repo.dart';

final userServiceProvider = Provider<IUserService>((ref) {
  final userRepo = ref.watch(userRepoProvider);
  return UserService(userRepo);
});

class UserService implements IUserService {
  final IUserRepo _iUserRepo;

  UserService(this._iUserRepo);

  @override
  Stream<UserEntity> watchUser() => _iUserRepo.watchUser();

  @override
  Future<int> getUserLocalId() => _iUserRepo.getUserLocalId();

  @override
  Future<UserEntity> getUser() => _iUserRepo.getUser();
}

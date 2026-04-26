import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/domain/usecase/stream_usecase.dart';

import '../../../auth/presentation/auth/controller/auth_controller.dart';
import '../../data/repo/user_repo.dart';
import '../../data/repo/user_repo_impl.dart';
import '../entity/user_entity.dart';

final watchUserByLocalIdUseCaseProvider = Provider<WatchUserByLocalIdUseCase>(
  (ref) => WatchUserByLocalIdUseCase(ref.read(userRepoProvider)),
);

final currentUserProvider = StreamProvider.autoDispose<UserEntity?>((ref) {
  final activeUser = ref.watch(
    authControllerProvider.select((value) => value.user),
  );
  if (activeUser == null) {
    return Stream.value(null);
  }
  return ref.watch(watchUserByLocalIdUseCaseProvider).call(activeUser.localId);
});

class WatchUserByLocalIdUseCase extends StreamUseCase<UserEntity?, int> {
  final UserRepo _userRepo;

  WatchUserByLocalIdUseCase(this._userRepo);

  @override
  Stream<UserEntity?> call(int params) => _userRepo.watchUserByLocalId(params);
}

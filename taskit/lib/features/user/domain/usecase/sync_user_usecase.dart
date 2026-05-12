import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/user/data/repo/user_repo.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../entity/user_entity.dart';

final syncUserUseCaseProvider = Provider<SyncUserUseCase>(
  (ref) => SyncUserUseCase(ref.read(userRepoProvider)),
);

class SyncUserUseCase extends FutureUseCase<UserEntity, NoParam> {
  final UserRepo _userRepo;

  SyncUserUseCase(this._userRepo);

  @override
  Future<Result<UserEntity, Failure>> call(NoParam params) =>
      runSafe(() async => (await _userRepo.syncUser()).data);
}

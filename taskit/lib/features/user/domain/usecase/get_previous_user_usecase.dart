import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../shared/exception/failure.dart';
import '../../data/repo/user_repo.dart';
import '../entity/user_entity.dart';

final getPreviousUserUseCaseProvider = Provider<GetPreviousUserUseCase>((ref) {
  final userRepo = ref.watch(userRepoProvider);
  return GetPreviousUserUseCase(userRepo);
});

class GetPreviousUserUseCase extends FutureUseCase<UserEntity?, NoParam> {
  final UserRepo _userRepo;

  GetPreviousUserUseCase(this._userRepo);

  @override
  Future<Result<UserEntity?, Failure>> call(NoParam params) =>
      runSafe(() => _userRepo.getPreviousUser());
}

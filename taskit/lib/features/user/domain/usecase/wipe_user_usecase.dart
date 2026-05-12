import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';

import '../../../../shared/exception/failure.dart';
import '../../data/repo/user_repo.dart';

final wipeUserUseCaseProvider = Provider(
  (ref) => WipeUserUseCase(ref.watch(userRepoProvider)),
);

class WipeUserUseCase extends FutureUseCase<void, int> {
  final UserRepo _userRepo;

  WipeUserUseCase(this._userRepo);

  @override
  Future<Result<void, Failure>> call(int localId) => runSafe(() async {
    await _userRepo.deleteLocalUser(localId);
    return;
  });
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/shared/application/session_service.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';

import '../../../../shared/exception/failure.dart';
import '../../data/repo/user_repo.dart';

final wipeUserUseCaseProvider = Provider(
  (ref) => WipeUserUseCase(
    ref.watch(userRepoProvider),
    ref.watch(sessionServiceProvider),
  ),
);

class WipeUserUseCase extends FutureUseCase<void, int> {
  final UserRepo _userRepo;
  final SessionService _sessionService;

  WipeUserUseCase(this._userRepo, this._sessionService);

  @override
  Future<Result<void, Failure>> call(int localId) => runSafe(() async {
    await _userRepo.deleteLocalUser(localId);
    await _sessionService.deleteLastSyncTime();
    return;
  });
}

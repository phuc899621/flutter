import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/shared/application/session_service.dart';

import '../../../../../shared/application/credential_service.dart';
import '../../../../../shared/domain/usecase/usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../../user/domain/entity/user_entity.dart';
import '../../../../user/domain/usecase/get_current_user_usecase.dart';
import '../../../../user/domain/usecase/sync_user_usecase.dart';

final checkAuthStateUseCaseProvider = Provider(
  (ref) => CheckAuthStateUseCase(
    ref.watch(credentialServiceProvider),
    ref.watch(getCurrentUserUseCaseProvider),
    ref.watch(syncUserUseCaseProvider),
    ref.watch(sessionServiceProvider),
  ),
);

class CheckAuthStateUseCase extends UseCase<UserEntity?, NoParam> {
  final CredentialService _credentialService;
  final GetCurrentUserUseCase _getUser;
  final SyncUserUseCase _syncUser;
  final SessionService _sessionService;

  CheckAuthStateUseCase(
    this._credentialService,
    this._getUser,
    this._syncUser,
    this._sessionService,
  );

  @override
  Future<Result<UserEntity?, Failure>> call(NoParam params) async =>
      runSafe(() async {
        final refreshToken = await _credentialService.getRefreshToken();
        if (refreshToken == null) return null;

        final localUserResult = await _getUser.call(NoParam());
        UserEntity? localUser;
        localUserResult.when((u) => localUser = u, (_) => localUser = null);
        if (localUser != null) {
          _sessionService.saveActiveUserId(localUser!.localId);
          _syncUser.call(NoParam());
          return localUser;
        }
        final syncResult = await _syncUser.call(NoParam());
        return syncResult.when((u) => u, (failure) => null);
      });
}

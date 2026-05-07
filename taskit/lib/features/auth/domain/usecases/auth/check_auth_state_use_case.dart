import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/shared/application/session_service.dart';
import 'package:taskit/shared/extension/result_return.dart';

import '../../../../../shared/application/credential_service.dart';
import '../../../../../shared/domain/usecase/usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../../../shared/log/logger_provider.dart';
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
  Future<Result<UserEntity?, Failure>> call(
    NoParam params,
  ) async => runSafe(() async {
    logger.i('[CheckAuthStateUseCase] Starting check auth state process');
    final refreshToken = await _credentialService.getRefreshToken();
    if (refreshToken == null) {
      logger.i('[CheckAuthStateUseCase] No refresh token found');
      return null;
    }
    logger.d(
      '[CheckAuthStateUseCase] Refresh token found: $refreshToken, checking user profile...',
    );

    final localUserResult = await _getUser.call(NoParam());
    final localUser = localUserResult.dataOrNull();
    if (localUser != null) {
      logger.d(
        '[CheckAuthStateUseCase] User local profile found: ${localUser.localId}',
      );
      _sessionService.saveActiveUserId(localUser.localId);
      _syncUser.call(NoParam());
      return localUser;
    }
    logger.d(
      '[CheckAuthStateUseCase] User local profile not found, syncing...',
    );
    final syncResult = await _syncUser.call(NoParam());
    return syncResult.dataOrNull();
  });
}

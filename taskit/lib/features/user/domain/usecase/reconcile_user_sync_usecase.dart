import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/category/application/category_sync_service.dart';
import 'package:taskit/features/user/domain/params/reconcile_user_param.dart';
import 'package:taskit/features/user/domain/usecase/wipe_user_usecase.dart';

import '../../../../shared/domain/usecase/usecase.dart';
import '../../../../shared/exception/failure.dart';
import '../../../../shared/log/logger_provider.dart';

final reconcileUserSyncUseCaseProvider = Provider<ReconcileUserSyncUseCase>((
  ref,
) {
  final syncCategories = ref.watch(categorySyncServiceProvider);
  final wipeUser = ref.read(wipeUserUseCaseProvider);
  return ReconcileUserSyncUseCase(syncCategories, wipeUser);
});

class ReconcileUserSyncUseCase extends UseCase<void, ReconcileUserParam> {
  final CategorySyncService _syncCategories;
  final WipeUserUseCase _wipeUser;

  ReconcileUserSyncUseCase(this._syncCategories, this._wipeUser);

  @override
  Future<Result<void, Failure>> call(
    ReconcileUserParam param,
  ) => runSafe(() async {
    {
      logger.i('[ReconcileUserSync] Starting reconcileUser process');
      final oldUser = param.oldUser;
      final newUser = param.newUser;
      logger.i('[ReconcileUserSync] oldUser: $oldUser, newUser: $newUser');
      if (oldUser != null) {
        if (oldUser.remoteId != newUser.remoteId) {
          await _wipeUser.call(oldUser.localId);
          logger.i('[ReconcileUserSync] User wiped: ${oldUser.localId}');
        } else {
          logger.i(
            '[ReconcileUserSync] User not wiped: ${newUser.localId}. Calling sync data',
          );
          await _syncCategories.syncAll(newUser.localId);

          logger.i('[ReconcileUserSync] Categories pushed: ${newUser.localId}');
        }
      }
    }
  });
}

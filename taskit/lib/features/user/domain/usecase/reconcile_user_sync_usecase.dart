import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/category/application/category_sync_service.dart';
import 'package:taskit/features/task/application/task_sync_service.dart';
import 'package:taskit/features/user/domain/params/reconcile_user_param.dart';
import 'package:taskit/features/user/domain/usecase/wipe_user_usecase.dart';
import 'package:taskit/shared/application/session_service.dart';

import '../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../shared/exception/failure.dart';
import '../../../../shared/log/logger_provider.dart';

final reconcileUserSyncUseCaseProvider = Provider<ReconcileUserSyncUseCase>((
  ref,
) {
  final syncCategories = ref.watch(categorySyncServiceProvider);
  final syncTasks = ref.watch(taskSyncServiceProvider);
  final wipeUser = ref.read(wipeUserUseCaseProvider);
  final sessionService = ref.read(sessionServiceProvider);
  return ReconcileUserSyncUseCase(
    syncCategories,
    syncTasks,
    wipeUser,
    sessionService,
  );
});

class ReconcileUserSyncUseCase extends FutureUseCase<void, ReconcileUserParam> {
  final CategorySyncService _syncCategories;
  final TaskSyncService _syncTasks;
  final WipeUserUseCase _wipeUser;
  final SessionService _sessionService;

  ReconcileUserSyncUseCase(
    this._syncCategories,
    this._syncTasks,
    this._wipeUser,
    this._sessionService,
  );

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
          await _syncTasks.syncAll(newUser.localId);
          _sessionService.saveLastSyncTime(
            DateTime.now().toUtc().toIso8601String(),
          );
          logger.i('[ReconcileUserSync] Categories pushed: ${newUser.localId}');
        }
      } else {
        await _sessionService.deleteLastSyncTime();
      }
    }
  });
}

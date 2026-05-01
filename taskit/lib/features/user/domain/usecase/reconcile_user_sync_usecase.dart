import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/user/domain/params/reconcile_user_param.dart';
import 'package:taskit/features/user/domain/usecase/wipe_user_usecase.dart';

import '../../../../shared/domain/usecase/usecase.dart';
import '../../../../shared/exception/failure.dart';
import '../../../../shared/log/logger_provider.dart';
import '../../../category/domain/usecases/push_unsynced_categories_usecase.dart';

final reconcileUserSyncUseCaseProvider = Provider<ReconcileUserSyncUseCase>((
  ref,
) {
  final pushCategories = ref.read(pushUnsyncedCategoriesUseCaseProvider);
  final wipeUser = ref.read(wipeUserUseCaseProvider);
  return ReconcileUserSyncUseCase(pushCategories, wipeUser);
});

class ReconcileUserSyncUseCase extends UseCase<void, ReconcileUserParam> {
  final PushUnsyncedCategoriesUseCase _pushCategories;
  final WipeUserUseCase _wipeUser;

  ReconcileUserSyncUseCase(this._pushCategories, this._wipeUser);

  @override
  Future<Result<void, Failure>> call(ReconcileUserParam param) =>
      runSafe(() async {
        {
          logger.i('ReconcileUser call');
          final oldUser = param.oldUser;
          final newUser = param.newUser;
          logger.i('previousUser $oldUser');
          logger.i('newUser $newUser');
          if (oldUser != null) {
            if (oldUser.remoteId != newUser.remoteId) {
              await _wipeUser.call(oldUser.localId);
              logger.i('WipeUSer');
            } else {
              logger.i('PushCategories');
              await _pushCategories.call(newUser.localId);
            }
          }
        }
      });
}

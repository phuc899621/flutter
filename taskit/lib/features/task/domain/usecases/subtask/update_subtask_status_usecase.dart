import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/task/data/repo/subtask_repo.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/features/user/domain/usecase/get_current_user_usecase.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/extension/result_return.dart';

import '../../../../../shared/exception/failure.dart';

final updateSubtaskStatusUseCaseProvider = Provider<UpdateSubtaskStatusUseCase>(
  (ref) => UpdateSubtaskStatusUseCase(
    ref.watch(subtaskRepoProvider),
    ref.watch(getCurrentUserUseCaseProvider),
  ),
);

class UpdateSubtaskStatusUseCase extends FutureUseCase<void, SubtaskEntity> {
  final SubtaskRepo _repo;
  final GetCurrentUserUseCase _getCurrentUser;

  UpdateSubtaskStatusUseCase(this._repo, this._getCurrentUser);

  @override
  Future<Result<void, Failure>> call(SubtaskEntity params) => runSafe(() async {
    final getCurrentUser = await _getCurrentUser.call(NoParam());
    final currentUser = getCurrentUser.dataOrNull();
    if (currentUser == null) return;
    final oldEntity = params;
    final newEntity = params.copyWith(
      completed: !oldEntity.completed,
      completedAt: oldEntity.completed ? null : DateTime.now().toUtc(),
    );
    return await _repo.updateSubtask(
      SubtaskUpdateField.completed,
      currentUser.localId,
      newEntity,
    );
  });
}

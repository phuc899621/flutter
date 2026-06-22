import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/task/data/repo/subtask_repo.dart';
import 'package:taskit/features/user/domain/usecase/get_current_user_usecase.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/extension/result_return.dart';

import '../../../../../shared/exception/failure.dart';
import '../../entities/subtask_entity.dart';

final deleteSubtaskUseCaseProvider = Provider<DeleteSubtaskUseCase>((ref) {
  final subtaskRepo = ref.watch(subtaskRepoProvider);
  final getCurrentUser = ref.watch(getCurrentUserUseCaseProvider);
  return DeleteSubtaskUseCase(subtaskRepo, getCurrentUser);
});

class DeleteSubtaskUseCase extends FutureUseCase<void, SubtaskEntity> {
  final SubtaskRepo _repo;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  DeleteSubtaskUseCase(this._repo, this._getCurrentUserUseCase);

  @override
  Future<Result<void, Failure>> call(SubtaskEntity params) => runSafe(() async {
    final getCurrentUser = await _getCurrentUserUseCase.call(NoParam());
    final currentUser = getCurrentUser.dataOrNull();
    if (currentUser == null) return;
    return await _repo.deleteSubtask(currentUser.localId, params);
  });
}

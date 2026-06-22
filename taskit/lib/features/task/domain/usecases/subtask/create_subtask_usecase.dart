import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/user/domain/usecase/get_current_user_usecase.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/extension/result_return.dart';

import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/subtask_repo.dart';
import '../../entities/subtask_entity.dart';

final createSubtaskUseCaseProvider = Provider<CreateSubtaskUseCase>((ref) {
  final subtaskRepo = ref.watch(subtaskRepoProvider);
  final getCurrentUser = ref.watch(getCurrentUserUseCaseProvider);
  return CreateSubtaskUseCase(subtaskRepo, getCurrentUser);
});

class CreateSubtaskUseCase extends FutureUseCase<void, SubtaskEntity> {
  final SubtaskRepo _repo;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  CreateSubtaskUseCase(this._repo, this._getCurrentUserUseCase);

  @override
  Future<Result<void, Failure>> call(SubtaskEntity params) => runSafe(() async {
    final getCurrentUser = await _getCurrentUserUseCase.call(NoParam());
    final currentUser = getCurrentUser.dataOrNull();
    if (currentUser == null) return;
    await _repo.insertSubtask(params, currentUser.localId);
  });
}

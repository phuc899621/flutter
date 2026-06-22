import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/user/domain/usecase/get_current_user_usecase.dart';

import '../../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../../../shared/extension/result_return.dart';
import '../../../data/repo/task_repo.dart';

final createAiTaskUseCaseProvider = Provider<CreateAiTaskUseCase>((ref) {
  final taskRepo = ref.watch(taskRepoProvider);
  final currentUser = ref.watch(getCurrentUserUseCaseProvider);
  return CreateAiTaskUseCase(taskRepo, currentUser);
});

class CreateAiTaskUseCase extends FutureUseCase<void, String> {
  final TaskRepo _repo;
  final GetCurrentUserUseCase _currentUserUseCase;

  CreateAiTaskUseCase(this._repo, this._currentUserUseCase);

  @override
  Future<Result<void, Failure>> call(String text) => runSafe(() async {
    final getCurrentUser = await _currentUserUseCase.call(NoParam());
    final currentUser = getCurrentUser.dataOrNull();
    if (currentUser == null) return;
    final offset = DateTime.now().timeZoneOffset;
    final sign = offset.isNegative ? '-' : '+';
    final utcOffset = '$sign$offset';
    return await _repo.generateAiTask(text, utcOffset, currentUser.localId);
  });
}

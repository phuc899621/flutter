import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';

import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/task_repo.dart';
import '../../entities/task_entity.dart';

final createTaskUseCaseProvider = Provider<CreateTaskUseCase>((ref) {
  final taskRepo = ref.watch(taskRepoProvider);
  return CreateTaskUseCase(taskRepo);
});

class CreateTaskUseCase extends FutureUseCase<void, TaskEntity> {
  final TaskRepo _repo;

  CreateTaskUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(TaskEntity params) => runSafe(() async {
    await _repo.insertTask(params);
  });
}

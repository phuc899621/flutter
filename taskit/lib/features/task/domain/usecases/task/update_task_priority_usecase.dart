import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/task/data/repo/task_repo.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';

import '../../../../../shared/exception/failure.dart';

final updateTaskPriorityUseCaseProvider = Provider<UpdateTaskPriorityUseCase>(
  (ref) => UpdateTaskPriorityUseCase(ref.watch(taskRepoProvider)),
);

class UpdateTaskPriorityUseCase extends FutureUseCase<void, TaskEntity> {
  final TaskRepo _repo;

  UpdateTaskPriorityUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(TaskEntity params) =>
      runSafe(() => _repo.updateTask(TaskUpdateField.priority, params));
}

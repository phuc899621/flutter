import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/task/data/repo/task_repo.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';

import '../../../../../shared/exception/failure.dart';

final updateTaskDueDateUseCaseProvider = Provider<UpdateTaskDueDateUseCase>(
  (ref) => UpdateTaskDueDateUseCase(ref.watch(taskRepoProvider)),
);

class UpdateTaskDueDateUseCase extends FutureUseCase<void, TaskEntity> {
  final TaskRepo _repo;

  UpdateTaskDueDateUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(TaskEntity params) =>
      runSafe(() => _repo.updateTask(TaskUpdateField.dueDate, params));
}

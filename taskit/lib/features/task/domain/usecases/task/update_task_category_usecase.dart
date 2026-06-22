import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/task/data/repo/task_repo.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';

import '../../../../../shared/exception/failure.dart';

final updateTaskCategoryUseCaseProvider = Provider<UpdateTaskCategoryUseCase>(
  (ref) => UpdateTaskCategoryUseCase(ref.watch(taskRepoProvider)),
);

class UpdateTaskCategoryUseCase extends FutureUseCase<void, TaskEntity> {
  final TaskRepo _repo;

  UpdateTaskCategoryUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(TaskEntity params) =>
      runSafe(() => _repo.updateTask(TaskUpdateField.category, params));
}

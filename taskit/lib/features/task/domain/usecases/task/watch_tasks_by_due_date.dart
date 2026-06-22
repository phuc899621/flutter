import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/repo/task_repo.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/domain/usecase/stream_usecase.dart';

final watchTasksByDueDateUseCaseProvider = Provider((ref) {
  final taskRepo = ref.watch(taskRepoProvider);
  return WatchTasksByDueDateUseCase(taskRepo);
});

class WatchTasksByDueDateUseCase
    extends StreamUseCase<List<TaskEntity>, WatchTasksByDueDateParam> {
  final TaskRepo _repo;

  WatchTasksByDueDateUseCase(this._repo);

  @override
  Stream<List<TaskEntity>> call(WatchTasksByDueDateParam params) =>
      _repo.watchTasksByDueDate(params.dueDate, params.userLocalId);
}

class WatchTasksByDueDateParam {
  final int userLocalId;
  DateTime? dueDate;

  WatchTasksByDueDateParam({required this.userLocalId, this.dueDate});
}

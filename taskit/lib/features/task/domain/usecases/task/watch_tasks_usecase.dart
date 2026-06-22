import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/repo/task_repo.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/domain/usecase/stream_usecase.dart';

import '../../../data/repo/task_repo_impl.dart';

final watchTasksUseCaseProvider = Provider((ref) {
  final taskRepo = ref.watch(taskRepoProvider);
  return WatchTasksUseCase(taskRepo);
});

class WatchTasksUseCase
    extends StreamUseCase<List<TaskEntity>, WatchTasksParam> {
  final TaskRepo _repo;

  WatchTasksUseCase(this._repo);

  @override
  Stream<List<TaskEntity>> call(WatchTasksParam params) =>
      _repo.watchTasks(params.userLocalId, params.filter);
}

class WatchTasksParam {
  final int userLocalId;
  final TaskFilter filter;

  WatchTasksParam({required this.userLocalId, required this.filter});
}

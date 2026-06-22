import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/repo/task_repo.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/domain/usecase/stream_usecase.dart';

final watchTaskByLocalIdUseCaseProvider = Provider((ref) {
  final taskRepo = ref.watch(taskRepoProvider);
  return WatchTaskByLocalIdUseCase(taskRepo);
});

class WatchTaskByLocalIdUseCase
    extends StreamUseCase<TaskEntity?, WatchTaskByLocalIdParam> {
  final TaskRepo _repo;

  WatchTaskByLocalIdUseCase(this._repo);

  @override
  Stream<TaskEntity?> call(WatchTaskByLocalIdParam params) =>
      _repo.watchTaskByLocalId(params.localId, params.userLocalId);
}

class WatchTaskByLocalIdParam {
  final int userLocalId;
  final int localId;

  WatchTaskByLocalIdParam({required this.userLocalId, required this.localId});
}

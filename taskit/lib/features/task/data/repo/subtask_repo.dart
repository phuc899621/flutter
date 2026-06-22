import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/repo/subtask_repo_impl.dart';
import 'package:taskit/features/task/data/source/local/subtask/subtask_local_source.dart';
import 'package:taskit/features/task/data/source/local/task/task_local_source.dart';
import 'package:taskit/features/task/data/source/remote/subtask_api.dart';
import 'package:taskit/features/task/data/source/remote/task_api.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';

final subtaskRepoProvider = Provider<SubtaskRepo>((ref) {
  final taskLocalSource = ref.watch(taskLocalSourceProvider);
  final subtaskLocalSource = ref.watch(subtaskLocalSourceProvider);
  final taskApi = ref.watch(taskApiProvider);
  final subtaskApi = ref.watch(subtaskApiProvider);
  return SubtaskRepoImpl(
    taskLocalSource,
    subtaskLocalSource,
    taskApi,
    subtaskApi,
  );
});

abstract class SubtaskRepo {
  Future<void> insertSubtask(SubtaskEntity entity, int userLocalId);

  Future<void> updateSubtask(
    SubtaskUpdateField field,
    int userLocalId,
    SubtaskEntity subtask,
  );

  Future<void> deleteSubtask(int userLocalId, SubtaskEntity subtask);
}

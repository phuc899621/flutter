import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/source/local/subtask/subtask.dart';
import 'package:taskit/features/task/data/source/local/subtask/subtask_local_source_impl.dart';
import 'package:taskit/features/task/data/source/local/task/task.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

final subtaskLocalSourceProvider = Provider<SubtaskLocalSource>((ref) {
  final subtaskDao = ref.watch(subtaskDaoProvider);
  final taskDao = ref.watch(taskDaoProvider);
  final db = ref.watch(appDatabaseProvider);
  return SubtaskLocalSourceImpl(db, taskDao, subtaskDao);
});

abstract class SubtaskLocalSource {
  Future<List<SubtaskEntity>> getSubtasksByTaskId(int taskId);

  Future<SubtaskEntity?> getSubtaskByLocalId(int id);

  Future<int> insertSubtask(SubtaskEntity subtask, int userLocalId);

  Future<void> markSubtasksAsSynced(List<int> ids);

  Future<void> markSubtaskAsSynced(int localId);

  Future<void> markInsertSubtasksAsSynced(
    List<(int localId, String remoteId)> ids,
  );

  Future<void> markSubtasksAsSyncedByTaskId(int taskLocalId);

  Future<void> markSubtaskAsDeleted(int localId);

  Future<void> updateSubtask(SubtaskUpdateField field, SubtaskEntity subtask);

  Future<void> deleteSubtask(int localId);
}

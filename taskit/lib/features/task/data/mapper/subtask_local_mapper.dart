import 'package:drift/drift.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

extension SubtaskEntityLocalMapper on SubtaskEntity {
  SubtaskTableCompanion toInsertCompanion(int taskLocalId) =>
      SubtaskTableCompanion(
        title: Value(title),
        completed: Value(completed),
        taskLocalId: Value(taskLocalId),
        synced: Value(synced),
      );
}

extension SubtaskTableDataMapper on SubtaskTableData {
  SubtaskEntity toEntity() => SubtaskEntity(
    localId: localId,
    remoteId: remoteId,
    title: title,
    deleted: deleted,
    completed: completed,
    synced: synced,
    completedAt: completedAt?.toUtc(),
    taskLocalId: taskLocalId,
    createdAt: createdAt.toUtc(),
    updatedAt: updatedAt.toUtc(),
  );
}

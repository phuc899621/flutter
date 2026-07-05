import 'package:drift/drift.dart';
import 'package:taskit/features/category/data/mapper/category_local_mapper.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/features/task/data/mapper/subtask_local_mapper.dart';
import 'package:taskit/features/task/data/source/local/task/task.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../../domain/entities/subtask_entity.dart';

extension TaskEntityLocalMapper on TaskEntity {
  TaskTableCompanion toInsertCompanion() => TaskTableCompanion(
    title: Value(title),
    description: Value(description),
    categoryLocalId: Value(category.localId),
    priority: Value(priority.name),
    userLocalId: Value(userLocalId),
    reminderAt: Value(reminderAt),
    status: Value(status.name),
    dueDate: Value(dueDate?.toUtc()),
    hasTime: Value(hasTime),
    synced: Value(synced),
  );

  TaskTableCompanion toReconcileCompanion(
    int userLocalId,
    DateTime updatedAt,
    int categoryLocalId,
  ) => TaskTableCompanion(
    remoteId: Value(remoteId),
    synced: const Value(true),
    title: Value(title),
    description: Value(description),
    userLocalId: Value(userLocalId),
    categoryLocalId: Value(categoryLocalId),
    priority: Value(priority.name),
    deleted: Value(deleted),
    reminderAt: Value(reminderAt),
    status: Value(status.name),
    dueDate: Value(dueDate?.toUtc()),
    hasTime: Value(hasTime),
    completedAt: Value(completedAt?.toUtc()),
    updatedAt: Value(updatedAt),
  );
}

extension TaskTableDataMapper on TaskTableData {
  TaskEntity toEntity({
    required CategoryEntity category,
    required List<SubtaskEntity> subtasks,
  }) => TaskEntity(
    localId: localId,
    remoteId: remoteId,
    title: title,
    description: description,
    deleted: deleted,
    category: category,
    priority: TaskPriority.fromString(priority),
    userLocalId: userLocalId,
    reminderAt: reminderAt,
    synced: synced,
    status: completedAt != null
        ? TaskStatus.completed
        : (dueDate == null ? TaskStatus.pending : TaskStatus.scheduled),
    dueDate: dueDate?.toUtc(),
    completedAt: completedAt?.toUtc(),
    hasTime: hasTime,
    subtasks: subtasks,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension TaskDetailMapper on TaskDetailTableData {
  TaskEntity toEntity() => TaskEntity(
    deleted: data.deleted,
    localId: data.localId,
    remoteId: data.remoteId,
    title: data.title,
    description: data.description,
    category: category.toEntity(),
    priority: TaskPriority.fromString(data.priority),
    userLocalId: data.userLocalId,
    reminderAt: data.reminderAt?.toLocal(),
    reminderType: data.reminderType,
    reminderOffset: data.reminderOffset,
    repeatType: data.repeatType,
    synced: data.synced,
    status: data.completedAt != null
        ? TaskStatus.completed
        : (data.dueDate == null ? TaskStatus.pending : TaskStatus.scheduled),
    dueDate: data.dueDate?.toLocal(),
    completedAt: data.completedAt?.toLocal(),
    hasTime: data.hasTime,
    subtasks: subtasks.map((s) => s.toEntity()).toList(),
    createdAt: data.createdAt,
    updatedAt: data.updatedAt,
  );
}

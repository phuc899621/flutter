import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/shared/config/app/theme/app_color.dart';
import 'package:taskit/shared/log/logger_provider.dart';

part 'task_entity.freezed.dart';

@freezed
abstract class TaskEntity with _$TaskEntity {
  const TaskEntity._();

  const factory TaskEntity({
    required int localId,
    String? remoteId,
    required String title,
    required String description,
    required CategoryEntity category,
    required TaskPriority priority,
    required int userLocalId,
    required bool synced,
    required bool deleted,
    DateTime? reminderAt,
    int? reminderOffset,
    @Default(TaskReminderType.none) TaskReminderType reminderType,
    @Default(ReminderRepeatType.none) ReminderRepeatType repeatType,
    DateTime? completedAt,
    required TaskStatus status,
    DateTime? dueDate,
    required bool hasTime,
    required List<SubtaskEntity> subtasks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskEntity;

  factory TaskEntity.empty() => TaskEntity(
    localId: -1,
    title: '',
    description: '',
    category: CategoryEntity.empty(),
    userLocalId: -1,
    synced: false,
    deleted: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    priority: TaskPriority.none,
    status: TaskStatus.pending,
    reminderAt: null,
    reminderOffset: null,
    reminderType: TaskReminderType.none,
    repeatType: ReminderRepeatType.none,
    hasTime: false,
    subtasks: [],
  );

  factory TaskEntity.insert({
    required String title,
    String description = '',
    required CategoryEntity category,
    required TaskPriority priority,
    required int userLocalId,
    DateTime? dueDate,
    DateTime? reminderAt,
    int? reminderOffset,
    @Default(ReminderRepeatType.none) required ReminderRepeatType repeatType,
    @Default(TaskReminderType.none) required TaskReminderType reminderType,
    required bool hasTime,
    required List<SubtaskEntity> subtasks,
  }) => TaskEntity(
    deleted: false,
    remoteId: null,
    localId: -1,
    title: title,
    description: description,
    category: category,
    dueDate: dueDate,
    priority: priority,
    userLocalId: userLocalId,
    reminderAt: reminderAt,
    reminderOffset: reminderOffset,
    reminderType: reminderType,
    repeatType: repeatType,
    synced: false,
    status: dueDate == null ? TaskStatus.pending : TaskStatus.scheduled,
    hasTime: hasTime,
    subtasks: subtasks,
    createdAt: DateTime.now().toUtc(),
    updatedAt: DateTime.now().toUtc(),
  );
}

enum TaskStatus {
  completed,
  pending,
  scheduled;

  static TaskStatus fromString(String name) =>
      values.firstWhere((e) => e.name == name);
}

enum TaskUpdateField {
  title,
  description,
  dueDate,
  priority,
  status,
  category,
  reminder,
}

enum TaskReminderType { none, beforeDeadline, custom }

extension TaskReminderTypeExtension on TaskReminderType {
  String get label {
    switch (this) {
      case TaskReminderType.none:
        return 'Not set';
      case TaskReminderType.beforeDeadline:
        return 'Before deadline';
      case TaskReminderType.custom:
        return 'Custom';
    }
  }

  String display({int? reminderOffset, DateTime? customDate}) {
    logger.i('[TaskEntity][DisplayTaskReminder] $reminderOffset $customDate');
    switch (this) {
      case TaskReminderType.none:
        return 'Not set';

      case TaskReminderType.beforeDeadline:
        if (reminderOffset == null) {
          return 'Before due date';
        }
        if (reminderOffset == 0) {
          return 'At deadline';
        }

        final duration = Duration(minutes: reminderOffset);

        final days = duration.inDays;
        final hours = duration.inHours % 24;
        final minutes = duration.inMinutes % 60;

        final parts = <String>[];

        if (days > 0) {
          parts.add('$days day${days > 1 ? 's' : ''}');
        }

        if (hours > 0) {
          parts.add('$hours hour${hours > 1 ? 's' : ''}');
        }

        if (minutes > 0) {
          parts.add('$minutes minute${minutes > 1 ? 's' : ''}');
        }

        return '${parts.join(' ')} before due date';

      case TaskReminderType.custom:
        if (customDate == null) {
          return 'Specific date';
        }

        return DateFormat('h:mm a dd/MM/yyyy').format(customDate);
    }
  }
}

enum ReminderRepeatType { none, daily, weekly, monthly }

extension ReminderRepeatTypeExtension on ReminderRepeatType {
  String get display {
    switch (this) {
      case ReminderRepeatType.none:
        return 'No repeat';

      case ReminderRepeatType.daily:
        return 'Repeat daily';

      case ReminderRepeatType.weekly:
        return 'Repeat weekly';

      case ReminderRepeatType.monthly:
        return 'Repeat monthly';
    }
  }
}

enum TaskPriority {
  none,
  low,
  medium,
  high;

  static TaskPriority fromString(String name) =>
      values.firstWhere((e) => e.name == name);

  Color get color {
    switch (this) {
      case TaskPriority.none:
        return AppColor.noneContainer;

      case TaskPriority.low:
        return AppColor.lowContainer;

      case TaskPriority.medium:
        return AppColor.mediumContainer;

      case TaskPriority.high:
        return AppColor.highContainer;
    }
  }

  Color get textColor {
    switch (this) {
      case TaskPriority.high:
        return AppColor.onHighContainer;
      case TaskPriority.low:
        return AppColor.onLowContainer;
      case TaskPriority.medium:
        return AppColor.onMediumContainer;
      default:
        return AppColor.onNoneContainer;
    }
  }
}

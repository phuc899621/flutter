import 'package:flutter/material.dart';

import '../../config/app/app_color.dart';
import '../../features/task/domain/entities/task_priority_enum.dart';
import '../../features/task/domain/entities/task_status_enum.dart';

extension TaskPriorityColor on TaskPriority {
  Color toColor() {
    switch (this) {
      case TaskPriority.high:
        return ConstColor.onHighContainer;
      case TaskPriority.medium:
        return ConstColor.onMediumContainer;
      case TaskPriority.low:
        return ConstColor.onLowContainer;
      default:
        return ConstColor.onNoneContainer;
    }
  }

  Color toColorContainer() {
    switch (this) {
      case TaskPriority.high:
        return ConstColor.highContainer;
      case TaskPriority.medium:
        return ConstColor.mediumContainer;
      case TaskPriority.low:
        return ConstColor.lowContainer;
      default:
        return ConstColor.noneContainer;
    }
  }
}

extension TaskStatusColor on TaskStatus {
  Color toColor() {
    switch (this) {
      case TaskStatus.completed:
        return ConstColor.onCompletedContainer;
      case TaskStatus.pending:
        return ConstColor.onPendingContainer;
      case TaskStatus.scheduled:
        return ConstColor.onScheduledContainer;
    }
  }

  Color toColorContainer() {
    switch (this) {
      case TaskStatus.completed:
        return ConstColor.completedContainer;
      case TaskStatus.pending:
        return ConstColor.pendingContainer;
      case TaskStatus.scheduled:
        return ConstColor.scheduledContainer;
    }
  }
}

extension ThemeColor on ColorScheme {
  Color get highContainer => ConstColor.highContainer;

  Color get onHighContainer => ConstColor.onHighContainer;

  Color get mediumContainer => ConstColor.mediumContainer;

  Color get onMediumContainer => ConstColor.onMediumContainer;

  Color get lowContainer => ConstColor.lowContainer;

  Color get onLowContainer => ConstColor.onLowContainer;

  Color get noneContainer => ConstColor.noneContainer;

  Color get onNoneContainer => ConstColor.onNoneContainer;

  Color get scheduledContainer => ConstColor.scheduledContainer;

  Color get onScheduledContainer => ConstColor.onScheduledContainer;

  Color get pendingContainer => ConstColor.pendingContainer;

  Color get onPendingContainer => ConstColor.onPendingContainer;

  Color get completedContainer => ConstColor.completedContainer;

  Color get onCompletedContainer => ConstColor.onCompletedContainer;

  Color get success => ConstColor.success;

  Color get onSuccess => ConstColor.onSuccess;

  Color get warning => ConstColor.warning;

  Color get onWarning => ConstColor.onWarning;
}

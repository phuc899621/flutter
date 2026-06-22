import 'package:flutter/material.dart';

import '../../features/task/domain/entities/task_entity.dart';
import '../config/app/theme/app_color.dart';

extension TaskStatusColor on TaskStatus {
  Color toColor() {
    switch (this) {
      case TaskStatus.completed:
        return AppColor.onCompletedContainer;
      case TaskStatus.pending:
        return AppColor.onPendingContainer;
      case TaskStatus.scheduled:
        return AppColor.onScheduledContainer;
    }
  }

  Color toColorContainer() {
    switch (this) {
      case TaskStatus.completed:
        return AppColor.completedContainer;
      case TaskStatus.pending:
        return AppColor.pendingContainer;
      case TaskStatus.scheduled:
        return AppColor.scheduledContainer;
    }
  }
}

extension ThemeColor on ColorScheme {
  Color get highContainer => AppColor.highContainer;

  Color get onHighContainer => AppColor.onHighContainer;

  Color get mediumContainer => AppColor.mediumContainer;

  Color get onMediumContainer => AppColor.onMediumContainer;

  Color get lowContainer => AppColor.lowContainer;

  Color get onLowContainer => AppColor.onLowContainer;

  Color get noneContainer => AppColor.noneContainer;

  Color get onNoneContainer => AppColor.onNoneContainer;

  Color get scheduledContainer => AppColor.scheduledContainer;

  Color get onScheduledContainer => AppColor.onScheduledContainer;

  Color get pendingContainer => AppColor.pendingContainer;

  Color get onPendingContainer => AppColor.onPendingContainer;

  Color get completedContainer => AppColor.completedContainer;

  Color get onCompletedContainer => AppColor.onCompletedContainer;

  Color get success => AppColor.success;

  Color get onSuccess => AppColor.onSuccess;

  Color get warning => AppColor.warning;

  Color get onWarning => AppColor.onWarning;
}

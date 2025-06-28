import 'package:flutter/material.dart';
import 'package:taskit/features/task/domain/entities/task_status_enum.dart';

extension TaskStatusIcon on TaskStatus {
  IconData toIcon() {
    switch (this) {
      case TaskStatus.completed:
        return Icons.check_circle;
      case TaskStatus.pending:
        return Icons.hourglass_bottom;
      case TaskStatus.scheduled:
        return Icons.schedule_rounded;
    }
  }
}

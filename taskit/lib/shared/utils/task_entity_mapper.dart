import '../../features/task/domain/entities/task_priority_enum.dart';
import '../../features/task/domain/entities/task_status_enum.dart';

class TaskPriorityUtils {
  static const HIGH_PRIORITY = 'high';
  static const MEDIUM_PRIORITY = 'medium';
  static const LOW_PRIORITY = 'low';
  static const NONE_PRIORITY = 'none';

  static TaskPriority toEnum(String priority) {
    switch (priority) {
      case HIGH_PRIORITY:
        return TaskPriority.high;
      case MEDIUM_PRIORITY:
        return TaskPriority.medium;
      case LOW_PRIORITY:
        return TaskPriority.low;
      default:
        return TaskPriority.none;
    }
  }

  static String toPriority(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.high:
        return HIGH_PRIORITY;
      case TaskPriority.medium:
        return MEDIUM_PRIORITY;
      case TaskPriority.low:
        return LOW_PRIORITY;
      default:
        return NONE_PRIORITY;
    }
  }
}

class TaskStatusUtils {
  static const COMPLETED = 'completed';
  static const PENDING = 'pending';
  static const SCHEDULED = 'scheduled';
  static TaskStatus toEnum(String status) {
    switch (status) {
      case COMPLETED:
        return TaskStatus.completed;
      case PENDING:
        return TaskStatus.pending;
      case SCHEDULED:
        return TaskStatus.scheduled;
      default:
        return TaskStatus.pending;
    }
  }

  static String toStatus(TaskStatus status) {
    switch (status) {
      case TaskStatus.completed:
        return COMPLETED;
      case TaskStatus.pending:
        return PENDING;
      case TaskStatus.scheduled:
        return SCHEDULED;
    }
  }
}

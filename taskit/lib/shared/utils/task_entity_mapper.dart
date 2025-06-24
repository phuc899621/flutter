import '../../features/task/domain/entities/task_priority_enum.dart';
import '../../features/task/domain/entities/task_status_enum.dart';

class TaskPriorityUtils {
  static TaskPriority toEnum(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return TaskPriority.high;
      case 'medium':
        return TaskPriority.medium;
      case 'low':
        return TaskPriority.low;
      default:
        return TaskPriority.none;
    }
  }

  static String toPriority(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.high:
        return 'high';
      case TaskPriority.medium:
        return 'medium';
      case TaskPriority.low:
        return 'low';
      default:
        return 'none';
    }
  }
}

class TaskStatusUtils {
  static TaskStatus toEnum(String status) {
    switch (status) {
      case 'completed':
        return TaskStatus.completed;
      case 'pending':
        return TaskStatus.pending;
      default:
        return TaskStatus.scheduled;
    }
  }

  static String toStatus(TaskStatus status) {
    switch (status) {
      case TaskStatus.completed:
        return 'completed';
      case TaskStatus.pending:
        return 'pending';
      default:
        return 'scheduled';
    }
  }
}

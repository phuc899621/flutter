import 'package:taskit/features/task/domain/entities/task_entity.dart';

abstract interface class ITaskService {
  Stream<List<TaskEntity>> watchAllTasks();
  Stream<List<TaskEntity>> watchScheduledTasks();
}

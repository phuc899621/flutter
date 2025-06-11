import 'package:taskit/features/task/domain/entities/task_model.dart';

abstract interface class ITaskRepo {
  Stream<List<TaskEntity>> watchAllTasks();
  Stream<List<TaskEntity>> watchScheduledTasks();
}

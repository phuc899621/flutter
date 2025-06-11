import 'package:taskit/features/task/domain/entities/task_entity.dart';

abstract interface class ITaskRepo {
  Stream<List<TaskEntity>> watchAllTasks();
}

import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

abstract interface class ITaskMapper {
  List<TaskEntity> mapToListTaskEntity(
      List<TaskTableData> data, List<SubtaskTableData> subtasks);
}

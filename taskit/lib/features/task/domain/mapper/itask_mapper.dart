import 'package:taskit/features/task/domain/entities/task_model.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

abstract interface class ITaskMapper {
  List<TaskEntity> mapToTaskEntity(List<TaskTableData> data);
}

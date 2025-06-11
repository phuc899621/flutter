import 'package:taskit/shared/data/source/local/drift/database/database.dart';

abstract interface class ITaskLocalSource {
  Stream<List<TaskTableData>> watchAllTasks();
}

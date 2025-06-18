import 'package:drift/drift.dart';
import 'package:taskit/shared/data/source/local/drift/table/task.dart';

class SubtaskTable extends Table {
  @override
  String get tableName => 'subtask';

  IntColumn get localId => integer().autoIncrement()();

  TextColumn get remoteId => text().withDefault(const Constant(''))();

  TextColumn get title => text()();

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();

  IntColumn get taskLocalId =>
      integer().references(TaskTable, #localId, onDelete: KeyAction.cascade)();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

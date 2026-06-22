import 'package:drift/drift.dart';
import 'package:taskit/shared/data/source/local/drift/table/task.dart';

class SubtaskTable extends Table {
  @override
  String get tableName => 'subtask';

  IntColumn get localId => integer().autoIncrement()();

  TextColumn get remoteId =>
      text().nullable().withDefault(const Constant(null))();

  TextColumn get title => text()();

  BoolColumn get synced => boolean().withDefault(const Constant(false))();

  BoolColumn get completed => boolean().withDefault(const Constant(false))();

  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  IntColumn get taskLocalId =>
      integer().references(TaskTable, #localId, onDelete: KeyAction.cascade)();

  DateTimeColumn get completedAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

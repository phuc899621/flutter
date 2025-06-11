import 'package:drift/drift.dart';
import 'package:taskit/shared/data/source/local/drift/table/user.dart';

class TaskTable extends Table {
  @override
  String get tableName => 'task';
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get remoteId => text().withDefault(const Constant(''))();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get category => text().withDefault();
  BoolColumn get isSynced => boolean()();
  TextColumn get priority => text()();
  IntColumn get userLocalId =>
      integer().references(UserTable, #localId, onDelete: KeyAction.cascade)();
  TextColumn get status => text()();
  DateTimeColumn get scheduledDate => dateTime()();
  BoolColumn get hasScheduledTime => boolean()();
  DateTimeColumn get scheduledTime => dateTime()();
  TextColumn get type => text().();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

import 'package:drift/drift.dart';

class TaskTable extends Table {
  @override
  String get tableName => 'task';
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get remoteId => text().withDefault(const Constant(''))();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  BoolColumn get isSynced => boolean()();
  TextColumn get priority => text()();
  IntColumn get userLocalId => integer()
      .customConstraint('REFERENCES user(localId) ON DELETE CASCADE')();
  TextColumn get status => text()();
  DateTimeColumn get dueDate => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

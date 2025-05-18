import 'package:drift/drift.dart';

class SubtaskTable extends Table {
  @override
  String get tableName => 'subtask';
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get remoteId => text().withDefault(const Constant(''))();
  TextColumn get title => text()();
  BoolColumn get isSync => boolean()();
  BoolColumn get isCompleted => boolean()();
  IntColumn get taskLocalId => integer()
      .customConstraint('REFERENCES task(localId) ON DELETE CASCADE')();
}

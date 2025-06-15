import 'package:drift/drift.dart';
import 'package:taskit/shared/data/source/local/drift/table/category.dart';
import 'package:taskit/shared/data/source/local/drift/table/user.dart';

class TaskTable extends Table {
  @override
  String get tableName => 'task';
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get remoteId => text().withDefault(const Constant(''))();
  TextColumn get title => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  IntColumn get categoryLocalId =>
      integer().references(CategoryTable, #localId)();
  BoolColumn get isSynced => boolean()();
  TextColumn get priority => text().withDefault(const Constant('none'))();
  IntColumn get userLocalId =>
      integer().references(UserTable, #localId, onDelete: KeyAction.cascade)();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get hasTime => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

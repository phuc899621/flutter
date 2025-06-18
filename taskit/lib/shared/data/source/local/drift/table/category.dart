import 'package:drift/drift.dart';
import 'package:taskit/shared/data/source/local/drift/table/user.dart';

class CategoryTable extends Table {
  IntColumn get localId => integer().autoIncrement()();

  TextColumn get remoteId => text().withDefault(const Constant(''))();

  TextColumn get name => text()();

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  IntColumn get userLocalId =>
      integer().references(UserTable, #localId, onDelete: KeyAction.cascade)();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'category';
}

import 'package:drift/drift.dart';

class CategoryTable extends Table {
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get remoteId => text().withDefault(const Constant(''))();
  TextColumn get name => text()();
  BoolColumn get isSynced => boolean()();
  IntColumn get userLocalId => integer()
      .nullable()
      .customConstraint('REFERENCES user(localId) ON DELETE CASCADE')();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  String get tableName => 'category';
}

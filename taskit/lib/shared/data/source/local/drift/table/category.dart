import 'package:drift/drift.dart';
import 'package:taskit/shared/data/source/local/drift/table/user.dart';

class CategoryTable extends Table {
  IntColumn get localId => integer().autoIncrement()();

  TextColumn get remoteId =>
      text().nullable().withDefault(const Constant(null)).unique()();

  TextColumn get name => text()();

  BoolColumn get synced => boolean().withDefault(const Constant(false))();

  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();

  IntColumn get userLocalId =>
      integer().references(UserTable, #localId, onDelete: KeyAction.cascade)();

  DateTimeColumn get createdAt => dateTime().withDefault(
    currentDateAndTime.modify(DateTimeModifier.utc()),
  )();

  DateTimeColumn get updatedAt => dateTime().withDefault(
    currentDateAndTime.modify(DateTimeModifier.utc()),
  )();

  @override
  String get tableName => 'category';
}

import 'package:drift/drift.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/data/source/local/drift/table/category.dart';
import 'package:taskit/shared/data/source/local/drift/table/user.dart';

class TaskTable extends Table {
  @override
  String get tableName => 'task';

  IntColumn get localId => integer().autoIncrement()();

  TextColumn get remoteId =>
      text().unique().nullable().withDefault(const Constant(null))();

  TextColumn get title => text()();

  TextColumn get description => text().withDefault(const Constant(''))();

  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  IntColumn get categoryLocalId =>
      integer().references(CategoryTable, #localId)();

  BoolColumn get synced => boolean().withDefault(const Constant(false))();

  TextColumn get priority => text().withDefault(const Constant('none'))();

  DateTimeColumn get reminderAt =>
      dateTime().nullable().withDefault(const Constant(null))();

  TextColumn get reminderType => textEnum<TaskReminderType>().withDefault(
    Constant(TaskReminderType.none.name),
  )();

  IntColumn get reminderOffset =>
      integer().nullable().withDefault(Constant(null))();

  TextColumn get repeatType => textEnum<ReminderRepeatType>().withDefault(
    Constant(ReminderRepeatType.none.name),
  )();

  IntColumn get userLocalId =>
      integer().references(UserTable, #localId, onDelete: KeyAction.cascade)();

  TextColumn get status => text().withDefault(const Constant('pending'))();

  DateTimeColumn get dueDate => dateTime().nullable()();

  DateTimeColumn get completedAt => dateTime().nullable()();

  BoolColumn get hasTime => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

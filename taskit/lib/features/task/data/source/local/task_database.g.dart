// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $TaskDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $TaskDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $TaskDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<TaskDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorTaskDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $TaskDatabaseBuilderContract databaseBuilder(String name) =>
      _$TaskDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $TaskDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$TaskDatabaseBuilder(null);
}

class _$TaskDatabaseBuilder implements $TaskDatabaseBuilderContract {
  _$TaskDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $TaskDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $TaskDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<TaskDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TaskDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TaskDatabase extends TaskDatabase {
  _$TaskDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDAO? _taskDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tasks` (`localId` INTEGER PRIMARY KEY AUTOINCREMENT, `remoteId` TEXT, `title` TEXT, `description` TEXT, `category` TEXT, `priority` TEXT, `status` TEXT, `dueDate` INTEGER, `subtasks` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDAO get taskDAO {
    return _taskDAOInstance ??= _$TaskDAO(database, changeListener);
  }
}

class _$TaskDAO extends TaskDAO {
  _$TaskDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskModelInsertionAdapter = InsertionAdapter(
            database,
            'tasks',
            (TaskModel item) => <String, Object?>{
                  'localId': item.localId,
                  'remoteId': item.remoteId,
                  'title': item.title,
                  'description': item.description,
                  'category': item.category,
                  'priority': item.priority,
                  'status': item.status,
                  'dueDate': _dateTimeConverter.encode(item.dueDate),
                  'subtasks': _subtaskListConverter.encode(item.subtasks)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskModel> _taskModelInsertionAdapter;

  @override
  Future<List<TaskModel>> getAllTasks() async {
    return _queryAdapter.queryList('SELECT * FROM tasks',
        mapper: (Map<String, Object?> row) => TaskModel(
            row['localId'] as int?,
            row['remoteId'] as String?,
            row['title'] as String?,
            row['description'] as String?,
            row['category'] as String?,
            row['priority'] as String?,
            row['status'] as String?,
            _dateTimeConverter.decode(row['dueDate'] as int?),
            _subtaskListConverter.decode(row['subtasks'] as String?)));
  }

  @override
  Future<void> deleteAllTasks() async {
    await _queryAdapter.queryNoReturn('DELETE FROM tasks');
  }

  @override
  Future<void> insertTask(TaskModel task) async {
    await _taskModelInsertionAdapter.insert(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAllTasks(List<TaskModel> tasks) async {
    await _taskModelInsertionAdapter.insertList(
        tasks, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _subtaskListConverter = SubtaskListConverter();

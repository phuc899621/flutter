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

  UserDAO? _userDAOInstance;

  SettingDAO? _settingDAOInstance;

  CategoryDAO? _categoryDAOInstance;

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
            'CREATE TABLE IF NOT EXISTS `tasks` (`localId` INTEGER PRIMARY KEY AUTOINCREMENT, `remoteId` TEXT NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `userId` TEXT NOT NULL, `category` TEXT NOT NULL, `priority` TEXT NOT NULL, `status` TEXT NOT NULL, `dueDate` INTEGER NOT NULL, `subtasks` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `category` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `email` TEXT NOT NULL, `avatar` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `settings` (`id` TEXT NOT NULL, `userId` TEXT NOT NULL, `isNotificationEnable` INTEGER NOT NULL, `language` TEXT NOT NULL, `theme` TEXT NOT NULL, `remindBefore` INTEGER NOT NULL, PRIMARY KEY (`id`, `userId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDAO get taskDAO {
    return _taskDAOInstance ??= _$TaskDAO(database, changeListener);
  }

  @override
  UserDAO get userDAO {
    return _userDAOInstance ??= _$UserDAO(database, changeListener);
  }

  @override
  SettingDAO get settingDAO {
    return _settingDAOInstance ??= _$SettingDAO(database, changeListener);
  }

  @override
  CategoryDAO get categoryDAO {
    return _categoryDAOInstance ??= _$CategoryDAO(database, changeListener);
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
                  'userId': _taskUserDataConverter.encode(item.userId),
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
            row['remoteId'] as String,
            row['title'] as String,
            row['description'] as String,
            row['category'] as String,
            row['priority'] as String,
            row['status'] as String,
            _dateTimeConverter.decode(row['dueDate'] as int),
            _subtaskListConverter.decode(row['subtasks'] as String),
            _taskUserDataConverter.decode(row['userId'] as String),
            localId: row['localId'] as int?));
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

class _$UserDAO extends UserDAO {
  _$UserDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userModelInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'avatar': item.avatar
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserModel> _userModelInsertionAdapter;

  @override
  Future<UserModel?> getUser() async {
    return _queryAdapter.query('SELECT * FROM user LIMIT 1',
        mapper: (Map<String, Object?> row) => UserModel(
            id: row['id'] as String,
            name: row['name'] as String,
            email: row['email'] as String,
            avatar: row['avatar'] as String));
  }

  @override
  Future<void> insert(UserModel user) async {
    await _userModelInsertionAdapter.insert(user, OnConflictStrategy.replace);
  }
}

class _$SettingDAO extends SettingDAO {
  _$SettingDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _settingModelInsertionAdapter = InsertionAdapter(
            database,
            'settings',
            (SettingModel item) => <String, Object?>{
                  'id': item.id,
                  'userId': item.userId,
                  'isNotificationEnable': item.isNotificationEnable ? 1 : 0,
                  'language': item.language,
                  'theme': item.theme,
                  'remindBefore': item.remindBefore
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SettingModel> _settingModelInsertionAdapter;

  @override
  Future<List<SettingModel>> getAllSettings() async {
    return _queryAdapter.queryList('SELECT * FROM settings',
        mapper: (Map<String, Object?> row) => SettingModel(
            id: row['id'] as String,
            userId: row['userId'] as String,
            isNotificationEnable: (row['isNotificationEnable'] as int) != 0,
            language: row['language'] as String,
            theme: row['theme'] as String,
            remindBefore: row['remindBefore'] as int));
  }

  @override
  Future<void> insert(SettingModel setting) async {
    await _settingModelInsertionAdapter.insert(
        setting, OnConflictStrategy.replace);
  }
}

class _$CategoryDAO extends CategoryDAO {
  _$CategoryDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _categoryModelInsertionAdapter = InsertionAdapter(
            database,
            'category',
            (CategoryModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CategoryModel> _categoryModelInsertionAdapter;

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    return _queryAdapter.queryList('SELECT * FROM categories',
        mapper: (Map<String, Object?> row) =>
            CategoryModel(name: row['name'] as String, id: row['id'] as int?));
  }

  @override
  Future<void> insert(CategoryModel category) async {
    await _categoryModelInsertionAdapter.insert(
        category, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAll(List<CategoryModel> categories) async {
    await _categoryModelInsertionAdapter.insertList(
        categories, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _subtaskListConverter = SubtaskListConverter();
final _taskUserDataConverter = TaskUserDataConverter();

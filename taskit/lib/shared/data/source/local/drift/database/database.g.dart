// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
      'is_sync', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_sync" IN (0, 1))'));
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userLocalIdMeta =
      const VerificationMeta('userLocalId');
  @override
  late final GeneratedColumn<int> userLocalId = GeneratedColumn<int>(
      'user_local_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES user(localId) ON DELETE CASCADE');
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        localId,
        remoteId,
        title,
        description,
        category,
        isSync,
        priority,
        userLocalId,
        status,
        dueDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta));
    } else if (isInserting) {
      context.missing(_isSyncMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('user_local_id')) {
      context.handle(
          _userLocalIdMeta,
          userLocalId.isAcceptableOrUnknown(
              data['user_local_id']!, _userLocalIdMeta));
    } else if (isInserting) {
      context.missing(_userLocalIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      isSync: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sync'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!,
      userLocalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_local_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date'])!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  final int localId;
  final String remoteId;
  final String title;
  final String description;
  final String category;
  final bool isSync;
  final String priority;
  final int userLocalId;
  final String status;
  final DateTime dueDate;
  const TaskTableData(
      {required this.localId,
      required this.remoteId,
      required this.title,
      required this.description,
      required this.category,
      required this.isSync,
      required this.priority,
      required this.userLocalId,
      required this.status,
      required this.dueDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['remote_id'] = Variable<String>(remoteId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['category'] = Variable<String>(category);
    map['is_sync'] = Variable<bool>(isSync);
    map['priority'] = Variable<String>(priority);
    map['user_local_id'] = Variable<int>(userLocalId);
    map['status'] = Variable<String>(status);
    map['due_date'] = Variable<DateTime>(dueDate);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      localId: Value(localId),
      remoteId: Value(remoteId),
      title: Value(title),
      description: Value(description),
      category: Value(category),
      isSync: Value(isSync),
      priority: Value(priority),
      userLocalId: Value(userLocalId),
      status: Value(status),
      dueDate: Value(dueDate),
    );
  }

  factory TaskTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      isSync: serializer.fromJson<bool>(json['isSync']),
      priority: serializer.fromJson<String>(json['priority']),
      userLocalId: serializer.fromJson<int>(json['userLocalId']),
      status: serializer.fromJson<String>(json['status']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String>(remoteId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(category),
      'isSync': serializer.toJson<bool>(isSync),
      'priority': serializer.toJson<String>(priority),
      'userLocalId': serializer.toJson<int>(userLocalId),
      'status': serializer.toJson<String>(status),
      'dueDate': serializer.toJson<DateTime>(dueDate),
    };
  }

  TaskTableData copyWith(
          {int? localId,
          String? remoteId,
          String? title,
          String? description,
          String? category,
          bool? isSync,
          String? priority,
          int? userLocalId,
          String? status,
          DateTime? dueDate}) =>
      TaskTableData(
        localId: localId ?? this.localId,
        remoteId: remoteId ?? this.remoteId,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        isSync: isSync ?? this.isSync,
        priority: priority ?? this.priority,
        userLocalId: userLocalId ?? this.userLocalId,
        status: status ?? this.status,
        dueDate: dueDate ?? this.dueDate,
      );
  TaskTableData copyWithCompanion(TaskTableCompanion data) {
    return TaskTableData(
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      category: data.category.present ? data.category.value : this.category,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
      priority: data.priority.present ? data.priority.value : this.priority,
      userLocalId:
          data.userLocalId.present ? data.userLocalId.value : this.userLocalId,
      status: data.status.present ? data.status.value : this.status,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('isSync: $isSync, ')
          ..write('priority: $priority, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, remoteId, title, description,
      category, isSync, priority, userLocalId, status, dueDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.isSync == this.isSync &&
          other.priority == this.priority &&
          other.userLocalId == this.userLocalId &&
          other.status == this.status &&
          other.dueDate == this.dueDate);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<int> localId;
  final Value<String> remoteId;
  final Value<String> title;
  final Value<String> description;
  final Value<String> category;
  final Value<bool> isSync;
  final Value<String> priority;
  final Value<int> userLocalId;
  final Value<String> status;
  final Value<DateTime> dueDate;
  const TaskTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.isSync = const Value.absent(),
    this.priority = const Value.absent(),
    this.userLocalId = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
  });
  TaskTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String title,
    required String description,
    required String category,
    required bool isSync,
    required String priority,
    required int userLocalId,
    required String status,
    required DateTime dueDate,
  })  : title = Value(title),
        description = Value(description),
        category = Value(category),
        isSync = Value(isSync),
        priority = Value(priority),
        userLocalId = Value(userLocalId),
        status = Value(status),
        dueDate = Value(dueDate);
  static Insertable<TaskTableData> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<bool>? isSync,
    Expression<String>? priority,
    Expression<int>? userLocalId,
    Expression<String>? status,
    Expression<DateTime>? dueDate,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (isSync != null) 'is_sync': isSync,
      if (priority != null) 'priority': priority,
      if (userLocalId != null) 'user_local_id': userLocalId,
      if (status != null) 'status': status,
      if (dueDate != null) 'due_date': dueDate,
    });
  }

  TaskTableCompanion copyWith(
      {Value<int>? localId,
      Value<String>? remoteId,
      Value<String>? title,
      Value<String>? description,
      Value<String>? category,
      Value<bool>? isSync,
      Value<String>? priority,
      Value<int>? userLocalId,
      Value<String>? status,
      Value<DateTime>? dueDate}) {
    return TaskTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      isSync: isSync ?? this.isSync,
      priority: priority ?? this.priority,
      userLocalId: userLocalId ?? this.userLocalId,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (userLocalId.present) {
      map['user_local_id'] = Variable<int>(userLocalId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('isSync: $isSync, ')
          ..write('priority: $priority, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }
}

class $SubtaskTableTable extends SubtaskTable
    with TableInfo<$SubtaskTableTable, SubtaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubtaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
      'is_sync', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_sync" IN (0, 1))'));
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  static const VerificationMeta _taskLocalIdMeta =
      const VerificationMeta('taskLocalId');
  @override
  late final GeneratedColumn<int> taskLocalId = GeneratedColumn<int>(
      'task_local_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES task(localId) ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns =>
      [localId, remoteId, title, isSync, isCompleted, taskLocalId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subtask';
  @override
  VerificationContext validateIntegrity(Insertable<SubtaskTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta));
    } else if (isInserting) {
      context.missing(_isSyncMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('task_local_id')) {
      context.handle(
          _taskLocalIdMeta,
          taskLocalId.isAcceptableOrUnknown(
              data['task_local_id']!, _taskLocalIdMeta));
    } else if (isInserting) {
      context.missing(_taskLocalIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  SubtaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubtaskTableData(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      isSync: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sync'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      taskLocalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_local_id'])!,
    );
  }

  @override
  $SubtaskTableTable createAlias(String alias) {
    return $SubtaskTableTable(attachedDatabase, alias);
  }
}

class SubtaskTableData extends DataClass
    implements Insertable<SubtaskTableData> {
  final int localId;
  final String remoteId;
  final String title;
  final bool isSync;
  final bool isCompleted;
  final int taskLocalId;
  const SubtaskTableData(
      {required this.localId,
      required this.remoteId,
      required this.title,
      required this.isSync,
      required this.isCompleted,
      required this.taskLocalId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['remote_id'] = Variable<String>(remoteId);
    map['title'] = Variable<String>(title);
    map['is_sync'] = Variable<bool>(isSync);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['task_local_id'] = Variable<int>(taskLocalId);
    return map;
  }

  SubtaskTableCompanion toCompanion(bool nullToAbsent) {
    return SubtaskTableCompanion(
      localId: Value(localId),
      remoteId: Value(remoteId),
      title: Value(title),
      isSync: Value(isSync),
      isCompleted: Value(isCompleted),
      taskLocalId: Value(taskLocalId),
    );
  }

  factory SubtaskTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubtaskTableData(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      title: serializer.fromJson<String>(json['title']),
      isSync: serializer.fromJson<bool>(json['isSync']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      taskLocalId: serializer.fromJson<int>(json['taskLocalId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String>(remoteId),
      'title': serializer.toJson<String>(title),
      'isSync': serializer.toJson<bool>(isSync),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'taskLocalId': serializer.toJson<int>(taskLocalId),
    };
  }

  SubtaskTableData copyWith(
          {int? localId,
          String? remoteId,
          String? title,
          bool? isSync,
          bool? isCompleted,
          int? taskLocalId}) =>
      SubtaskTableData(
        localId: localId ?? this.localId,
        remoteId: remoteId ?? this.remoteId,
        title: title ?? this.title,
        isSync: isSync ?? this.isSync,
        isCompleted: isCompleted ?? this.isCompleted,
        taskLocalId: taskLocalId ?? this.taskLocalId,
      );
  SubtaskTableData copyWithCompanion(SubtaskTableCompanion data) {
    return SubtaskTableData(
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      title: data.title.present ? data.title.value : this.title,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      taskLocalId:
          data.taskLocalId.present ? data.taskLocalId.value : this.taskLocalId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubtaskTableData(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('isSync: $isSync, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('taskLocalId: $taskLocalId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, remoteId, title, isSync, isCompleted, taskLocalId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubtaskTableData &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.title == this.title &&
          other.isSync == this.isSync &&
          other.isCompleted == this.isCompleted &&
          other.taskLocalId == this.taskLocalId);
}

class SubtaskTableCompanion extends UpdateCompanion<SubtaskTableData> {
  final Value<int> localId;
  final Value<String> remoteId;
  final Value<String> title;
  final Value<bool> isSync;
  final Value<bool> isCompleted;
  final Value<int> taskLocalId;
  const SubtaskTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.title = const Value.absent(),
    this.isSync = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.taskLocalId = const Value.absent(),
  });
  SubtaskTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String title,
    required bool isSync,
    required bool isCompleted,
    required int taskLocalId,
  })  : title = Value(title),
        isSync = Value(isSync),
        isCompleted = Value(isCompleted),
        taskLocalId = Value(taskLocalId);
  static Insertable<SubtaskTableData> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<String>? title,
    Expression<bool>? isSync,
    Expression<bool>? isCompleted,
    Expression<int>? taskLocalId,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (title != null) 'title': title,
      if (isSync != null) 'is_sync': isSync,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (taskLocalId != null) 'task_local_id': taskLocalId,
    });
  }

  SubtaskTableCompanion copyWith(
      {Value<int>? localId,
      Value<String>? remoteId,
      Value<String>? title,
      Value<bool>? isSync,
      Value<bool>? isCompleted,
      Value<int>? taskLocalId}) {
    return SubtaskTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      title: title ?? this.title,
      isSync: isSync ?? this.isSync,
      isCompleted: isCompleted ?? this.isCompleted,
      taskLocalId: taskLocalId ?? this.taskLocalId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (taskLocalId.present) {
      map['task_local_id'] = Variable<int>(taskLocalId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubtaskTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('isSync: $isSync, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('taskLocalId: $taskLocalId')
          ..write(')'))
        .toString();
  }
}

class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
      'avatar', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [localId, remoteId, email, name, avatar];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      avatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int localId;
  final String remoteId;
  final String email;
  final String name;
  final String avatar;
  const UserTableData(
      {required this.localId,
      required this.remoteId,
      required this.email,
      required this.name,
      required this.avatar});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['remote_id'] = Variable<String>(remoteId);
    map['email'] = Variable<String>(email);
    map['name'] = Variable<String>(name);
    map['avatar'] = Variable<String>(avatar);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      localId: Value(localId),
      remoteId: Value(remoteId),
      email: Value(email),
      name: Value(name),
      avatar: Value(avatar),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      email: serializer.fromJson<String>(json['email']),
      name: serializer.fromJson<String>(json['name']),
      avatar: serializer.fromJson<String>(json['avatar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String>(remoteId),
      'email': serializer.toJson<String>(email),
      'name': serializer.toJson<String>(name),
      'avatar': serializer.toJson<String>(avatar),
    };
  }

  UserTableData copyWith(
          {int? localId,
          String? remoteId,
          String? email,
          String? name,
          String? avatar}) =>
      UserTableData(
        localId: localId ?? this.localId,
        remoteId: remoteId ?? this.remoteId,
        email: email ?? this.email,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
      );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      email: data.email.present ? data.email.value : this.email,
      name: data.name.present ? data.name.value : this.name,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, remoteId, email, name, avatar);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.email == this.email &&
          other.name == this.name &&
          other.avatar == this.avatar);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> localId;
  final Value<String> remoteId;
  final Value<String> email;
  final Value<String> name;
  final Value<String> avatar;
  const UserTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.email = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String email,
    required String name,
    required String avatar,
  })  : email = Value(email),
        name = Value(name),
        avatar = Value(avatar);
  static Insertable<UserTableData> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<String>? email,
    Expression<String>? name,
    Expression<String>? avatar,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (avatar != null) 'avatar': avatar,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? localId,
      Value<String>? remoteId,
      Value<String>? email,
      Value<String>? name,
      Value<String>? avatar}) {
    return UserTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar')
          ..write(')'))
        .toString();
  }
}

class $SettingTableTable extends SettingTable
    with TableInfo<$SettingTableTable, SettingTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _userLocalIdMeta =
      const VerificationMeta('userLocalId');
  @override
  late final GeneratedColumn<int> userLocalId = GeneratedColumn<int>(
      'user_local_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES user(localId) ON DELETE CASCADE');
  static const VerificationMeta _isNotificationEnabledMeta =
      const VerificationMeta('isNotificationEnabled');
  @override
  late final GeneratedColumn<bool> isNotificationEnabled =
      GeneratedColumn<bool>('is_notification_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_notification_enabled" IN (0, 1))'));
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
      'theme', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remindBeforeMeta =
      const VerificationMeta('remindBefore');
  @override
  late final GeneratedColumn<int> remindBefore = GeneratedColumn<int>(
      'remind_before', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
      'is_sync', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_sync" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        localId,
        remoteId,
        userLocalId,
        isNotificationEnabled,
        language,
        theme,
        remindBefore,
        isSync
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'setting';
  @override
  VerificationContext validateIntegrity(Insertable<SettingTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('user_local_id')) {
      context.handle(
          _userLocalIdMeta,
          userLocalId.isAcceptableOrUnknown(
              data['user_local_id']!, _userLocalIdMeta));
    } else if (isInserting) {
      context.missing(_userLocalIdMeta);
    }
    if (data.containsKey('is_notification_enabled')) {
      context.handle(
          _isNotificationEnabledMeta,
          isNotificationEnabled.isAcceptableOrUnknown(
              data['is_notification_enabled']!, _isNotificationEnabledMeta));
    } else if (isInserting) {
      context.missing(_isNotificationEnabledMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('theme')) {
      context.handle(
          _themeMeta, theme.isAcceptableOrUnknown(data['theme']!, _themeMeta));
    } else if (isInserting) {
      context.missing(_themeMeta);
    }
    if (data.containsKey('remind_before')) {
      context.handle(
          _remindBeforeMeta,
          remindBefore.isAcceptableOrUnknown(
              data['remind_before']!, _remindBeforeMeta));
    } else if (isInserting) {
      context.missing(_remindBeforeMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta));
    } else if (isInserting) {
      context.missing(_isSyncMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  SettingTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingTableData(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      userLocalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_local_id'])!,
      isNotificationEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_notification_enabled'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      theme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme'])!,
      remindBefore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remind_before'])!,
      isSync: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sync'])!,
    );
  }

  @override
  $SettingTableTable createAlias(String alias) {
    return $SettingTableTable(attachedDatabase, alias);
  }
}

class SettingTableData extends DataClass
    implements Insertable<SettingTableData> {
  final int localId;
  final String remoteId;
  final int userLocalId;
  final bool isNotificationEnabled;
  final String language;
  final String theme;
  final int remindBefore;
  final bool isSync;
  const SettingTableData(
      {required this.localId,
      required this.remoteId,
      required this.userLocalId,
      required this.isNotificationEnabled,
      required this.language,
      required this.theme,
      required this.remindBefore,
      required this.isSync});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['remote_id'] = Variable<String>(remoteId);
    map['user_local_id'] = Variable<int>(userLocalId);
    map['is_notification_enabled'] = Variable<bool>(isNotificationEnabled);
    map['language'] = Variable<String>(language);
    map['theme'] = Variable<String>(theme);
    map['remind_before'] = Variable<int>(remindBefore);
    map['is_sync'] = Variable<bool>(isSync);
    return map;
  }

  SettingTableCompanion toCompanion(bool nullToAbsent) {
    return SettingTableCompanion(
      localId: Value(localId),
      remoteId: Value(remoteId),
      userLocalId: Value(userLocalId),
      isNotificationEnabled: Value(isNotificationEnabled),
      language: Value(language),
      theme: Value(theme),
      remindBefore: Value(remindBefore),
      isSync: Value(isSync),
    );
  }

  factory SettingTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingTableData(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      userLocalId: serializer.fromJson<int>(json['userLocalId']),
      isNotificationEnabled:
          serializer.fromJson<bool>(json['isNotificationEnabled']),
      language: serializer.fromJson<String>(json['language']),
      theme: serializer.fromJson<String>(json['theme']),
      remindBefore: serializer.fromJson<int>(json['remindBefore']),
      isSync: serializer.fromJson<bool>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String>(remoteId),
      'userLocalId': serializer.toJson<int>(userLocalId),
      'isNotificationEnabled': serializer.toJson<bool>(isNotificationEnabled),
      'language': serializer.toJson<String>(language),
      'theme': serializer.toJson<String>(theme),
      'remindBefore': serializer.toJson<int>(remindBefore),
      'isSync': serializer.toJson<bool>(isSync),
    };
  }

  SettingTableData copyWith(
          {int? localId,
          String? remoteId,
          int? userLocalId,
          bool? isNotificationEnabled,
          String? language,
          String? theme,
          int? remindBefore,
          bool? isSync}) =>
      SettingTableData(
        localId: localId ?? this.localId,
        remoteId: remoteId ?? this.remoteId,
        userLocalId: userLocalId ?? this.userLocalId,
        isNotificationEnabled:
            isNotificationEnabled ?? this.isNotificationEnabled,
        language: language ?? this.language,
        theme: theme ?? this.theme,
        remindBefore: remindBefore ?? this.remindBefore,
        isSync: isSync ?? this.isSync,
      );
  SettingTableData copyWithCompanion(SettingTableCompanion data) {
    return SettingTableData(
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      userLocalId:
          data.userLocalId.present ? data.userLocalId.value : this.userLocalId,
      isNotificationEnabled: data.isNotificationEnabled.present
          ? data.isNotificationEnabled.value
          : this.isNotificationEnabled,
      language: data.language.present ? data.language.value : this.language,
      theme: data.theme.present ? data.theme.value : this.theme,
      remindBefore: data.remindBefore.present
          ? data.remindBefore.value
          : this.remindBefore,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingTableData(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('isNotificationEnabled: $isNotificationEnabled, ')
          ..write('language: $language, ')
          ..write('theme: $theme, ')
          ..write('remindBefore: $remindBefore, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, remoteId, userLocalId,
      isNotificationEnabled, language, theme, remindBefore, isSync);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingTableData &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.userLocalId == this.userLocalId &&
          other.isNotificationEnabled == this.isNotificationEnabled &&
          other.language == this.language &&
          other.theme == this.theme &&
          other.remindBefore == this.remindBefore &&
          other.isSync == this.isSync);
}

class SettingTableCompanion extends UpdateCompanion<SettingTableData> {
  final Value<int> localId;
  final Value<String> remoteId;
  final Value<int> userLocalId;
  final Value<bool> isNotificationEnabled;
  final Value<String> language;
  final Value<String> theme;
  final Value<int> remindBefore;
  final Value<bool> isSync;
  const SettingTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.userLocalId = const Value.absent(),
    this.isNotificationEnabled = const Value.absent(),
    this.language = const Value.absent(),
    this.theme = const Value.absent(),
    this.remindBefore = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  SettingTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int userLocalId,
    required bool isNotificationEnabled,
    required String language,
    required String theme,
    required int remindBefore,
    required bool isSync,
  })  : userLocalId = Value(userLocalId),
        isNotificationEnabled = Value(isNotificationEnabled),
        language = Value(language),
        theme = Value(theme),
        remindBefore = Value(remindBefore),
        isSync = Value(isSync);
  static Insertable<SettingTableData> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<int>? userLocalId,
    Expression<bool>? isNotificationEnabled,
    Expression<String>? language,
    Expression<String>? theme,
    Expression<int>? remindBefore,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (userLocalId != null) 'user_local_id': userLocalId,
      if (isNotificationEnabled != null)
        'is_notification_enabled': isNotificationEnabled,
      if (language != null) 'language': language,
      if (theme != null) 'theme': theme,
      if (remindBefore != null) 'remind_before': remindBefore,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  SettingTableCompanion copyWith(
      {Value<int>? localId,
      Value<String>? remoteId,
      Value<int>? userLocalId,
      Value<bool>? isNotificationEnabled,
      Value<String>? language,
      Value<String>? theme,
      Value<int>? remindBefore,
      Value<bool>? isSync}) {
    return SettingTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      userLocalId: userLocalId ?? this.userLocalId,
      isNotificationEnabled:
          isNotificationEnabled ?? this.isNotificationEnabled,
      language: language ?? this.language,
      theme: theme ?? this.theme,
      remindBefore: remindBefore ?? this.remindBefore,
      isSync: isSync ?? this.isSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (userLocalId.present) {
      map['user_local_id'] = Variable<int>(userLocalId.value);
    }
    if (isNotificationEnabled.present) {
      map['is_notification_enabled'] =
          Variable<bool>(isNotificationEnabled.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (remindBefore.present) {
      map['remind_before'] = Variable<int>(remindBefore.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('isNotificationEnabled: $isNotificationEnabled, ')
          ..write('language: $language, ')
          ..write('theme: $theme, ')
          ..write('remindBefore: $remindBefore, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
      'is_sync', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_sync" IN (0, 1))'));
  static const VerificationMeta _settingLocalIdMeta =
      const VerificationMeta('settingLocalId');
  @override
  late final GeneratedColumn<int> settingLocalId = GeneratedColumn<int>(
      'setting_local_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES setting(localId) ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns =>
      [localId, remoteId, name, isSync, settingLocalId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta));
    } else if (isInserting) {
      context.missing(_isSyncMeta);
    }
    if (data.containsKey('setting_local_id')) {
      context.handle(
          _settingLocalIdMeta,
          settingLocalId.isAcceptableOrUnknown(
              data['setting_local_id']!, _settingLocalIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isSync: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sync'])!,
      settingLocalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}setting_local_id']),
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int localId;
  final String remoteId;
  final String name;
  final bool isSync;
  final int? settingLocalId;
  const CategoryTableData(
      {required this.localId,
      required this.remoteId,
      required this.name,
      required this.isSync,
      this.settingLocalId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['remote_id'] = Variable<String>(remoteId);
    map['name'] = Variable<String>(name);
    map['is_sync'] = Variable<bool>(isSync);
    if (!nullToAbsent || settingLocalId != null) {
      map['setting_local_id'] = Variable<int>(settingLocalId);
    }
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      localId: Value(localId),
      remoteId: Value(remoteId),
      name: Value(name),
      isSync: Value(isSync),
      settingLocalId: settingLocalId == null && nullToAbsent
          ? const Value.absent()
          : Value(settingLocalId),
    );
  }

  factory CategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      name: serializer.fromJson<String>(json['name']),
      isSync: serializer.fromJson<bool>(json['isSync']),
      settingLocalId: serializer.fromJson<int?>(json['settingLocalId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String>(remoteId),
      'name': serializer.toJson<String>(name),
      'isSync': serializer.toJson<bool>(isSync),
      'settingLocalId': serializer.toJson<int?>(settingLocalId),
    };
  }

  CategoryTableData copyWith(
          {int? localId,
          String? remoteId,
          String? name,
          bool? isSync,
          Value<int?> settingLocalId = const Value.absent()}) =>
      CategoryTableData(
        localId: localId ?? this.localId,
        remoteId: remoteId ?? this.remoteId,
        name: name ?? this.name,
        isSync: isSync ?? this.isSync,
        settingLocalId:
            settingLocalId.present ? settingLocalId.value : this.settingLocalId,
      );
  CategoryTableData copyWithCompanion(CategoryTableCompanion data) {
    return CategoryTableData(
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      name: data.name.present ? data.name.value : this.name,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
      settingLocalId: data.settingLocalId.present
          ? data.settingLocalId.value
          : this.settingLocalId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('isSync: $isSync, ')
          ..write('settingLocalId: $settingLocalId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, remoteId, name, isSync, settingLocalId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.name == this.name &&
          other.isSync == this.isSync &&
          other.settingLocalId == this.settingLocalId);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> localId;
  final Value<String> remoteId;
  final Value<String> name;
  final Value<bool> isSync;
  final Value<int?> settingLocalId;
  const CategoryTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.name = const Value.absent(),
    this.isSync = const Value.absent(),
    this.settingLocalId = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String name,
    required bool isSync,
    this.settingLocalId = const Value.absent(),
  })  : name = Value(name),
        isSync = Value(isSync);
  static Insertable<CategoryTableData> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<String>? name,
    Expression<bool>? isSync,
    Expression<int>? settingLocalId,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (name != null) 'name': name,
      if (isSync != null) 'is_sync': isSync,
      if (settingLocalId != null) 'setting_local_id': settingLocalId,
    });
  }

  CategoryTableCompanion copyWith(
      {Value<int>? localId,
      Value<String>? remoteId,
      Value<String>? name,
      Value<bool>? isSync,
      Value<int?>? settingLocalId}) {
    return CategoryTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      name: name ?? this.name,
      isSync: isSync ?? this.isSync,
      settingLocalId: settingLocalId ?? this.settingLocalId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (settingLocalId.present) {
      map['setting_local_id'] = Variable<int>(settingLocalId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('isSync: $isSync, ')
          ..write('settingLocalId: $settingLocalId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final $SubtaskTableTable subtaskTable = $SubtaskTableTable(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $SettingTableTable settingTable = $SettingTableTable(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final TaskDao taskDao = TaskDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final SubtaskDao subtaskDao = SubtaskDao(this as AppDatabase);
  late final SettingDao settingDao = SettingDao(this as AppDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [taskTable, subtaskTable, userTable, settingTable, categoryTable];
}

typedef $$TaskTableTableCreateCompanionBuilder = TaskTableCompanion Function({
  Value<int> localId,
  Value<String> remoteId,
  required String title,
  required String description,
  required String category,
  required bool isSync,
  required String priority,
  required int userLocalId,
  required String status,
  required DateTime dueDate,
});
typedef $$TaskTableTableUpdateCompanionBuilder = TaskTableCompanion Function({
  Value<int> localId,
  Value<String> remoteId,
  Value<String> title,
  Value<String> description,
  Value<String> category,
  Value<bool> isSync,
  Value<String> priority,
  Value<int> userLocalId,
  Value<String> status,
  Value<DateTime> dueDate,
});

class $$TaskTableTableFilterComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSync => $composableBuilder(
      column: $table.isSync, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userLocalId => $composableBuilder(
      column: $table.userLocalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));
}

class $$TaskTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSync => $composableBuilder(
      column: $table.isSync, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userLocalId => $composableBuilder(
      column: $table.userLocalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));
}

class $$TaskTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<int> get userLocalId => $composableBuilder(
      column: $table.userLocalId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);
}

class $$TaskTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskTableTable,
    TaskTableData,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableAnnotationComposer,
    $$TaskTableTableCreateCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder,
    (
      TaskTableData,
      BaseReferences<_$AppDatabase, $TaskTableTable, TaskTableData>
    ),
    TaskTableData,
    PrefetchHooks Function()> {
  $$TaskTableTableTableManager(_$AppDatabase db, $TaskTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> isSync = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<int> userLocalId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> dueDate = const Value.absent(),
          }) =>
              TaskTableCompanion(
            localId: localId,
            remoteId: remoteId,
            title: title,
            description: description,
            category: category,
            isSync: isSync,
            priority: priority,
            userLocalId: userLocalId,
            status: status,
            dueDate: dueDate,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            required String title,
            required String description,
            required String category,
            required bool isSync,
            required String priority,
            required int userLocalId,
            required String status,
            required DateTime dueDate,
          }) =>
              TaskTableCompanion.insert(
            localId: localId,
            remoteId: remoteId,
            title: title,
            description: description,
            category: category,
            isSync: isSync,
            priority: priority,
            userLocalId: userLocalId,
            status: status,
            dueDate: dueDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskTableTable,
    TaskTableData,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableAnnotationComposer,
    $$TaskTableTableCreateCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder,
    (
      TaskTableData,
      BaseReferences<_$AppDatabase, $TaskTableTable, TaskTableData>
    ),
    TaskTableData,
    PrefetchHooks Function()>;
typedef $$SubtaskTableTableCreateCompanionBuilder = SubtaskTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  required String title,
  required bool isSync,
  required bool isCompleted,
  required int taskLocalId,
});
typedef $$SubtaskTableTableUpdateCompanionBuilder = SubtaskTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  Value<String> title,
  Value<bool> isSync,
  Value<bool> isCompleted,
  Value<int> taskLocalId,
});

class $$SubtaskTableTableFilterComposer
    extends Composer<_$AppDatabase, $SubtaskTableTable> {
  $$SubtaskTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSync => $composableBuilder(
      column: $table.isSync, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get taskLocalId => $composableBuilder(
      column: $table.taskLocalId, builder: (column) => ColumnFilters(column));
}

class $$SubtaskTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SubtaskTableTable> {
  $$SubtaskTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSync => $composableBuilder(
      column: $table.isSync, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get taskLocalId => $composableBuilder(
      column: $table.taskLocalId, builder: (column) => ColumnOrderings(column));
}

class $$SubtaskTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubtaskTableTable> {
  $$SubtaskTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<int> get taskLocalId => $composableBuilder(
      column: $table.taskLocalId, builder: (column) => column);
}

class $$SubtaskTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubtaskTableTable,
    SubtaskTableData,
    $$SubtaskTableTableFilterComposer,
    $$SubtaskTableTableOrderingComposer,
    $$SubtaskTableTableAnnotationComposer,
    $$SubtaskTableTableCreateCompanionBuilder,
    $$SubtaskTableTableUpdateCompanionBuilder,
    (
      SubtaskTableData,
      BaseReferences<_$AppDatabase, $SubtaskTableTable, SubtaskTableData>
    ),
    SubtaskTableData,
    PrefetchHooks Function()> {
  $$SubtaskTableTableTableManager(_$AppDatabase db, $SubtaskTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubtaskTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubtaskTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubtaskTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<bool> isSync = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<int> taskLocalId = const Value.absent(),
          }) =>
              SubtaskTableCompanion(
            localId: localId,
            remoteId: remoteId,
            title: title,
            isSync: isSync,
            isCompleted: isCompleted,
            taskLocalId: taskLocalId,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            required String title,
            required bool isSync,
            required bool isCompleted,
            required int taskLocalId,
          }) =>
              SubtaskTableCompanion.insert(
            localId: localId,
            remoteId: remoteId,
            title: title,
            isSync: isSync,
            isCompleted: isCompleted,
            taskLocalId: taskLocalId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubtaskTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubtaskTableTable,
    SubtaskTableData,
    $$SubtaskTableTableFilterComposer,
    $$SubtaskTableTableOrderingComposer,
    $$SubtaskTableTableAnnotationComposer,
    $$SubtaskTableTableCreateCompanionBuilder,
    $$SubtaskTableTableUpdateCompanionBuilder,
    (
      SubtaskTableData,
      BaseReferences<_$AppDatabase, $SubtaskTableTable, SubtaskTableData>
    ),
    SubtaskTableData,
    PrefetchHooks Function()>;
typedef $$UserTableTableCreateCompanionBuilder = UserTableCompanion Function({
  Value<int> localId,
  Value<String> remoteId,
  required String email,
  required String name,
  required String avatar,
});
typedef $$UserTableTableUpdateCompanionBuilder = UserTableCompanion Function({
  Value<int> localId,
  Value<String> remoteId,
  Value<String> email,
  Value<String> name,
  Value<String> avatar,
});

class $$UserTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatar => $composableBuilder(
      column: $table.avatar, builder: (column) => ColumnFilters(column));
}

class $$UserTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatar => $composableBuilder(
      column: $table.avatar, builder: (column) => ColumnOrderings(column));
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);
}

class $$UserTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (
      UserTableData,
      BaseReferences<_$AppDatabase, $UserTableTable, UserTableData>
    ),
    UserTableData,
    PrefetchHooks Function()> {
  $$UserTableTableTableManager(_$AppDatabase db, $UserTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> avatar = const Value.absent(),
          }) =>
              UserTableCompanion(
            localId: localId,
            remoteId: remoteId,
            email: email,
            name: name,
            avatar: avatar,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            required String email,
            required String name,
            required String avatar,
          }) =>
              UserTableCompanion.insert(
            localId: localId,
            remoteId: remoteId,
            email: email,
            name: name,
            avatar: avatar,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (
      UserTableData,
      BaseReferences<_$AppDatabase, $UserTableTable, UserTableData>
    ),
    UserTableData,
    PrefetchHooks Function()>;
typedef $$SettingTableTableCreateCompanionBuilder = SettingTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  required int userLocalId,
  required bool isNotificationEnabled,
  required String language,
  required String theme,
  required int remindBefore,
  required bool isSync,
});
typedef $$SettingTableTableUpdateCompanionBuilder = SettingTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  Value<int> userLocalId,
  Value<bool> isNotificationEnabled,
  Value<String> language,
  Value<String> theme,
  Value<int> remindBefore,
  Value<bool> isSync,
});

class $$SettingTableTableFilterComposer
    extends Composer<_$AppDatabase, $SettingTableTable> {
  $$SettingTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userLocalId => $composableBuilder(
      column: $table.userLocalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isNotificationEnabled => $composableBuilder(
      column: $table.isNotificationEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get theme => $composableBuilder(
      column: $table.theme, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remindBefore => $composableBuilder(
      column: $table.remindBefore, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSync => $composableBuilder(
      column: $table.isSync, builder: (column) => ColumnFilters(column));
}

class $$SettingTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingTableTable> {
  $$SettingTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userLocalId => $composableBuilder(
      column: $table.userLocalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isNotificationEnabled => $composableBuilder(
      column: $table.isNotificationEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get theme => $composableBuilder(
      column: $table.theme, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remindBefore => $composableBuilder(
      column: $table.remindBefore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSync => $composableBuilder(
      column: $table.isSync, builder: (column) => ColumnOrderings(column));
}

class $$SettingTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingTableTable> {
  $$SettingTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get userLocalId => $composableBuilder(
      column: $table.userLocalId, builder: (column) => column);

  GeneratedColumn<bool> get isNotificationEnabled => $composableBuilder(
      column: $table.isNotificationEnabled, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get theme =>
      $composableBuilder(column: $table.theme, builder: (column) => column);

  GeneratedColumn<int> get remindBefore => $composableBuilder(
      column: $table.remindBefore, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);
}

class $$SettingTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingTableTable,
    SettingTableData,
    $$SettingTableTableFilterComposer,
    $$SettingTableTableOrderingComposer,
    $$SettingTableTableAnnotationComposer,
    $$SettingTableTableCreateCompanionBuilder,
    $$SettingTableTableUpdateCompanionBuilder,
    (
      SettingTableData,
      BaseReferences<_$AppDatabase, $SettingTableTable, SettingTableData>
    ),
    SettingTableData,
    PrefetchHooks Function()> {
  $$SettingTableTableTableManager(_$AppDatabase db, $SettingTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<int> userLocalId = const Value.absent(),
            Value<bool> isNotificationEnabled = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<String> theme = const Value.absent(),
            Value<int> remindBefore = const Value.absent(),
            Value<bool> isSync = const Value.absent(),
          }) =>
              SettingTableCompanion(
            localId: localId,
            remoteId: remoteId,
            userLocalId: userLocalId,
            isNotificationEnabled: isNotificationEnabled,
            language: language,
            theme: theme,
            remindBefore: remindBefore,
            isSync: isSync,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            required int userLocalId,
            required bool isNotificationEnabled,
            required String language,
            required String theme,
            required int remindBefore,
            required bool isSync,
          }) =>
              SettingTableCompanion.insert(
            localId: localId,
            remoteId: remoteId,
            userLocalId: userLocalId,
            isNotificationEnabled: isNotificationEnabled,
            language: language,
            theme: theme,
            remindBefore: remindBefore,
            isSync: isSync,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingTableTable,
    SettingTableData,
    $$SettingTableTableFilterComposer,
    $$SettingTableTableOrderingComposer,
    $$SettingTableTableAnnotationComposer,
    $$SettingTableTableCreateCompanionBuilder,
    $$SettingTableTableUpdateCompanionBuilder,
    (
      SettingTableData,
      BaseReferences<_$AppDatabase, $SettingTableTable, SettingTableData>
    ),
    SettingTableData,
    PrefetchHooks Function()>;
typedef $$CategoryTableTableCreateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  required String name,
  required bool isSync,
  Value<int?> settingLocalId,
});
typedef $$CategoryTableTableUpdateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  Value<String> name,
  Value<bool> isSync,
  Value<int?> settingLocalId,
});

class $$CategoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSync => $composableBuilder(
      column: $table.isSync, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get settingLocalId => $composableBuilder(
      column: $table.settingLocalId,
      builder: (column) => ColumnFilters(column));
}

class $$CategoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSync => $composableBuilder(
      column: $table.isSync, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get settingLocalId => $composableBuilder(
      column: $table.settingLocalId,
      builder: (column) => ColumnOrderings(column));
}

class $$CategoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);

  GeneratedColumn<int> get settingLocalId => $composableBuilder(
      column: $table.settingLocalId, builder: (column) => column);
}

class $$CategoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (
      CategoryTableData,
      BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData>
    ),
    CategoryTableData,
    PrefetchHooks Function()> {
  $$CategoryTableTableTableManager(_$AppDatabase db, $CategoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isSync = const Value.absent(),
            Value<int?> settingLocalId = const Value.absent(),
          }) =>
              CategoryTableCompanion(
            localId: localId,
            remoteId: remoteId,
            name: name,
            isSync: isSync,
            settingLocalId: settingLocalId,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            required String name,
            required bool isSync,
            Value<int?> settingLocalId = const Value.absent(),
          }) =>
              CategoryTableCompanion.insert(
            localId: localId,
            remoteId: remoteId,
            name: name,
            isSync: isSync,
            settingLocalId: settingLocalId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (
      CategoryTableData,
      BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData>
    ),
    CategoryTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);
  $$SubtaskTableTableTableManager get subtaskTable =>
      $$SubtaskTableTableTableManager(_db, _db.subtaskTable);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$SettingTableTableTableManager get settingTable =>
      $$SettingTableTableTableManager(_db, _db.settingTable);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);
}

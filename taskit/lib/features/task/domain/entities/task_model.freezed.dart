// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskEntity {
  String get id;
  String get title;
  String get description;
  String get category;
  String get priority;
  UserData get userId;
  String get status;
  DateTime get dueDate;
  List<SubtaskData> get subtasks;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<TaskEntity> get copyWith =>
      _$TaskEntityCopyWithImpl<TaskEntity>(this as TaskEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality().equals(other.subtasks, subtasks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      category,
      priority,
      userId,
      status,
      dueDate,
      const DeepCollectionEquality().hash(subtasks),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'TaskEntity(id: $id, title: $title, description: $description, category: $category, priority: $priority, userId: $userId, status: $status, dueDate: $dueDate, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $TaskEntityCopyWith<$Res> {
  factory $TaskEntityCopyWith(
          TaskEntity value, $Res Function(TaskEntity) _then) =
      _$TaskEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      String priority,
      UserData userId,
      String status,
      DateTime dueDate,
      List<SubtaskData> subtasks,
      DateTime createdAt,
      DateTime updatedAt});

  $UserDataCopyWith<$Res> get userId;
}

/// @nodoc
class _$TaskEntityCopyWithImpl<$Res> implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._self, this._then);

  final TaskEntity _self;
  final $Res Function(TaskEntity) _then;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? userId = null,
    Object? status = null,
    Object? dueDate = null,
    Object? subtasks = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserData,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtasks: null == subtasks
          ? _self.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskData>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get userId {
    return $UserDataCopyWith<$Res>(_self.userId, (value) {
      return _then(_self.copyWith(userId: value));
    });
  }
}

/// @nodoc

class _TaskEntity implements TaskEntity {
  const _TaskEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.priority,
      required this.userId,
      required this.status,
      required this.dueDate,
      required final List<SubtaskData> subtasks,
      required this.createdAt,
      required this.updatedAt})
      : _subtasks = subtasks;

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final String priority;
  @override
  final UserData userId;
  @override
  final String status;
  @override
  final DateTime dueDate;
  final List<SubtaskData> _subtasks;
  @override
  List<SubtaskData> get subtasks {
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtasks);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskEntityCopyWith<_TaskEntity> get copyWith =>
      __$TaskEntityCopyWithImpl<_TaskEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      category,
      priority,
      userId,
      status,
      dueDate,
      const DeepCollectionEquality().hash(_subtasks),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'TaskEntity(id: $id, title: $title, description: $description, category: $category, priority: $priority, userId: $userId, status: $status, dueDate: $dueDate, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$TaskEntityCopyWith<$Res>
    implements $TaskEntityCopyWith<$Res> {
  factory _$TaskEntityCopyWith(
          _TaskEntity value, $Res Function(_TaskEntity) _then) =
      __$TaskEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      String priority,
      UserData userId,
      String status,
      DateTime dueDate,
      List<SubtaskData> subtasks,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $UserDataCopyWith<$Res> get userId;
}

/// @nodoc
class __$TaskEntityCopyWithImpl<$Res> implements _$TaskEntityCopyWith<$Res> {
  __$TaskEntityCopyWithImpl(this._self, this._then);

  final _TaskEntity _self;
  final $Res Function(_TaskEntity) _then;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? userId = null,
    Object? status = null,
    Object? dueDate = null,
    Object? subtasks = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_TaskEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserData,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtasks: null == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskData>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get userId {
    return $UserDataCopyWith<$Res>(_self.userId, (value) {
      return _then(_self.copyWith(userId: value));
    });
  }
}

/// @nodoc
mixin _$LstTaskEntity {
  List<TaskEntity> get tasks;

  /// Create a copy of LstTaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LstTaskEntityCopyWith<LstTaskEntity> get copyWith =>
      _$LstTaskEntityCopyWithImpl<LstTaskEntity>(
          this as LstTaskEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LstTaskEntity &&
            const DeepCollectionEquality().equals(other.tasks, tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tasks));

  @override
  String toString() {
    return 'LstTaskEntity(tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class $LstTaskEntityCopyWith<$Res> {
  factory $LstTaskEntityCopyWith(
          LstTaskEntity value, $Res Function(LstTaskEntity) _then) =
      _$LstTaskEntityCopyWithImpl;
  @useResult
  $Res call({List<TaskEntity> tasks});
}

/// @nodoc
class _$LstTaskEntityCopyWithImpl<$Res>
    implements $LstTaskEntityCopyWith<$Res> {
  _$LstTaskEntityCopyWithImpl(this._self, this._then);

  final LstTaskEntity _self;
  final $Res Function(LstTaskEntity) _then;

  /// Create a copy of LstTaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_self.copyWith(
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
    ));
  }
}

/// @nodoc

class _LstTaskEntity implements LstTaskEntity {
  const _LstTaskEntity({required final List<TaskEntity> tasks})
      : _tasks = tasks;

  final List<TaskEntity> _tasks;
  @override
  List<TaskEntity> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  /// Create a copy of LstTaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LstTaskEntityCopyWith<_LstTaskEntity> get copyWith =>
      __$LstTaskEntityCopyWithImpl<_LstTaskEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LstTaskEntity &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @override
  String toString() {
    return 'LstTaskEntity(tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class _$LstTaskEntityCopyWith<$Res>
    implements $LstTaskEntityCopyWith<$Res> {
  factory _$LstTaskEntityCopyWith(
          _LstTaskEntity value, $Res Function(_LstTaskEntity) _then) =
      __$LstTaskEntityCopyWithImpl;
  @override
  @useResult
  $Res call({List<TaskEntity> tasks});
}

/// @nodoc
class __$LstTaskEntityCopyWithImpl<$Res>
    implements _$LstTaskEntityCopyWith<$Res> {
  __$LstTaskEntityCopyWithImpl(this._self, this._then);

  final _LstTaskEntity _self;
  final $Res Function(_LstTaskEntity) _then;

  /// Create a copy of LstTaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_LstTaskEntity(
      tasks: null == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
    ));
  }
}

// dart format on

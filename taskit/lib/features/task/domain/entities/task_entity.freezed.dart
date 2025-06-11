// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskEntity {
  int get localId;
  String get title;
  String get description;
  String get category;
  String get priority;
  int get userLocalId;
  String get type;
  String get status;
  DateTime? get scheduledDate;
  bool get hasScheduledTime;
  DateTime? get deadlineDate;
  List<SubtaskEntity> get subtasks;
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
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.userLocalId, userLocalId) ||
                other.userLocalId == userLocalId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.hasScheduledTime, hasScheduledTime) ||
                other.hasScheduledTime == hasScheduledTime) &&
            (identical(other.deadlineDate, deadlineDate) ||
                other.deadlineDate == deadlineDate) &&
            const DeepCollectionEquality().equals(other.subtasks, subtasks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      localId,
      title,
      description,
      category,
      priority,
      userLocalId,
      type,
      status,
      scheduledDate,
      hasScheduledTime,
      deadlineDate,
      const DeepCollectionEquality().hash(subtasks),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'TaskEntity(localId: $localId, title: $title, description: $description, category: $category, priority: $priority, userLocalId: $userLocalId, type: $type, status: $status, scheduledDate: $scheduledDate, hasScheduledTime: $hasScheduledTime, deadlineDate: $deadlineDate, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $TaskEntityCopyWith<$Res> {
  factory $TaskEntityCopyWith(
          TaskEntity value, $Res Function(TaskEntity) _then) =
      _$TaskEntityCopyWithImpl;
  @useResult
  $Res call(
      {int localId,
      String title,
      String description,
      String category,
      String priority,
      int userLocalId,
      String type,
      String status,
      DateTime? scheduledDate,
      bool hasScheduledTime,
      DateTime? deadlineDate,
      List<SubtaskEntity> subtasks,
      DateTime createdAt,
      DateTime updatedAt});
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
    Object? localId = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? userLocalId = null,
    Object? type = null,
    Object? status = null,
    Object? scheduledDate = freezed,
    Object? hasScheduledTime = null,
    Object? deadlineDate = freezed,
    Object? subtasks = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
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
      userLocalId: null == userLocalId
          ? _self.userLocalId
          : userLocalId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledDate: freezed == scheduledDate
          ? _self.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasScheduledTime: null == hasScheduledTime
          ? _self.hasScheduledTime
          : hasScheduledTime // ignore: cast_nullable_to_non_nullable
              as bool,
      deadlineDate: freezed == deadlineDate
          ? _self.deadlineDate
          : deadlineDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subtasks: null == subtasks
          ? _self.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskEntity>,
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
}

/// @nodoc

class _TaskEntity implements TaskEntity {
  const _TaskEntity(
      {required this.localId,
      required this.title,
      required this.description,
      required this.category,
      required this.priority,
      required this.userLocalId,
      required this.type,
      required this.status,
      this.scheduledDate,
      required this.hasScheduledTime,
      this.deadlineDate,
      required final List<SubtaskEntity> subtasks,
      required this.createdAt,
      required this.updatedAt})
      : _subtasks = subtasks;

  @override
  final int localId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final String priority;
  @override
  final int userLocalId;
  @override
  final String type;
  @override
  final String status;
  @override
  final DateTime? scheduledDate;
  @override
  final bool hasScheduledTime;
  @override
  final DateTime? deadlineDate;
  final List<SubtaskEntity> _subtasks;
  @override
  List<SubtaskEntity> get subtasks {
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
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.userLocalId, userLocalId) ||
                other.userLocalId == userLocalId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.hasScheduledTime, hasScheduledTime) ||
                other.hasScheduledTime == hasScheduledTime) &&
            (identical(other.deadlineDate, deadlineDate) ||
                other.deadlineDate == deadlineDate) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      localId,
      title,
      description,
      category,
      priority,
      userLocalId,
      type,
      status,
      scheduledDate,
      hasScheduledTime,
      deadlineDate,
      const DeepCollectionEquality().hash(_subtasks),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'TaskEntity(localId: $localId, title: $title, description: $description, category: $category, priority: $priority, userLocalId: $userLocalId, type: $type, status: $status, scheduledDate: $scheduledDate, hasScheduledTime: $hasScheduledTime, deadlineDate: $deadlineDate, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
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
      {int localId,
      String title,
      String description,
      String category,
      String priority,
      int userLocalId,
      String type,
      String status,
      DateTime? scheduledDate,
      bool hasScheduledTime,
      DateTime? deadlineDate,
      List<SubtaskEntity> subtasks,
      DateTime createdAt,
      DateTime updatedAt});
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
    Object? localId = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? userLocalId = null,
    Object? type = null,
    Object? status = null,
    Object? scheduledDate = freezed,
    Object? hasScheduledTime = null,
    Object? deadlineDate = freezed,
    Object? subtasks = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_TaskEntity(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
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
      userLocalId: null == userLocalId
          ? _self.userLocalId
          : userLocalId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledDate: freezed == scheduledDate
          ? _self.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasScheduledTime: null == hasScheduledTime
          ? _self.hasScheduledTime
          : hasScheduledTime // ignore: cast_nullable_to_non_nullable
              as bool,
      deadlineDate: freezed == deadlineDate
          ? _self.deadlineDate
          : deadlineDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subtasks: null == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskEntity>,
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
}

// dart format on

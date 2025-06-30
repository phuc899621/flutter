// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddTaskData {
  @JsonKey(name: '_id')
  String get id;
  int get localId;
  String get title;
  String get description;
  String get categoryId;
  String get priority;
  String get userId;
  String get status;
  DateTime? get dueDate;
  bool get hasTime;
  List<AddSubtaskData> get subtasks;

  /// Create a copy of AddTaskData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddTaskDataCopyWith<AddTaskData> get copyWith =>
      _$AddTaskDataCopyWithImpl<AddTaskData>(this as AddTaskData, _$identity);

  /// Serializes this AddTaskData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddTaskData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.hasTime, hasTime) || other.hasTime == hasTime) &&
            const DeepCollectionEquality().equals(other.subtasks, subtasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      localId,
      title,
      description,
      categoryId,
      priority,
      userId,
      status,
      dueDate,
      hasTime,
      const DeepCollectionEquality().hash(subtasks));

  @override
  String toString() {
    return 'AddTaskData(id: $id, localId: $localId, title: $title, description: $description, categoryId: $categoryId, priority: $priority, userId: $userId, status: $status, dueDate: $dueDate, hasTime: $hasTime, subtasks: $subtasks)';
  }
}

/// @nodoc
abstract mixin class $AddTaskDataCopyWith<$Res> {
  factory $AddTaskDataCopyWith(
          AddTaskData value, $Res Function(AddTaskData) _then) =
      _$AddTaskDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      int localId,
      String title,
      String description,
      String categoryId,
      String priority,
      String userId,
      String status,
      DateTime? dueDate,
      bool hasTime,
      List<AddSubtaskData> subtasks});
}

/// @nodoc
class _$AddTaskDataCopyWithImpl<$Res> implements $AddTaskDataCopyWith<$Res> {
  _$AddTaskDataCopyWithImpl(this._self, this._then);

  final AddTaskData _self;
  final $Res Function(AddTaskData) _then;

  /// Create a copy of AddTaskData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? localId = null,
    Object? title = null,
    Object? description = null,
    Object? categoryId = null,
    Object? priority = null,
    Object? userId = null,
    Object? status = null,
    Object? dueDate = freezed,
    Object? hasTime = null,
    Object? subtasks = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTime: null == hasTime
          ? _self.hasTime
          : hasTime // ignore: cast_nullable_to_non_nullable
              as bool,
      subtasks: null == subtasks
          ? _self.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<AddSubtaskData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AddTaskData implements AddTaskData {
  const _AddTaskData(
      {@JsonKey(name: '_id') required this.id,
      required this.localId,
      required this.title,
      required this.description,
      required this.categoryId,
      required this.priority,
      required this.userId,
      required this.status,
      this.dueDate,
      required this.hasTime,
      required final List<AddSubtaskData> subtasks})
      : _subtasks = subtasks;
  factory _AddTaskData.fromJson(Map<String, dynamic> json) =>
      _$AddTaskDataFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final int localId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String categoryId;
  @override
  final String priority;
  @override
  final String userId;
  @override
  final String status;
  @override
  final DateTime? dueDate;
  @override
  final bool hasTime;
  final List<AddSubtaskData> _subtasks;
  @override
  List<AddSubtaskData> get subtasks {
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtasks);
  }

  /// Create a copy of AddTaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddTaskDataCopyWith<_AddTaskData> get copyWith =>
      __$AddTaskDataCopyWithImpl<_AddTaskData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddTaskDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddTaskData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.hasTime, hasTime) || other.hasTime == hasTime) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      localId,
      title,
      description,
      categoryId,
      priority,
      userId,
      status,
      dueDate,
      hasTime,
      const DeepCollectionEquality().hash(_subtasks));

  @override
  String toString() {
    return 'AddTaskData(id: $id, localId: $localId, title: $title, description: $description, categoryId: $categoryId, priority: $priority, userId: $userId, status: $status, dueDate: $dueDate, hasTime: $hasTime, subtasks: $subtasks)';
  }
}

/// @nodoc
abstract mixin class _$AddTaskDataCopyWith<$Res>
    implements $AddTaskDataCopyWith<$Res> {
  factory _$AddTaskDataCopyWith(
          _AddTaskData value, $Res Function(_AddTaskData) _then) =
      __$AddTaskDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      int localId,
      String title,
      String description,
      String categoryId,
      String priority,
      String userId,
      String status,
      DateTime? dueDate,
      bool hasTime,
      List<AddSubtaskData> subtasks});
}

/// @nodoc
class __$AddTaskDataCopyWithImpl<$Res> implements _$AddTaskDataCopyWith<$Res> {
  __$AddTaskDataCopyWithImpl(this._self, this._then);

  final _AddTaskData _self;
  final $Res Function(_AddTaskData) _then;

  /// Create a copy of AddTaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? localId = null,
    Object? title = null,
    Object? description = null,
    Object? categoryId = null,
    Object? priority = null,
    Object? userId = null,
    Object? status = null,
    Object? dueDate = freezed,
    Object? hasTime = null,
    Object? subtasks = null,
  }) {
    return _then(_AddTaskData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTime: null == hasTime
          ? _self.hasTime
          : hasTime // ignore: cast_nullable_to_non_nullable
              as bool,
      subtasks: null == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<AddSubtaskData>,
    ));
  }
}

// dart format on

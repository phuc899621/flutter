// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddTaskReq {
  String get title;
  int get localId;
  String get description;
  String get categoryId;
  String get priority;
  DateTime? get dueDate;
  bool get hasTime;
  String get status;
  List<AddSubtaskReq> get subtasks;

  /// Create a copy of AddTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddTaskReqCopyWith<AddTaskReq> get copyWith =>
      _$AddTaskReqCopyWithImpl<AddTaskReq>(this as AddTaskReq, _$identity);

  /// Serializes this AddTaskReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddTaskReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.hasTime, hasTime) || other.hasTime == hasTime) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.subtasks, subtasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      localId,
      description,
      categoryId,
      priority,
      dueDate,
      hasTime,
      status,
      const DeepCollectionEquality().hash(subtasks));

  @override
  String toString() {
    return 'AddTaskReq(title: $title, localId: $localId, description: $description, categoryId: $categoryId, priority: $priority, dueDate: $dueDate, hasTime: $hasTime, status: $status, subtasks: $subtasks)';
  }
}

/// @nodoc
abstract mixin class $AddTaskReqCopyWith<$Res> {
  factory $AddTaskReqCopyWith(
          AddTaskReq value, $Res Function(AddTaskReq) _then) =
      _$AddTaskReqCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      int localId,
      String description,
      String categoryId,
      String priority,
      DateTime? dueDate,
      bool hasTime,
      String status,
      List<AddSubtaskReq> subtasks});
}

/// @nodoc
class _$AddTaskReqCopyWithImpl<$Res> implements $AddTaskReqCopyWith<$Res> {
  _$AddTaskReqCopyWithImpl(this._self, this._then);

  final AddTaskReq _self;
  final $Res Function(AddTaskReq) _then;

  /// Create a copy of AddTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? localId = null,
    Object? description = null,
    Object? categoryId = null,
    Object? priority = null,
    Object? dueDate = freezed,
    Object? hasTime = null,
    Object? status = null,
    Object? subtasks = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
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
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTime: null == hasTime
          ? _self.hasTime
          : hasTime // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      subtasks: null == subtasks
          ? _self.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<AddSubtaskReq>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AddTaskReq implements AddTaskReq {
  const _AddTaskReq(
      {required this.title,
      required this.localId,
      required this.description,
      required this.categoryId,
      required this.priority,
      this.dueDate,
      required this.hasTime,
      required this.status,
      required final List<AddSubtaskReq> subtasks})
      : _subtasks = subtasks;
  factory _AddTaskReq.fromJson(Map<String, dynamic> json) =>
      _$AddTaskReqFromJson(json);

  @override
  final String title;
  @override
  final int localId;
  @override
  final String description;
  @override
  final String categoryId;
  @override
  final String priority;
  @override
  final DateTime? dueDate;
  @override
  final bool hasTime;
  @override
  final String status;
  final List<AddSubtaskReq> _subtasks;
  @override
  List<AddSubtaskReq> get subtasks {
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtasks);
  }

  /// Create a copy of AddTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddTaskReqCopyWith<_AddTaskReq> get copyWith =>
      __$AddTaskReqCopyWithImpl<_AddTaskReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddTaskReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddTaskReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.hasTime, hasTime) || other.hasTime == hasTime) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      localId,
      description,
      categoryId,
      priority,
      dueDate,
      hasTime,
      status,
      const DeepCollectionEquality().hash(_subtasks));

  @override
  String toString() {
    return 'AddTaskReq(title: $title, localId: $localId, description: $description, categoryId: $categoryId, priority: $priority, dueDate: $dueDate, hasTime: $hasTime, status: $status, subtasks: $subtasks)';
  }
}

/// @nodoc
abstract mixin class _$AddTaskReqCopyWith<$Res>
    implements $AddTaskReqCopyWith<$Res> {
  factory _$AddTaskReqCopyWith(
          _AddTaskReq value, $Res Function(_AddTaskReq) _then) =
      __$AddTaskReqCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      int localId,
      String description,
      String categoryId,
      String priority,
      DateTime? dueDate,
      bool hasTime,
      String status,
      List<AddSubtaskReq> subtasks});
}

/// @nodoc
class __$AddTaskReqCopyWithImpl<$Res> implements _$AddTaskReqCopyWith<$Res> {
  __$AddTaskReqCopyWithImpl(this._self, this._then);

  final _AddTaskReq _self;
  final $Res Function(_AddTaskReq) _then;

  /// Create a copy of AddTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? localId = null,
    Object? description = null,
    Object? categoryId = null,
    Object? priority = null,
    Object? dueDate = freezed,
    Object? hasTime = null,
    Object? status = null,
    Object? subtasks = null,
  }) {
    return _then(_AddTaskReq(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
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
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTime: null == hasTime
          ? _self.hasTime
          : hasTime // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      subtasks: null == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<AddSubtaskReq>,
    ));
  }
}

// dart format on

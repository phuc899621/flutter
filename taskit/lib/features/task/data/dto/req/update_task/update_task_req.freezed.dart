// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_task_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateTaskReq {
  String? get title;
  String? get description;
  DateTime? get dueDate;
  bool? get hasTime;
  String? get priority;
  String? get status;
  int? get localId;
  List<UpdateSubtaskWithTaskReq>? get subtasks;
  String? get categoryId;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateTaskReqCopyWith<UpdateTaskReq> get copyWith =>
      _$UpdateTaskReqCopyWithImpl<UpdateTaskReq>(
          this as UpdateTaskReq, _$identity);

  /// Serializes this UpdateTaskReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateTaskReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.hasTime, hasTime) || other.hasTime == hasTime) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            const DeepCollectionEquality().equals(other.subtasks, subtasks) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      dueDate,
      hasTime,
      priority,
      status,
      localId,
      const DeepCollectionEquality().hash(subtasks),
      categoryId);

  @override
  String toString() {
    return 'UpdateTaskReq(title: $title, description: $description, dueDate: $dueDate, hasTime: $hasTime, priority: $priority, status: $status, localId: $localId, subtasks: $subtasks, categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class $UpdateTaskReqCopyWith<$Res> {
  factory $UpdateTaskReqCopyWith(
          UpdateTaskReq value, $Res Function(UpdateTaskReq) _then) =
      _$UpdateTaskReqCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      String? description,
      DateTime? dueDate,
      bool? hasTime,
      String? priority,
      String? status,
      int? localId,
      List<UpdateSubtaskWithTaskReq>? subtasks,
      String? categoryId});
}

/// @nodoc
class _$UpdateTaskReqCopyWithImpl<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  _$UpdateTaskReqCopyWithImpl(this._self, this._then);

  final UpdateTaskReq _self;
  final $Res Function(UpdateTaskReq) _then;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? dueDate = freezed,
    Object? hasTime = freezed,
    Object? priority = freezed,
    Object? status = freezed,
    Object? localId = freezed,
    Object? subtasks = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTime: freezed == hasTime
          ? _self.hasTime
          : hasTime // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int?,
      subtasks: freezed == subtasks
          ? _self.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<UpdateSubtaskWithTaskReq>?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTaskReq implements UpdateTaskReq {
  const _UpdateTaskReq(
      {this.title,
      this.description,
      this.dueDate,
      this.hasTime,
      this.priority,
      this.status,
      this.localId,
      final List<UpdateSubtaskWithTaskReq>? subtasks,
      this.categoryId})
      : _subtasks = subtasks;
  factory _UpdateTaskReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskReqFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  final DateTime? dueDate;
  @override
  final bool? hasTime;
  @override
  final String? priority;
  @override
  final String? status;
  @override
  final int? localId;
  final List<UpdateSubtaskWithTaskReq>? _subtasks;
  @override
  List<UpdateSubtaskWithTaskReq>? get subtasks {
    final value = _subtasks;
    if (value == null) return null;
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? categoryId;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskReqCopyWith<_UpdateTaskReq> get copyWith =>
      __$UpdateTaskReqCopyWithImpl<_UpdateTaskReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTaskReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.hasTime, hasTime) || other.hasTime == hasTime) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      dueDate,
      hasTime,
      priority,
      status,
      localId,
      const DeepCollectionEquality().hash(_subtasks),
      categoryId);

  @override
  String toString() {
    return 'UpdateTaskReq(title: $title, description: $description, dueDate: $dueDate, hasTime: $hasTime, priority: $priority, status: $status, localId: $localId, subtasks: $subtasks, categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskReqCopyWith<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskReqCopyWith(
          _UpdateTaskReq value, $Res Function(_UpdateTaskReq) _then) =
      __$UpdateTaskReqCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      String? description,
      DateTime? dueDate,
      bool? hasTime,
      String? priority,
      String? status,
      int? localId,
      List<UpdateSubtaskWithTaskReq>? subtasks,
      String? categoryId});
}

/// @nodoc
class __$UpdateTaskReqCopyWithImpl<$Res>
    implements _$UpdateTaskReqCopyWith<$Res> {
  __$UpdateTaskReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskReq _self;
  final $Res Function(_UpdateTaskReq) _then;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? dueDate = freezed,
    Object? hasTime = freezed,
    Object? priority = freezed,
    Object? status = freezed,
    Object? localId = freezed,
    Object? subtasks = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_UpdateTaskReq(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTime: freezed == hasTime
          ? _self.hasTime
          : hasTime // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int?,
      subtasks: freezed == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<UpdateSubtaskWithTaskReq>?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

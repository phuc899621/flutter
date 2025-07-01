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
UpdateTaskReq _$UpdateTaskReqFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'full':
      return _UpdateTaskFullReq.fromJson(json);
    case 'titleOnly':
      return _UpdateTaskTitleOnlyReq.fromJson(json);
    case 'statusOnly':
      return _UpdateTaskStatusOnlyReq.fromJson(json);
    case 'priorityOnly':
      return _UpdateTaskPriorityOnlyReq.fromJson(json);
    case 'dueDateOnly':
      return _UpdateTaskDueDateOnlyReq.fromJson(json);
    case 'hasTimeOnly':
      return _UpdateTaskHasTimeOnlyReq.fromJson(json);
    case 'descriptionOnly':
      return _UpdateTaskDescriptionOnlyReq.fromJson(json);
    case 'categoryIdOnly':
      return _UpdateTaskCategoryIdOnlyReq.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UpdateTaskReq',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UpdateTaskReq {
  int get localId;

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
            (identical(other.localId, localId) || other.localId == localId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localId);

  @override
  String toString() {
    return 'UpdateTaskReq(localId: $localId)';
  }
}

/// @nodoc
abstract mixin class $UpdateTaskReqCopyWith<$Res> {
  factory $UpdateTaskReqCopyWith(
          UpdateTaskReq value, $Res Function(UpdateTaskReq) _then) =
      _$UpdateTaskReqCopyWithImpl;
  @useResult
  $Res call({int localId});
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
    Object? localId = null,
  }) {
    return _then(_self.copyWith(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTaskFullReq implements UpdateTaskReq {
  const _UpdateTaskFullReq(
      {this.title,
      this.description,
      this.dueDate,
      this.hasTime,
      this.priority,
      this.status,
      required this.localId,
      final List<UpdateSubtaskReq>? subtasks,
      this.categoryId,
      final String? $type})
      : _subtasks = subtasks,
        $type = $type ?? 'full';
  factory _UpdateTaskFullReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskFullReqFromJson(json);

  final String? title;
  final String? description;
  final DateTime? dueDate;
  final bool? hasTime;
  final String? priority;
  final String? status;
  @override
  final int localId;
  final List<UpdateSubtaskReq>? _subtasks;
  List<UpdateSubtaskReq>? get subtasks {
    final value = _subtasks;
    if (value == null) return null;
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final String? categoryId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskFullReqCopyWith<_UpdateTaskFullReq> get copyWith =>
      __$UpdateTaskFullReqCopyWithImpl<_UpdateTaskFullReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTaskFullReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskFullReq &&
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
    return 'UpdateTaskReq.full(title: $title, description: $description, dueDate: $dueDate, hasTime: $hasTime, priority: $priority, status: $status, localId: $localId, subtasks: $subtasks, categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskFullReqCopyWith<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskFullReqCopyWith(
          _UpdateTaskFullReq value, $Res Function(_UpdateTaskFullReq) _then) =
      __$UpdateTaskFullReqCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      String? description,
      DateTime? dueDate,
      bool? hasTime,
      String? priority,
      String? status,
      int localId,
      List<UpdateSubtaskReq>? subtasks,
      String? categoryId});
}

/// @nodoc
class __$UpdateTaskFullReqCopyWithImpl<$Res>
    implements _$UpdateTaskFullReqCopyWith<$Res> {
  __$UpdateTaskFullReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskFullReq _self;
  final $Res Function(_UpdateTaskFullReq) _then;

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
    Object? localId = null,
    Object? subtasks = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_UpdateTaskFullReq(
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
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      subtasks: freezed == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<UpdateSubtaskReq>?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTaskTitleOnlyReq implements UpdateTaskReq {
  const _UpdateTaskTitleOnlyReq(
      {required this.localId, required this.title, final String? $type})
      : $type = $type ?? 'titleOnly';
  factory _UpdateTaskTitleOnlyReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskTitleOnlyReqFromJson(json);

  @override
  final int localId;
  final String title;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskTitleOnlyReqCopyWith<_UpdateTaskTitleOnlyReq> get copyWith =>
      __$UpdateTaskTitleOnlyReqCopyWithImpl<_UpdateTaskTitleOnlyReq>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTaskTitleOnlyReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskTitleOnlyReq &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localId, title);

  @override
  String toString() {
    return 'UpdateTaskReq.titleOnly(localId: $localId, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskTitleOnlyReqCopyWith<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskTitleOnlyReqCopyWith(_UpdateTaskTitleOnlyReq value,
          $Res Function(_UpdateTaskTitleOnlyReq) _then) =
      __$UpdateTaskTitleOnlyReqCopyWithImpl;
  @override
  @useResult
  $Res call({int localId, String title});
}

/// @nodoc
class __$UpdateTaskTitleOnlyReqCopyWithImpl<$Res>
    implements _$UpdateTaskTitleOnlyReqCopyWith<$Res> {
  __$UpdateTaskTitleOnlyReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskTitleOnlyReq _self;
  final $Res Function(_UpdateTaskTitleOnlyReq) _then;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = null,
    Object? title = null,
  }) {
    return _then(_UpdateTaskTitleOnlyReq(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTaskStatusOnlyReq implements UpdateTaskReq {
  const _UpdateTaskStatusOnlyReq(
      {required this.localId, required this.status, final String? $type})
      : $type = $type ?? 'statusOnly';
  factory _UpdateTaskStatusOnlyReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskStatusOnlyReqFromJson(json);

  @override
  final int localId;
  final String status;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskStatusOnlyReqCopyWith<_UpdateTaskStatusOnlyReq> get copyWith =>
      __$UpdateTaskStatusOnlyReqCopyWithImpl<_UpdateTaskStatusOnlyReq>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTaskStatusOnlyReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskStatusOnlyReq &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localId, status);

  @override
  String toString() {
    return 'UpdateTaskReq.statusOnly(localId: $localId, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskStatusOnlyReqCopyWith<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskStatusOnlyReqCopyWith(_UpdateTaskStatusOnlyReq value,
          $Res Function(_UpdateTaskStatusOnlyReq) _then) =
      __$UpdateTaskStatusOnlyReqCopyWithImpl;
  @override
  @useResult
  $Res call({int localId, String status});
}

/// @nodoc
class __$UpdateTaskStatusOnlyReqCopyWithImpl<$Res>
    implements _$UpdateTaskStatusOnlyReqCopyWith<$Res> {
  __$UpdateTaskStatusOnlyReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskStatusOnlyReq _self;
  final $Res Function(_UpdateTaskStatusOnlyReq) _then;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = null,
    Object? status = null,
  }) {
    return _then(_UpdateTaskStatusOnlyReq(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTaskPriorityOnlyReq implements UpdateTaskReq {
  const _UpdateTaskPriorityOnlyReq(
      {required this.localId, required this.priority, final String? $type})
      : $type = $type ?? 'priorityOnly';
  factory _UpdateTaskPriorityOnlyReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskPriorityOnlyReqFromJson(json);

  @override
  final int localId;
  final String priority;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskPriorityOnlyReqCopyWith<_UpdateTaskPriorityOnlyReq>
      get copyWith =>
          __$UpdateTaskPriorityOnlyReqCopyWithImpl<_UpdateTaskPriorityOnlyReq>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTaskPriorityOnlyReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskPriorityOnlyReq &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localId, priority);

  @override
  String toString() {
    return 'UpdateTaskReq.priorityOnly(localId: $localId, priority: $priority)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskPriorityOnlyReqCopyWith<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskPriorityOnlyReqCopyWith(_UpdateTaskPriorityOnlyReq value,
          $Res Function(_UpdateTaskPriorityOnlyReq) _then) =
      __$UpdateTaskPriorityOnlyReqCopyWithImpl;
  @override
  @useResult
  $Res call({int localId, String priority});
}

/// @nodoc
class __$UpdateTaskPriorityOnlyReqCopyWithImpl<$Res>
    implements _$UpdateTaskPriorityOnlyReqCopyWith<$Res> {
  __$UpdateTaskPriorityOnlyReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskPriorityOnlyReq _self;
  final $Res Function(_UpdateTaskPriorityOnlyReq) _then;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = null,
    Object? priority = null,
  }) {
    return _then(_UpdateTaskPriorityOnlyReq(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTaskDueDateOnlyReq implements UpdateTaskReq {
  const _UpdateTaskDueDateOnlyReq(
      {required this.localId, this.dueDate, final String? $type})
      : $type = $type ?? 'dueDateOnly';
  factory _UpdateTaskDueDateOnlyReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskDueDateOnlyReqFromJson(json);

  @override
  final int localId;
  final DateTime? dueDate;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskDueDateOnlyReqCopyWith<_UpdateTaskDueDateOnlyReq> get copyWith =>
      __$UpdateTaskDueDateOnlyReqCopyWithImpl<_UpdateTaskDueDateOnlyReq>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTaskDueDateOnlyReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskDueDateOnlyReq &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localId, dueDate);

  @override
  String toString() {
    return 'UpdateTaskReq.dueDateOnly(localId: $localId, dueDate: $dueDate)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskDueDateOnlyReqCopyWith<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskDueDateOnlyReqCopyWith(_UpdateTaskDueDateOnlyReq value,
          $Res Function(_UpdateTaskDueDateOnlyReq) _then) =
      __$UpdateTaskDueDateOnlyReqCopyWithImpl;
  @override
  @useResult
  $Res call({int localId, DateTime? dueDate});
}

/// @nodoc
class __$UpdateTaskDueDateOnlyReqCopyWithImpl<$Res>
    implements _$UpdateTaskDueDateOnlyReqCopyWith<$Res> {
  __$UpdateTaskDueDateOnlyReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskDueDateOnlyReq _self;
  final $Res Function(_UpdateTaskDueDateOnlyReq) _then;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = null,
    Object? dueDate = freezed,
  }) {
    return _then(_UpdateTaskDueDateOnlyReq(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTaskHasTimeOnlyReq implements UpdateTaskReq {
  const _UpdateTaskHasTimeOnlyReq(
      {required this.localId, required this.hasTime, final String? $type})
      : $type = $type ?? 'hasTimeOnly';
  factory _UpdateTaskHasTimeOnlyReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskHasTimeOnlyReqFromJson(json);

  @override
  final int localId;
  final bool hasTime;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskHasTimeOnlyReqCopyWith<_UpdateTaskHasTimeOnlyReq> get copyWith =>
      __$UpdateTaskHasTimeOnlyReqCopyWithImpl<_UpdateTaskHasTimeOnlyReq>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTaskHasTimeOnlyReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskHasTimeOnlyReq &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.hasTime, hasTime) || other.hasTime == hasTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localId, hasTime);

  @override
  String toString() {
    return 'UpdateTaskReq.hasTimeOnly(localId: $localId, hasTime: $hasTime)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskHasTimeOnlyReqCopyWith<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskHasTimeOnlyReqCopyWith(_UpdateTaskHasTimeOnlyReq value,
          $Res Function(_UpdateTaskHasTimeOnlyReq) _then) =
      __$UpdateTaskHasTimeOnlyReqCopyWithImpl;
  @override
  @useResult
  $Res call({int localId, bool hasTime});
}

/// @nodoc
class __$UpdateTaskHasTimeOnlyReqCopyWithImpl<$Res>
    implements _$UpdateTaskHasTimeOnlyReqCopyWith<$Res> {
  __$UpdateTaskHasTimeOnlyReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskHasTimeOnlyReq _self;
  final $Res Function(_UpdateTaskHasTimeOnlyReq) _then;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = null,
    Object? hasTime = null,
  }) {
    return _then(_UpdateTaskHasTimeOnlyReq(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      hasTime: null == hasTime
          ? _self.hasTime
          : hasTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTaskDescriptionOnlyReq implements UpdateTaskReq {
  const _UpdateTaskDescriptionOnlyReq(
      {required this.localId, required this.description, final String? $type})
      : $type = $type ?? 'descriptionOnly';
  factory _UpdateTaskDescriptionOnlyReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskDescriptionOnlyReqFromJson(json);

  @override
  final int localId;
  final String description;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskDescriptionOnlyReqCopyWith<_UpdateTaskDescriptionOnlyReq>
      get copyWith => __$UpdateTaskDescriptionOnlyReqCopyWithImpl<
          _UpdateTaskDescriptionOnlyReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTaskDescriptionOnlyReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskDescriptionOnlyReq &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localId, description);

  @override
  String toString() {
    return 'UpdateTaskReq.descriptionOnly(localId: $localId, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskDescriptionOnlyReqCopyWith<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskDescriptionOnlyReqCopyWith(
          _UpdateTaskDescriptionOnlyReq value,
          $Res Function(_UpdateTaskDescriptionOnlyReq) _then) =
      __$UpdateTaskDescriptionOnlyReqCopyWithImpl;
  @override
  @useResult
  $Res call({int localId, String description});
}

/// @nodoc
class __$UpdateTaskDescriptionOnlyReqCopyWithImpl<$Res>
    implements _$UpdateTaskDescriptionOnlyReqCopyWith<$Res> {
  __$UpdateTaskDescriptionOnlyReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskDescriptionOnlyReq _self;
  final $Res Function(_UpdateTaskDescriptionOnlyReq) _then;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = null,
    Object? description = null,
  }) {
    return _then(_UpdateTaskDescriptionOnlyReq(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTaskCategoryIdOnlyReq implements UpdateTaskReq {
  const _UpdateTaskCategoryIdOnlyReq(
      {required this.localId, required this.categoryId, final String? $type})
      : $type = $type ?? 'categoryIdOnly';
  factory _UpdateTaskCategoryIdOnlyReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskCategoryIdOnlyReqFromJson(json);

  @override
  final int localId;
  final String categoryId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskCategoryIdOnlyReqCopyWith<_UpdateTaskCategoryIdOnlyReq>
      get copyWith => __$UpdateTaskCategoryIdOnlyReqCopyWithImpl<
          _UpdateTaskCategoryIdOnlyReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTaskCategoryIdOnlyReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskCategoryIdOnlyReq &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localId, categoryId);

  @override
  String toString() {
    return 'UpdateTaskReq.categoryIdOnly(localId: $localId, categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskCategoryIdOnlyReqCopyWith<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskCategoryIdOnlyReqCopyWith(
          _UpdateTaskCategoryIdOnlyReq value,
          $Res Function(_UpdateTaskCategoryIdOnlyReq) _then) =
      __$UpdateTaskCategoryIdOnlyReqCopyWithImpl;
  @override
  @useResult
  $Res call({int localId, String categoryId});
}

/// @nodoc
class __$UpdateTaskCategoryIdOnlyReqCopyWithImpl<$Res>
    implements _$UpdateTaskCategoryIdOnlyReqCopyWith<$Res> {
  __$UpdateTaskCategoryIdOnlyReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskCategoryIdOnlyReq _self;
  final $Res Function(_UpdateTaskCategoryIdOnlyReq) _then;

  /// Create a copy of UpdateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = null,
    Object? categoryId = null,
  }) {
    return _then(_UpdateTaskCategoryIdOnlyReq(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

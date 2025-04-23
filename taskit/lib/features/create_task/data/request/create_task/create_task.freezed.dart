// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTaskReq {
  String get title;
  String get description;
  String get category;
  String get priority;
  DateTime get dueDate;
  List<SubtaskReq> get subtasks;

  /// Create a copy of CreateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateTaskReqCopyWith<CreateTaskReq> get copyWith =>
      _$CreateTaskReqCopyWithImpl<CreateTaskReq>(
          this as CreateTaskReq, _$identity);

  /// Serializes this CreateTaskReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTaskReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality().equals(other.subtasks, subtasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, category,
      priority, dueDate, const DeepCollectionEquality().hash(subtasks));

  @override
  String toString() {
    return 'CreateTaskReq(title: $title, description: $description, category: $category, priority: $priority, dueDate: $dueDate, subtasks: $subtasks)';
  }
}

/// @nodoc
abstract mixin class $CreateTaskReqCopyWith<$Res> {
  factory $CreateTaskReqCopyWith(
          CreateTaskReq value, $Res Function(CreateTaskReq) _then) =
      _$CreateTaskReqCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String description,
      String category,
      String priority,
      DateTime dueDate,
      List<SubtaskReq> subtasks});
}

/// @nodoc
class _$CreateTaskReqCopyWithImpl<$Res>
    implements $CreateTaskReqCopyWith<$Res> {
  _$CreateTaskReqCopyWithImpl(this._self, this._then);

  final CreateTaskReq _self;
  final $Res Function(CreateTaskReq) _then;

  /// Create a copy of CreateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? dueDate = null,
    Object? subtasks = null,
  }) {
    return _then(_self.copyWith(
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
      dueDate: null == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtasks: null == subtasks
          ? _self.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskReq>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CreateTaskReq implements CreateTaskReq {
  const _CreateTaskReq(
      {required this.title,
      required this.description,
      required this.category,
      required this.priority,
      required this.dueDate,
      required final List<SubtaskReq> subtasks})
      : _subtasks = subtasks;
  factory _CreateTaskReq.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskReqFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final String priority;
  @override
  final DateTime dueDate;
  final List<SubtaskReq> _subtasks;
  @override
  List<SubtaskReq> get subtasks {
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtasks);
  }

  /// Create a copy of CreateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateTaskReqCopyWith<_CreateTaskReq> get copyWith =>
      __$CreateTaskReqCopyWithImpl<_CreateTaskReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateTaskReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateTaskReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, category,
      priority, dueDate, const DeepCollectionEquality().hash(_subtasks));

  @override
  String toString() {
    return 'CreateTaskReq(title: $title, description: $description, category: $category, priority: $priority, dueDate: $dueDate, subtasks: $subtasks)';
  }
}

/// @nodoc
abstract mixin class _$CreateTaskReqCopyWith<$Res>
    implements $CreateTaskReqCopyWith<$Res> {
  factory _$CreateTaskReqCopyWith(
          _CreateTaskReq value, $Res Function(_CreateTaskReq) _then) =
      __$CreateTaskReqCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String category,
      String priority,
      DateTime dueDate,
      List<SubtaskReq> subtasks});
}

/// @nodoc
class __$CreateTaskReqCopyWithImpl<$Res>
    implements _$CreateTaskReqCopyWith<$Res> {
  __$CreateTaskReqCopyWithImpl(this._self, this._then);

  final _CreateTaskReq _self;
  final $Res Function(_CreateTaskReq) _then;

  /// Create a copy of CreateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? dueDate = null,
    Object? subtasks = null,
  }) {
    return _then(_CreateTaskReq(
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
      dueDate: null == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtasks: null == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskReq>,
    ));
  }
}

// dart format on

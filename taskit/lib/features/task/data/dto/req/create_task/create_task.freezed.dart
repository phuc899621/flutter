// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateTaskReq _$CreateTaskReqFromJson(Map<String, dynamic> json) {
  return _CreateTaskReq.fromJson(json);
}

/// @nodoc
mixin _$CreateTaskReq {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  List<SubtaskReq> get subtasks => throw _privateConstructorUsedError;

  /// Serializes this CreateTaskReq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTaskReqCopyWith<CreateTaskReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTaskReqCopyWith<$Res> {
  factory $CreateTaskReqCopyWith(
          CreateTaskReq value, $Res Function(CreateTaskReq) then) =
      _$CreateTaskReqCopyWithImpl<$Res, CreateTaskReq>;
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
class _$CreateTaskReqCopyWithImpl<$Res, $Val extends CreateTaskReq>
    implements $CreateTaskReqCopyWith<$Res> {
  _$CreateTaskReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtasks: null == subtasks
          ? _value.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskReq>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTaskReqImplCopyWith<$Res>
    implements $CreateTaskReqCopyWith<$Res> {
  factory _$$CreateTaskReqImplCopyWith(
          _$CreateTaskReqImpl value, $Res Function(_$CreateTaskReqImpl) then) =
      __$$CreateTaskReqImplCopyWithImpl<$Res>;
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
class __$$CreateTaskReqImplCopyWithImpl<$Res>
    extends _$CreateTaskReqCopyWithImpl<$Res, _$CreateTaskReqImpl>
    implements _$$CreateTaskReqImplCopyWith<$Res> {
  __$$CreateTaskReqImplCopyWithImpl(
      _$CreateTaskReqImpl _value, $Res Function(_$CreateTaskReqImpl) _then)
      : super(_value, _then);

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
    return _then(_$CreateTaskReqImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtasks: null == subtasks
          ? _value._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskReq>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTaskReqImpl implements _CreateTaskReq {
  const _$CreateTaskReqImpl(
      {required this.title,
      required this.description,
      required this.category,
      required this.priority,
      required this.dueDate,
      required final List<SubtaskReq> subtasks})
      : _subtasks = subtasks;

  factory _$CreateTaskReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTaskReqImplFromJson(json);

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

  @override
  String toString() {
    return 'CreateTaskReq(title: $title, description: $description, category: $category, priority: $priority, dueDate: $dueDate, subtasks: $subtasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTaskReqImpl &&
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

  /// Create a copy of CreateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTaskReqImplCopyWith<_$CreateTaskReqImpl> get copyWith =>
      __$$CreateTaskReqImplCopyWithImpl<_$CreateTaskReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTaskReqImplToJson(
      this,
    );
  }
}

abstract class _CreateTaskReq implements CreateTaskReq {
  const factory _CreateTaskReq(
      {required final String title,
      required final String description,
      required final String category,
      required final String priority,
      required final DateTime dueDate,
      required final List<SubtaskReq> subtasks}) = _$CreateTaskReqImpl;

  factory _CreateTaskReq.fromJson(Map<String, dynamic> json) =
      _$CreateTaskReqImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  String get priority;
  @override
  DateTime get dueDate;
  @override
  List<SubtaskReq> get subtasks;

  /// Create a copy of CreateTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTaskReqImplCopyWith<_$CreateTaskReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

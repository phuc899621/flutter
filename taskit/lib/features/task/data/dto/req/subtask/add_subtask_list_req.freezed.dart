// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_subtask_list_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddSubtaskListReq {
  List<AddSubtaskReq> get subtasks;

  /// Create a copy of AddSubtaskListReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddSubtaskListReqCopyWith<AddSubtaskListReq> get copyWith =>
      _$AddSubtaskListReqCopyWithImpl<AddSubtaskListReq>(
          this as AddSubtaskListReq, _$identity);

  /// Serializes this AddSubtaskListReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddSubtaskListReq &&
            const DeepCollectionEquality().equals(other.subtasks, subtasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(subtasks));

  @override
  String toString() {
    return 'AddSubtaskListReq(subtasks: $subtasks)';
  }
}

/// @nodoc
abstract mixin class $AddSubtaskListReqCopyWith<$Res> {
  factory $AddSubtaskListReqCopyWith(
          AddSubtaskListReq value, $Res Function(AddSubtaskListReq) _then) =
      _$AddSubtaskListReqCopyWithImpl;
  @useResult
  $Res call({List<AddSubtaskReq> subtasks});
}

/// @nodoc
class _$AddSubtaskListReqCopyWithImpl<$Res>
    implements $AddSubtaskListReqCopyWith<$Res> {
  _$AddSubtaskListReqCopyWithImpl(this._self, this._then);

  final AddSubtaskListReq _self;
  final $Res Function(AddSubtaskListReq) _then;

  /// Create a copy of AddSubtaskListReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtasks = null,
  }) {
    return _then(_self.copyWith(
      subtasks: null == subtasks
          ? _self.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<AddSubtaskReq>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AddSubtaskListReq implements AddSubtaskListReq {
  const _AddSubtaskListReq({required final List<AddSubtaskReq> subtasks})
      : _subtasks = subtasks;
  factory _AddSubtaskListReq.fromJson(Map<String, dynamic> json) =>
      _$AddSubtaskListReqFromJson(json);

  final List<AddSubtaskReq> _subtasks;
  @override
  List<AddSubtaskReq> get subtasks {
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtasks);
  }

  /// Create a copy of AddSubtaskListReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddSubtaskListReqCopyWith<_AddSubtaskListReq> get copyWith =>
      __$AddSubtaskListReqCopyWithImpl<_AddSubtaskListReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddSubtaskListReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddSubtaskListReq &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_subtasks));

  @override
  String toString() {
    return 'AddSubtaskListReq(subtasks: $subtasks)';
  }
}

/// @nodoc
abstract mixin class _$AddSubtaskListReqCopyWith<$Res>
    implements $AddSubtaskListReqCopyWith<$Res> {
  factory _$AddSubtaskListReqCopyWith(
          _AddSubtaskListReq value, $Res Function(_AddSubtaskListReq) _then) =
      __$AddSubtaskListReqCopyWithImpl;
  @override
  @useResult
  $Res call({List<AddSubtaskReq> subtasks});
}

/// @nodoc
class __$AddSubtaskListReqCopyWithImpl<$Res>
    implements _$AddSubtaskListReqCopyWith<$Res> {
  __$AddSubtaskListReqCopyWithImpl(this._self, this._then);

  final _AddSubtaskListReq _self;
  final $Res Function(_AddSubtaskListReq) _then;

  /// Create a copy of AddSubtaskListReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subtasks = null,
  }) {
    return _then(_AddSubtaskListReq(
      subtasks: null == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<AddSubtaskReq>,
    ));
  }
}

// dart format on

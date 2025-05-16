// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubtaskReq _$SubtaskReqFromJson(Map<String, dynamic> json) {
  return _SubtaskReq.fromJson(json);
}

/// @nodoc
mixin _$SubtaskReq {
  String get title => throw _privateConstructorUsedError;

  /// Serializes this SubtaskReq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtaskReqCopyWith<SubtaskReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtaskReqCopyWith<$Res> {
  factory $SubtaskReqCopyWith(
          SubtaskReq value, $Res Function(SubtaskReq) then) =
      _$SubtaskReqCopyWithImpl<$Res, SubtaskReq>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$SubtaskReqCopyWithImpl<$Res, $Val extends SubtaskReq>
    implements $SubtaskReqCopyWith<$Res> {
  _$SubtaskReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubtaskReqImplCopyWith<$Res>
    implements $SubtaskReqCopyWith<$Res> {
  factory _$$SubtaskReqImplCopyWith(
          _$SubtaskReqImpl value, $Res Function(_$SubtaskReqImpl) then) =
      __$$SubtaskReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$SubtaskReqImplCopyWithImpl<$Res>
    extends _$SubtaskReqCopyWithImpl<$Res, _$SubtaskReqImpl>
    implements _$$SubtaskReqImplCopyWith<$Res> {
  __$$SubtaskReqImplCopyWithImpl(
      _$SubtaskReqImpl _value, $Res Function(_$SubtaskReqImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$SubtaskReqImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtaskReqImpl implements _SubtaskReq {
  const _$SubtaskReqImpl({required this.title});

  factory _$SubtaskReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtaskReqImplFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'SubtaskReq(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtaskReqImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of SubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtaskReqImplCopyWith<_$SubtaskReqImpl> get copyWith =>
      __$$SubtaskReqImplCopyWithImpl<_$SubtaskReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtaskReqImplToJson(
      this,
    );
  }
}

abstract class _SubtaskReq implements SubtaskReq {
  const factory _SubtaskReq({required final String title}) = _$SubtaskReqImpl;

  factory _SubtaskReq.fromJson(Map<String, dynamic> json) =
      _$SubtaskReqImpl.fromJson;

  @override
  String get title;

  /// Create a copy of SubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtaskReqImplCopyWith<_$SubtaskReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

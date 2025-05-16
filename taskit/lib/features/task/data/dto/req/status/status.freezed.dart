// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatusReq _$StatusReqFromJson(Map<String, dynamic> json) {
  return _StatusReq.fromJson(json);
}

/// @nodoc
mixin _$StatusReq {
  String get status => throw _privateConstructorUsedError;

  /// Serializes this StatusReq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusReqCopyWith<StatusReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusReqCopyWith<$Res> {
  factory $StatusReqCopyWith(StatusReq value, $Res Function(StatusReq) then) =
      _$StatusReqCopyWithImpl<$Res, StatusReq>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$StatusReqCopyWithImpl<$Res, $Val extends StatusReq>
    implements $StatusReqCopyWith<$Res> {
  _$StatusReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusReqImplCopyWith<$Res>
    implements $StatusReqCopyWith<$Res> {
  factory _$$StatusReqImplCopyWith(
          _$StatusReqImpl value, $Res Function(_$StatusReqImpl) then) =
      __$$StatusReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$StatusReqImplCopyWithImpl<$Res>
    extends _$StatusReqCopyWithImpl<$Res, _$StatusReqImpl>
    implements _$$StatusReqImplCopyWith<$Res> {
  __$$StatusReqImplCopyWithImpl(
      _$StatusReqImpl _value, $Res Function(_$StatusReqImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatusReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$StatusReqImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusReqImpl implements _StatusReq {
  const _$StatusReqImpl({required this.status});

  factory _$StatusReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusReqImplFromJson(json);

  @override
  final String status;

  @override
  String toString() {
    return 'StatusReq(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusReqImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of StatusReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusReqImplCopyWith<_$StatusReqImpl> get copyWith =>
      __$$StatusReqImplCopyWithImpl<_$StatusReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusReqImplToJson(
      this,
    );
  }
}

abstract class _StatusReq implements StatusReq {
  const factory _StatusReq({required final String status}) = _$StatusReqImpl;

  factory _StatusReq.fromJson(Map<String, dynamic> json) =
      _$StatusReqImpl.fromJson;

  @override
  String get status;

  /// Create a copy of StatusReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusReqImplCopyWith<_$StatusReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

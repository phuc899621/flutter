// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatusReq {
  String get status;

  /// Create a copy of StatusReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatusReqCopyWith<StatusReq> get copyWith =>
      _$StatusReqCopyWithImpl<StatusReq>(this as StatusReq, _$identity);

  /// Serializes this StatusReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatusReq &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'StatusReq(status: $status)';
  }
}

/// @nodoc
abstract mixin class $StatusReqCopyWith<$Res> {
  factory $StatusReqCopyWith(StatusReq value, $Res Function(StatusReq) _then) =
      _$StatusReqCopyWithImpl;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$StatusReqCopyWithImpl<$Res> implements $StatusReqCopyWith<$Res> {
  _$StatusReqCopyWithImpl(this._self, this._then);

  final StatusReq _self;
  final $Res Function(StatusReq) _then;

  /// Create a copy of StatusReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _StatusReq implements StatusReq {
  const _StatusReq({required this.status});
  factory _StatusReq.fromJson(Map<String, dynamic> json) =>
      _$StatusReqFromJson(json);

  @override
  final String status;

  /// Create a copy of StatusReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatusReqCopyWith<_StatusReq> get copyWith =>
      __$StatusReqCopyWithImpl<_StatusReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatusReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatusReq &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'StatusReq(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$StatusReqCopyWith<$Res>
    implements $StatusReqCopyWith<$Res> {
  factory _$StatusReqCopyWith(
          _StatusReq value, $Res Function(_StatusReq) _then) =
      __$StatusReqCopyWithImpl;
  @override
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$StatusReqCopyWithImpl<$Res> implements _$StatusReqCopyWith<$Res> {
  __$StatusReqCopyWithImpl(this._self, this._then);

  final _StatusReq _self;
  final $Res Function(_StatusReq) _then;

  /// Create a copy of StatusReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_StatusReq(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

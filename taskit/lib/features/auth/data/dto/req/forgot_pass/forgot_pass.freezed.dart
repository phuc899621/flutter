// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPassRequest {
  String get email;

  /// Create a copy of ForgotPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForgotPassRequestCopyWith<ForgotPassRequest> get copyWith =>
      _$ForgotPassRequestCopyWithImpl<ForgotPassRequest>(
          this as ForgotPassRequest, _$identity);

  /// Serializes this ForgotPassRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForgotPassRequest &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'ForgotPassRequest(email: $email)';
  }
}

/// @nodoc
abstract mixin class $ForgotPassRequestCopyWith<$Res> {
  factory $ForgotPassRequestCopyWith(
          ForgotPassRequest value, $Res Function(ForgotPassRequest) _then) =
      _$ForgotPassRequestCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPassRequestCopyWithImpl<$Res>
    implements $ForgotPassRequestCopyWith<$Res> {
  _$ForgotPassRequestCopyWithImpl(this._self, this._then);

  final ForgotPassRequest _self;
  final $Res Function(ForgotPassRequest) _then;

  /// Create a copy of ForgotPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ForgotPassRequest implements ForgotPassRequest {
  const _ForgotPassRequest({required this.email});
  factory _ForgotPassRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPassRequestFromJson(json);

  @override
  final String email;

  /// Create a copy of ForgotPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPassRequestCopyWith<_ForgotPassRequest> get copyWith =>
      __$ForgotPassRequestCopyWithImpl<_ForgotPassRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForgotPassRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPassRequest &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'ForgotPassRequest(email: $email)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPassRequestCopyWith<$Res>
    implements $ForgotPassRequestCopyWith<$Res> {
  factory _$ForgotPassRequestCopyWith(
          _ForgotPassRequest value, $Res Function(_ForgotPassRequest) _then) =
      __$ForgotPassRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$ForgotPassRequestCopyWithImpl<$Res>
    implements _$ForgotPassRequestCopyWith<$Res> {
  __$ForgotPassRequestCopyWithImpl(this._self, this._then);

  final _ForgotPassRequest _self;
  final $Res Function(_ForgotPassRequest) _then;

  /// Create a copy of ForgotPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(_ForgotPassRequest(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

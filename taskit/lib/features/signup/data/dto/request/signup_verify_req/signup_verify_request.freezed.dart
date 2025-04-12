// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_verify_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupVerifyRequest {
  String get email;
  String get otp;

  /// Create a copy of SignupVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignupVerifyRequestCopyWith<SignupVerifyRequest> get copyWith =>
      _$SignupVerifyRequestCopyWithImpl<SignupVerifyRequest>(
          this as SignupVerifyRequest, _$identity);

  /// Serializes this SignupVerifyRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignupVerifyRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  @override
  String toString() {
    return 'SignupVerifyRequest(email: $email, otp: $otp)';
  }
}

/// @nodoc
abstract mixin class $SignupVerifyRequestCopyWith<$Res> {
  factory $SignupVerifyRequestCopyWith(
          SignupVerifyRequest value, $Res Function(SignupVerifyRequest) _then) =
      _$SignupVerifyRequestCopyWithImpl;
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class _$SignupVerifyRequestCopyWithImpl<$Res>
    implements $SignupVerifyRequestCopyWith<$Res> {
  _$SignupVerifyRequestCopyWithImpl(this._self, this._then);

  final SignupVerifyRequest _self;
  final $Res Function(SignupVerifyRequest) _then;

  /// Create a copy of SignupVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? otp = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SignupVerifyRequest implements SignupVerifyRequest {
  const _SignupVerifyRequest({required this.email, required this.otp});
  factory _SignupVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupVerifyRequestFromJson(json);

  @override
  final String email;
  @override
  final String otp;

  /// Create a copy of SignupVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignupVerifyRequestCopyWith<_SignupVerifyRequest> get copyWith =>
      __$SignupVerifyRequestCopyWithImpl<_SignupVerifyRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignupVerifyRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignupVerifyRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  @override
  String toString() {
    return 'SignupVerifyRequest(email: $email, otp: $otp)';
  }
}

/// @nodoc
abstract mixin class _$SignupVerifyRequestCopyWith<$Res>
    implements $SignupVerifyRequestCopyWith<$Res> {
  factory _$SignupVerifyRequestCopyWith(_SignupVerifyRequest value,
          $Res Function(_SignupVerifyRequest) _then) =
      __$SignupVerifyRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class __$SignupVerifyRequestCopyWithImpl<$Res>
    implements _$SignupVerifyRequestCopyWith<$Res> {
  __$SignupVerifyRequestCopyWithImpl(this._self, this._then);

  final _SignupVerifyRequest _self;
  final $Res Function(_SignupVerifyRequest) _then;

  /// Create a copy of SignupVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? otp = null,
  }) {
    return _then(_SignupVerifyRequest(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

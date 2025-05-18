// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_verify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPassVerifyRequest {
  String get email;
  String get otp;

  /// Create a copy of ForgotPassVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForgotPassVerifyRequestCopyWith<ForgotPassVerifyRequest> get copyWith =>
      _$ForgotPassVerifyRequestCopyWithImpl<ForgotPassVerifyRequest>(
          this as ForgotPassVerifyRequest, _$identity);

  /// Serializes this ForgotPassVerifyRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForgotPassVerifyRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  @override
  String toString() {
    return 'ForgotPassVerifyRequest(email: $email, otp: $otp)';
  }
}

/// @nodoc
abstract mixin class $ForgotPassVerifyRequestCopyWith<$Res> {
  factory $ForgotPassVerifyRequestCopyWith(ForgotPassVerifyRequest value,
          $Res Function(ForgotPassVerifyRequest) _then) =
      _$ForgotPassVerifyRequestCopyWithImpl;
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class _$ForgotPassVerifyRequestCopyWithImpl<$Res>
    implements $ForgotPassVerifyRequestCopyWith<$Res> {
  _$ForgotPassVerifyRequestCopyWithImpl(this._self, this._then);

  final ForgotPassVerifyRequest _self;
  final $Res Function(ForgotPassVerifyRequest) _then;

  /// Create a copy of ForgotPassVerifyRequest
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
class _ForgotPassVerifyRequest implements ForgotPassVerifyRequest {
  const _ForgotPassVerifyRequest({required this.email, required this.otp});
  factory _ForgotPassVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPassVerifyRequestFromJson(json);

  @override
  final String email;
  @override
  final String otp;

  /// Create a copy of ForgotPassVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPassVerifyRequestCopyWith<_ForgotPassVerifyRequest> get copyWith =>
      __$ForgotPassVerifyRequestCopyWithImpl<_ForgotPassVerifyRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForgotPassVerifyRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPassVerifyRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  @override
  String toString() {
    return 'ForgotPassVerifyRequest(email: $email, otp: $otp)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPassVerifyRequestCopyWith<$Res>
    implements $ForgotPassVerifyRequestCopyWith<$Res> {
  factory _$ForgotPassVerifyRequestCopyWith(_ForgotPassVerifyRequest value,
          $Res Function(_ForgotPassVerifyRequest) _then) =
      __$ForgotPassVerifyRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class __$ForgotPassVerifyRequestCopyWithImpl<$Res>
    implements _$ForgotPassVerifyRequestCopyWith<$Res> {
  __$ForgotPassVerifyRequestCopyWithImpl(this._self, this._then);

  final _ForgotPassVerifyRequest _self;
  final $Res Function(_ForgotPassVerifyRequest) _then;

  /// Create a copy of ForgotPassVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? otp = null,
  }) {
    return _then(_ForgotPassVerifyRequest(
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

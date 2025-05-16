// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_verify_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignupVerifyRequest _$SignupVerifyRequestFromJson(Map<String, dynamic> json) {
  return _SignupVerifyRequest.fromJson(json);
}

/// @nodoc
mixin _$SignupVerifyRequest {
  String get email => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  /// Serializes this SignupVerifyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignupVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupVerifyRequestCopyWith<SignupVerifyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupVerifyRequestCopyWith<$Res> {
  factory $SignupVerifyRequestCopyWith(
          SignupVerifyRequest value, $Res Function(SignupVerifyRequest) then) =
      _$SignupVerifyRequestCopyWithImpl<$Res, SignupVerifyRequest>;
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class _$SignupVerifyRequestCopyWithImpl<$Res, $Val extends SignupVerifyRequest>
    implements $SignupVerifyRequestCopyWith<$Res> {
  _$SignupVerifyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupVerifyRequestImplCopyWith<$Res>
    implements $SignupVerifyRequestCopyWith<$Res> {
  factory _$$SignupVerifyRequestImplCopyWith(_$SignupVerifyRequestImpl value,
          $Res Function(_$SignupVerifyRequestImpl) then) =
      __$$SignupVerifyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class __$$SignupVerifyRequestImplCopyWithImpl<$Res>
    extends _$SignupVerifyRequestCopyWithImpl<$Res, _$SignupVerifyRequestImpl>
    implements _$$SignupVerifyRequestImplCopyWith<$Res> {
  __$$SignupVerifyRequestImplCopyWithImpl(_$SignupVerifyRequestImpl _value,
      $Res Function(_$SignupVerifyRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? otp = null,
  }) {
    return _then(_$SignupVerifyRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupVerifyRequestImpl implements _SignupVerifyRequest {
  const _$SignupVerifyRequestImpl({required this.email, required this.otp});

  factory _$SignupVerifyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupVerifyRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String otp;

  @override
  String toString() {
    return 'SignupVerifyRequest(email: $email, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupVerifyRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  /// Create a copy of SignupVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupVerifyRequestImplCopyWith<_$SignupVerifyRequestImpl> get copyWith =>
      __$$SignupVerifyRequestImplCopyWithImpl<_$SignupVerifyRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupVerifyRequestImplToJson(
      this,
    );
  }
}

abstract class _SignupVerifyRequest implements SignupVerifyRequest {
  const factory _SignupVerifyRequest(
      {required final String email,
      required final String otp}) = _$SignupVerifyRequestImpl;

  factory _SignupVerifyRequest.fromJson(Map<String, dynamic> json) =
      _$SignupVerifyRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get otp;

  /// Create a copy of SignupVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupVerifyRequestImplCopyWith<_$SignupVerifyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

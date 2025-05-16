// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_verify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgotPassVerifyRequest _$ForgotPassVerifyRequestFromJson(
    Map<String, dynamic> json) {
  return _ForgotPassVerifyRequest.fromJson(json);
}

/// @nodoc
mixin _$ForgotPassVerifyRequest {
  String get email => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  /// Serializes this ForgotPassVerifyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPassVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPassVerifyRequestCopyWith<ForgotPassVerifyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPassVerifyRequestCopyWith<$Res> {
  factory $ForgotPassVerifyRequestCopyWith(ForgotPassVerifyRequest value,
          $Res Function(ForgotPassVerifyRequest) then) =
      _$ForgotPassVerifyRequestCopyWithImpl<$Res, ForgotPassVerifyRequest>;
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class _$ForgotPassVerifyRequestCopyWithImpl<$Res,
        $Val extends ForgotPassVerifyRequest>
    implements $ForgotPassVerifyRequestCopyWith<$Res> {
  _$ForgotPassVerifyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPassVerifyRequest
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
abstract class _$$ForgotPassVerifyRequestImplCopyWith<$Res>
    implements $ForgotPassVerifyRequestCopyWith<$Res> {
  factory _$$ForgotPassVerifyRequestImplCopyWith(
          _$ForgotPassVerifyRequestImpl value,
          $Res Function(_$ForgotPassVerifyRequestImpl) then) =
      __$$ForgotPassVerifyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class __$$ForgotPassVerifyRequestImplCopyWithImpl<$Res>
    extends _$ForgotPassVerifyRequestCopyWithImpl<$Res,
        _$ForgotPassVerifyRequestImpl>
    implements _$$ForgotPassVerifyRequestImplCopyWith<$Res> {
  __$$ForgotPassVerifyRequestImplCopyWithImpl(
      _$ForgotPassVerifyRequestImpl _value,
      $Res Function(_$ForgotPassVerifyRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPassVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? otp = null,
  }) {
    return _then(_$ForgotPassVerifyRequestImpl(
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
class _$ForgotPassVerifyRequestImpl implements _ForgotPassVerifyRequest {
  const _$ForgotPassVerifyRequestImpl({required this.email, required this.otp});

  factory _$ForgotPassVerifyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPassVerifyRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String otp;

  @override
  String toString() {
    return 'ForgotPassVerifyRequest(email: $email, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPassVerifyRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  /// Create a copy of ForgotPassVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPassVerifyRequestImplCopyWith<_$ForgotPassVerifyRequestImpl>
      get copyWith => __$$ForgotPassVerifyRequestImplCopyWithImpl<
          _$ForgotPassVerifyRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPassVerifyRequestImplToJson(
      this,
    );
  }
}

abstract class _ForgotPassVerifyRequest implements ForgotPassVerifyRequest {
  const factory _ForgotPassVerifyRequest(
      {required final String email,
      required final String otp}) = _$ForgotPassVerifyRequestImpl;

  factory _ForgotPassVerifyRequest.fromJson(Map<String, dynamic> json) =
      _$ForgotPassVerifyRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get otp;

  /// Create a copy of ForgotPassVerifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPassVerifyRequestImplCopyWith<_$ForgotPassVerifyRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

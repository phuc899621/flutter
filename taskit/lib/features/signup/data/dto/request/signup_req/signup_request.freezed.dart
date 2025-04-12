// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupRequest {
  String get name;
  String get email;
  String get password;
  String get passwordConfirm;

  /// Create a copy of SignupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignupRequestCopyWith<SignupRequest> get copyWith =>
      _$SignupRequestCopyWithImpl<SignupRequest>(
          this as SignupRequest, _$identity);

  /// Serializes this SignupRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignupRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirm, passwordConfirm) ||
                other.passwordConfirm == passwordConfirm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, password, passwordConfirm);

  @override
  String toString() {
    return 'SignupRequest(name: $name, email: $email, password: $password, passwordConfirm: $passwordConfirm)';
  }
}

/// @nodoc
abstract mixin class $SignupRequestCopyWith<$Res> {
  factory $SignupRequestCopyWith(
          SignupRequest value, $Res Function(SignupRequest) _then) =
      _$SignupRequestCopyWithImpl;
  @useResult
  $Res call(
      {String name, String email, String password, String passwordConfirm});
}

/// @nodoc
class _$SignupRequestCopyWithImpl<$Res>
    implements $SignupRequestCopyWith<$Res> {
  _$SignupRequestCopyWithImpl(this._self, this._then);

  final SignupRequest _self;
  final $Res Function(SignupRequest) _then;

  /// Create a copy of SignupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirm = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirm: null == passwordConfirm
          ? _self.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SignupRequest implements SignupRequest {
  const _SignupRequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirm});
  factory _SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final String passwordConfirm;

  /// Create a copy of SignupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignupRequestCopyWith<_SignupRequest> get copyWith =>
      __$SignupRequestCopyWithImpl<_SignupRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignupRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignupRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirm, passwordConfirm) ||
                other.passwordConfirm == passwordConfirm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, password, passwordConfirm);

  @override
  String toString() {
    return 'SignupRequest(name: $name, email: $email, password: $password, passwordConfirm: $passwordConfirm)';
  }
}

/// @nodoc
abstract mixin class _$SignupRequestCopyWith<$Res>
    implements $SignupRequestCopyWith<$Res> {
  factory _$SignupRequestCopyWith(
          _SignupRequest value, $Res Function(_SignupRequest) _then) =
      __$SignupRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name, String email, String password, String passwordConfirm});
}

/// @nodoc
class __$SignupRequestCopyWithImpl<$Res>
    implements _$SignupRequestCopyWith<$Res> {
  __$SignupRequestCopyWithImpl(this._self, this._then);

  final _SignupRequest _self;
  final $Res Function(_SignupRequest) _then;

  /// Create a copy of SignupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirm = null,
  }) {
    return _then(_SignupRequest(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirm: null == passwordConfirm
          ? _self.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

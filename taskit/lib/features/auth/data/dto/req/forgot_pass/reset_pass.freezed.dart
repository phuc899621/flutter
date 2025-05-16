// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pass_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPassRequest {
  String get email;
  String get password;
  String get confirmPassword;

  /// Create a copy of ResetPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResetPassRequestCopyWith<ResetPassRequest> get copyWith =>
      _$ResetPassRequestCopyWithImpl<ResetPassRequest>(
          this as ResetPassRequest, _$identity);

  /// Serializes this ResetPassRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResetPassRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, confirmPassword);

  @override
  String toString() {
    return 'ResetPassRequest(email: $email, password: $password, confirmPassword: $confirmPassword)';
  }
}

/// @nodoc
abstract mixin class $ResetPassRequestCopyWith<$Res> {
  factory $ResetPassRequestCopyWith(
          ResetPassRequest value, $Res Function(ResetPassRequest) _then) =
      _$ResetPassRequestCopyWithImpl;
  @useResult
  $Res call({String email, String password, String confirmPassword});
}

/// @nodoc
class _$ResetPassRequestCopyWithImpl<$Res>
    implements $ResetPassRequestCopyWith<$Res> {
  _$ResetPassRequestCopyWithImpl(this._self, this._then);

  final ResetPassRequest _self;
  final $Res Function(ResetPassRequest) _then;

  /// Create a copy of ResetPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ResetPassRequest implements ResetPassRequest {
  const _ResetPassRequest(
      {required this.email,
      required this.password,
      required this.confirmPassword});
  factory _ResetPassRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPassRequestFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;

  /// Create a copy of ResetPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResetPassRequestCopyWith<_ResetPassRequest> get copyWith =>
      __$ResetPassRequestCopyWithImpl<_ResetPassRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResetPassRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResetPassRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, confirmPassword);

  @override
  String toString() {
    return 'ResetPassRequest(email: $email, password: $password, confirmPassword: $confirmPassword)';
  }
}

/// @nodoc
abstract mixin class _$ResetPassRequestCopyWith<$Res>
    implements $ResetPassRequestCopyWith<$Res> {
  factory _$ResetPassRequestCopyWith(
          _ResetPassRequest value, $Res Function(_ResetPassRequest) _then) =
      __$ResetPassRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String password, String confirmPassword});
}

/// @nodoc
class __$ResetPassRequestCopyWithImpl<$Res>
    implements _$ResetPassRequestCopyWith<$Res> {
  __$ResetPassRequestCopyWithImpl(this._self, this._then);

  final _ResetPassRequest _self;
  final $Res Function(_ResetPassRequest) _then;

  /// Create a copy of ResetPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_ResetPassRequest(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

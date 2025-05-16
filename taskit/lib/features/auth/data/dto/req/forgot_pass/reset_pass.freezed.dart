// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResetPassRequest _$ResetPassRequestFromJson(Map<String, dynamic> json) {
  return _ResetPassRequest.fromJson(json);
}

/// @nodoc
mixin _$ResetPassRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  /// Serializes this ResetPassRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPassRequestCopyWith<ResetPassRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPassRequestCopyWith<$Res> {
  factory $ResetPassRequestCopyWith(
          ResetPassRequest value, $Res Function(ResetPassRequest) then) =
      _$ResetPassRequestCopyWithImpl<$Res, ResetPassRequest>;
  @useResult
  $Res call({String email, String password, String confirmPassword});
}

/// @nodoc
class _$ResetPassRequestCopyWithImpl<$Res, $Val extends ResetPassRequest>
    implements $ResetPassRequestCopyWith<$Res> {
  _$ResetPassRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPassRequestImplCopyWith<$Res>
    implements $ResetPassRequestCopyWith<$Res> {
  factory _$$ResetPassRequestImplCopyWith(_$ResetPassRequestImpl value,
          $Res Function(_$ResetPassRequestImpl) then) =
      __$$ResetPassRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String confirmPassword});
}

/// @nodoc
class __$$ResetPassRequestImplCopyWithImpl<$Res>
    extends _$ResetPassRequestCopyWithImpl<$Res, _$ResetPassRequestImpl>
    implements _$$ResetPassRequestImplCopyWith<$Res> {
  __$$ResetPassRequestImplCopyWithImpl(_$ResetPassRequestImpl _value,
      $Res Function(_$ResetPassRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$ResetPassRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPassRequestImpl implements _ResetPassRequest {
  const _$ResetPassRequestImpl(
      {required this.email,
      required this.password,
      required this.confirmPassword});

  factory _$ResetPassRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPassRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ResetPassRequest(email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPassRequestImpl &&
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

  /// Create a copy of ResetPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPassRequestImplCopyWith<_$ResetPassRequestImpl> get copyWith =>
      __$$ResetPassRequestImplCopyWithImpl<_$ResetPassRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPassRequestImplToJson(
      this,
    );
  }
}

abstract class _ResetPassRequest implements ResetPassRequest {
  const factory _ResetPassRequest(
      {required final String email,
      required final String password,
      required final String confirmPassword}) = _$ResetPassRequestImpl;

  factory _ResetPassRequest.fromJson(Map<String, dynamic> json) =
      _$ResetPassRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;

  /// Create a copy of ResetPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPassRequestImplCopyWith<_$ResetPassRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

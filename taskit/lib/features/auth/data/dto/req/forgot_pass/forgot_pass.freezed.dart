// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgotPassRequest _$ForgotPassRequestFromJson(Map<String, dynamic> json) {
  return _ForgotPassRequest.fromJson(json);
}

/// @nodoc
mixin _$ForgotPassRequest {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this ForgotPassRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPassRequestCopyWith<ForgotPassRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPassRequestCopyWith<$Res> {
  factory $ForgotPassRequestCopyWith(
          ForgotPassRequest value, $Res Function(ForgotPassRequest) then) =
      _$ForgotPassRequestCopyWithImpl<$Res, ForgotPassRequest>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPassRequestCopyWithImpl<$Res, $Val extends ForgotPassRequest>
    implements $ForgotPassRequestCopyWith<$Res> {
  _$ForgotPassRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPassRequestImplCopyWith<$Res>
    implements $ForgotPassRequestCopyWith<$Res> {
  factory _$$ForgotPassRequestImplCopyWith(_$ForgotPassRequestImpl value,
          $Res Function(_$ForgotPassRequestImpl) then) =
      __$$ForgotPassRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPassRequestImplCopyWithImpl<$Res>
    extends _$ForgotPassRequestCopyWithImpl<$Res, _$ForgotPassRequestImpl>
    implements _$$ForgotPassRequestImplCopyWith<$Res> {
  __$$ForgotPassRequestImplCopyWithImpl(_$ForgotPassRequestImpl _value,
      $Res Function(_$ForgotPassRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPassRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPassRequestImpl implements _ForgotPassRequest {
  const _$ForgotPassRequestImpl({required this.email});

  factory _$ForgotPassRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPassRequestImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPassRequest(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPassRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPassRequestImplCopyWith<_$ForgotPassRequestImpl> get copyWith =>
      __$$ForgotPassRequestImplCopyWithImpl<_$ForgotPassRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPassRequestImplToJson(
      this,
    );
  }
}

abstract class _ForgotPassRequest implements ForgotPassRequest {
  const factory _ForgotPassRequest({required final String email}) =
      _$ForgotPassRequestImpl;

  factory _ForgotPassRequest.fromJson(Map<String, dynamic> json) =
      _$ForgotPassRequestImpl.fromJson;

  @override
  String get email;

  /// Create a copy of ForgotPassRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPassRequestImplCopyWith<_$ForgotPassRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

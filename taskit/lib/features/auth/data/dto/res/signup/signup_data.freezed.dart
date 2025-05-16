// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignupData _$SignupDataFromJson(Map<String, dynamic> json) {
  return _SignupData.fromJson(json);
}

/// @nodoc
mixin _$SignupData {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this SignupData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupDataCopyWith<SignupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupDataCopyWith<$Res> {
  factory $SignupDataCopyWith(
          SignupData value, $Res Function(SignupData) then) =
      _$SignupDataCopyWithImpl<$Res, SignupData>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$SignupDataCopyWithImpl<$Res, $Val extends SignupData>
    implements $SignupDataCopyWith<$Res> {
  _$SignupDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupData
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
abstract class _$$SignupDataImplCopyWith<$Res>
    implements $SignupDataCopyWith<$Res> {
  factory _$$SignupDataImplCopyWith(
          _$SignupDataImpl value, $Res Function(_$SignupDataImpl) then) =
      __$$SignupDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SignupDataImplCopyWithImpl<$Res>
    extends _$SignupDataCopyWithImpl<$Res, _$SignupDataImpl>
    implements _$$SignupDataImplCopyWith<$Res> {
  __$$SignupDataImplCopyWithImpl(
      _$SignupDataImpl _value, $Res Function(_$SignupDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SignupDataImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupDataImpl implements _SignupData {
  const _$SignupDataImpl({required this.email});

  factory _$SignupDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupDataImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'SignupData(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupDataImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupDataImplCopyWith<_$SignupDataImpl> get copyWith =>
      __$$SignupDataImplCopyWithImpl<_$SignupDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupDataImplToJson(
      this,
    );
  }
}

abstract class _SignupData implements SignupData {
  const factory _SignupData({required final String email}) = _$SignupDataImpl;

  factory _SignupData.fromJson(Map<String, dynamic> json) =
      _$SignupDataImpl.fromJson;

  @override
  String get email;

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupDataImplCopyWith<_$SignupDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

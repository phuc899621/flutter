// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_verify_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginVerifyData _$LoginVerifyDataFromJson(Map<String, dynamic> json) {
  return _LoginVerifyData.fromJson(json);
}

/// @nodoc
mixin _$LoginVerifyData {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this LoginVerifyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginVerifyDataCopyWith<LoginVerifyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginVerifyDataCopyWith<$Res> {
  factory $LoginVerifyDataCopyWith(
          LoginVerifyData value, $Res Function(LoginVerifyData) then) =
      _$LoginVerifyDataCopyWithImpl<$Res, LoginVerifyData>;
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class _$LoginVerifyDataCopyWithImpl<$Res, $Val extends LoginVerifyData>
    implements $LoginVerifyDataCopyWith<$Res> {
  _$LoginVerifyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginVerifyDataImplCopyWith<$Res>
    implements $LoginVerifyDataCopyWith<$Res> {
  factory _$$LoginVerifyDataImplCopyWith(_$LoginVerifyDataImpl value,
          $Res Function(_$LoginVerifyDataImpl) then) =
      __$$LoginVerifyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class __$$LoginVerifyDataImplCopyWithImpl<$Res>
    extends _$LoginVerifyDataCopyWithImpl<$Res, _$LoginVerifyDataImpl>
    implements _$$LoginVerifyDataImplCopyWith<$Res> {
  __$$LoginVerifyDataImplCopyWithImpl(
      _$LoginVerifyDataImpl _value, $Res Function(_$LoginVerifyDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$LoginVerifyDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginVerifyDataImpl implements _LoginVerifyData {
  const _$LoginVerifyDataImpl({required this.name, required this.email});

  factory _$LoginVerifyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginVerifyDataImplFromJson(json);

  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'LoginVerifyData(name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginVerifyDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  /// Create a copy of LoginVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginVerifyDataImplCopyWith<_$LoginVerifyDataImpl> get copyWith =>
      __$$LoginVerifyDataImplCopyWithImpl<_$LoginVerifyDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginVerifyDataImplToJson(
      this,
    );
  }
}

abstract class _LoginVerifyData implements LoginVerifyData {
  const factory _LoginVerifyData(
      {required final String name,
      required final String email}) = _$LoginVerifyDataImpl;

  factory _LoginVerifyData.fromJson(Map<String, dynamic> json) =
      _$LoginVerifyDataImpl.fromJson;

  @override
  String get name;
  @override
  String get email;

  /// Create a copy of LoginVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginVerifyDataImplCopyWith<_$LoginVerifyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

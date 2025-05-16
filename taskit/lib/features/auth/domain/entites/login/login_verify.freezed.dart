// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_verify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginVerifyModel {
  String get name => throw _privateConstructorUsedError;
  String get gmail => throw _privateConstructorUsedError;

  /// Create a copy of LoginVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginVerifyModelCopyWith<LoginVerifyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginVerifyModelCopyWith<$Res> {
  factory $LoginVerifyModelCopyWith(
          LoginVerifyModel value, $Res Function(LoginVerifyModel) then) =
      _$LoginVerifyModelCopyWithImpl<$Res, LoginVerifyModel>;
  @useResult
  $Res call({String name, String gmail});
}

/// @nodoc
class _$LoginVerifyModelCopyWithImpl<$Res, $Val extends LoginVerifyModel>
    implements $LoginVerifyModelCopyWith<$Res> {
  _$LoginVerifyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? gmail = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gmail: null == gmail
          ? _value.gmail
          : gmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginVerifyModelImplCopyWith<$Res>
    implements $LoginVerifyModelCopyWith<$Res> {
  factory _$$LoginVerifyModelImplCopyWith(_$LoginVerifyModelImpl value,
          $Res Function(_$LoginVerifyModelImpl) then) =
      __$$LoginVerifyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String gmail});
}

/// @nodoc
class __$$LoginVerifyModelImplCopyWithImpl<$Res>
    extends _$LoginVerifyModelCopyWithImpl<$Res, _$LoginVerifyModelImpl>
    implements _$$LoginVerifyModelImplCopyWith<$Res> {
  __$$LoginVerifyModelImplCopyWithImpl(_$LoginVerifyModelImpl _value,
      $Res Function(_$LoginVerifyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? gmail = null,
  }) {
    return _then(_$LoginVerifyModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gmail: null == gmail
          ? _value.gmail
          : gmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginVerifyModelImpl implements _LoginVerifyModel {
  const _$LoginVerifyModelImpl({required this.name, required this.gmail});

  @override
  final String name;
  @override
  final String gmail;

  @override
  String toString() {
    return 'LoginVerifyModel(name: $name, gmail: $gmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginVerifyModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gmail, gmail) || other.gmail == gmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, gmail);

  /// Create a copy of LoginVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginVerifyModelImplCopyWith<_$LoginVerifyModelImpl> get copyWith =>
      __$$LoginVerifyModelImplCopyWithImpl<_$LoginVerifyModelImpl>(
          this, _$identity);
}

abstract class _LoginVerifyModel implements LoginVerifyModel {
  const factory _LoginVerifyModel(
      {required final String name,
      required final String gmail}) = _$LoginVerifyModelImpl;

  @override
  String get name;
  @override
  String get gmail;

  /// Create a copy of LoginVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginVerifyModelImplCopyWith<_$LoginVerifyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

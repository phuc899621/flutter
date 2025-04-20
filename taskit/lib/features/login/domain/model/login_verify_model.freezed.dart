// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_verify_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginVerifyModel {
  String get name;
  String get gmail;

  /// Create a copy of LoginVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginVerifyModelCopyWith<LoginVerifyModel> get copyWith =>
      _$LoginVerifyModelCopyWithImpl<LoginVerifyModel>(
          this as LoginVerifyModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginVerifyModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gmail, gmail) || other.gmail == gmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, gmail);

  @override
  String toString() {
    return 'LoginVerifyModel(name: $name, gmail: $gmail)';
  }
}

/// @nodoc
abstract mixin class $LoginVerifyModelCopyWith<$Res> {
  factory $LoginVerifyModelCopyWith(
          LoginVerifyModel value, $Res Function(LoginVerifyModel) _then) =
      _$LoginVerifyModelCopyWithImpl;
  @useResult
  $Res call({String name, String gmail});
}

/// @nodoc
class _$LoginVerifyModelCopyWithImpl<$Res>
    implements $LoginVerifyModelCopyWith<$Res> {
  _$LoginVerifyModelCopyWithImpl(this._self, this._then);

  final LoginVerifyModel _self;
  final $Res Function(LoginVerifyModel) _then;

  /// Create a copy of LoginVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? gmail = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gmail: null == gmail
          ? _self.gmail
          : gmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LoginVerifyModel implements LoginVerifyModel {
  const _LoginVerifyModel({required this.name, required this.gmail});

  @override
  final String name;
  @override
  final String gmail;

  /// Create a copy of LoginVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginVerifyModelCopyWith<_LoginVerifyModel> get copyWith =>
      __$LoginVerifyModelCopyWithImpl<_LoginVerifyModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginVerifyModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gmail, gmail) || other.gmail == gmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, gmail);

  @override
  String toString() {
    return 'LoginVerifyModel(name: $name, gmail: $gmail)';
  }
}

/// @nodoc
abstract mixin class _$LoginVerifyModelCopyWith<$Res>
    implements $LoginVerifyModelCopyWith<$Res> {
  factory _$LoginVerifyModelCopyWith(
          _LoginVerifyModel value, $Res Function(_LoginVerifyModel) _then) =
      __$LoginVerifyModelCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String gmail});
}

/// @nodoc
class __$LoginVerifyModelCopyWithImpl<$Res>
    implements _$LoginVerifyModelCopyWith<$Res> {
  __$LoginVerifyModelCopyWithImpl(this._self, this._then);

  final _LoginVerifyModel _self;
  final $Res Function(_LoginVerifyModel) _then;

  /// Create a copy of LoginVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? gmail = null,
  }) {
    return _then(_LoginVerifyModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gmail: null == gmail
          ? _self.gmail
          : gmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupModel {
  String get email;
  String get name;
  bool get isSignUpSuccess;

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignupModelCopyWith<SignupModel> get copyWith =>
      _$SignupModelCopyWithImpl<SignupModel>(this as SignupModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignupModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isSignUpSuccess, isSignUpSuccess) ||
                other.isSignUpSuccess == isSignUpSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, name, isSignUpSuccess);

  @override
  String toString() {
    return 'SignupModel(email: $email, name: $name, isSignUpSuccess: $isSignUpSuccess)';
  }
}

/// @nodoc
abstract mixin class $SignupModelCopyWith<$Res> {
  factory $SignupModelCopyWith(
          SignupModel value, $Res Function(SignupModel) _then) =
      _$SignupModelCopyWithImpl;
  @useResult
  $Res call({String email, String name, bool isSignUpSuccess});
}

/// @nodoc
class _$SignupModelCopyWithImpl<$Res> implements $SignupModelCopyWith<$Res> {
  _$SignupModelCopyWithImpl(this._self, this._then);

  final SignupModel _self;
  final $Res Function(SignupModel) _then;

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? isSignUpSuccess = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isSignUpSuccess: null == isSignUpSuccess
          ? _self.isSignUpSuccess
          : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _SignupModel implements SignupModel {
  _SignupModel(
      {required this.email, required this.name, required this.isSignUpSuccess});

  @override
  final String email;
  @override
  final String name;
  @override
  final bool isSignUpSuccess;

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignupModelCopyWith<_SignupModel> get copyWith =>
      __$SignupModelCopyWithImpl<_SignupModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignupModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isSignUpSuccess, isSignUpSuccess) ||
                other.isSignUpSuccess == isSignUpSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, name, isSignUpSuccess);

  @override
  String toString() {
    return 'SignupModel(email: $email, name: $name, isSignUpSuccess: $isSignUpSuccess)';
  }
}

/// @nodoc
abstract mixin class _$SignupModelCopyWith<$Res>
    implements $SignupModelCopyWith<$Res> {
  factory _$SignupModelCopyWith(
          _SignupModel value, $Res Function(_SignupModel) _then) =
      __$SignupModelCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String name, bool isSignUpSuccess});
}

/// @nodoc
class __$SignupModelCopyWithImpl<$Res> implements _$SignupModelCopyWith<$Res> {
  __$SignupModelCopyWithImpl(this._self, this._then);

  final _SignupModel _self;
  final $Res Function(_SignupModel) _then;

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? isSignUpSuccess = null,
  }) {
    return _then(_SignupModel(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isSignUpSuccess: null == isSignUpSuccess
          ? _self.isSignUpSuccess
          : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

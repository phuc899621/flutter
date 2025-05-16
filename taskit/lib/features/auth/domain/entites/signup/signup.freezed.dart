// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupModel {
  String get email => throw _privateConstructorUsedError;

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupModelCopyWith<SignupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupModelCopyWith<$Res> {
  factory $SignupModelCopyWith(
          SignupModel value, $Res Function(SignupModel) then) =
      _$SignupModelCopyWithImpl<$Res, SignupModel>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$SignupModelCopyWithImpl<$Res, $Val extends SignupModel>
    implements $SignupModelCopyWith<$Res> {
  _$SignupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupModel
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
abstract class _$$SignupModelImplCopyWith<$Res>
    implements $SignupModelCopyWith<$Res> {
  factory _$$SignupModelImplCopyWith(
          _$SignupModelImpl value, $Res Function(_$SignupModelImpl) then) =
      __$$SignupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SignupModelImplCopyWithImpl<$Res>
    extends _$SignupModelCopyWithImpl<$Res, _$SignupModelImpl>
    implements _$$SignupModelImplCopyWith<$Res> {
  __$$SignupModelImplCopyWithImpl(
      _$SignupModelImpl _value, $Res Function(_$SignupModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SignupModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignupModelImpl implements _SignupModel {
  _$SignupModelImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'SignupModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupModelImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupModelImplCopyWith<_$SignupModelImpl> get copyWith =>
      __$$SignupModelImplCopyWithImpl<_$SignupModelImpl>(this, _$identity);
}

abstract class _SignupModel implements SignupModel {
  factory _SignupModel({required final String email}) = _$SignupModelImpl;

  @override
  String get email;

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupModelImplCopyWith<_$SignupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_verify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPassVerifyModel {
  String get resetToken => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPassVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPassVerifyModelCopyWith<ForgotPassVerifyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPassVerifyModelCopyWith<$Res> {
  factory $ForgotPassVerifyModelCopyWith(ForgotPassVerifyModel value,
          $Res Function(ForgotPassVerifyModel) then) =
      _$ForgotPassVerifyModelCopyWithImpl<$Res, ForgotPassVerifyModel>;
  @useResult
  $Res call({String resetToken});
}

/// @nodoc
class _$ForgotPassVerifyModelCopyWithImpl<$Res,
        $Val extends ForgotPassVerifyModel>
    implements $ForgotPassVerifyModelCopyWith<$Res> {
  _$ForgotPassVerifyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPassVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetToken = null,
  }) {
    return _then(_value.copyWith(
      resetToken: null == resetToken
          ? _value.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPassVerifyModelImplCopyWith<$Res>
    implements $ForgotPassVerifyModelCopyWith<$Res> {
  factory _$$ForgotPassVerifyModelImplCopyWith(
          _$ForgotPassVerifyModelImpl value,
          $Res Function(_$ForgotPassVerifyModelImpl) then) =
      __$$ForgotPassVerifyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String resetToken});
}

/// @nodoc
class __$$ForgotPassVerifyModelImplCopyWithImpl<$Res>
    extends _$ForgotPassVerifyModelCopyWithImpl<$Res,
        _$ForgotPassVerifyModelImpl>
    implements _$$ForgotPassVerifyModelImplCopyWith<$Res> {
  __$$ForgotPassVerifyModelImplCopyWithImpl(_$ForgotPassVerifyModelImpl _value,
      $Res Function(_$ForgotPassVerifyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPassVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetToken = null,
  }) {
    return _then(_$ForgotPassVerifyModelImpl(
      resetToken: null == resetToken
          ? _value.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPassVerifyModelImpl implements _ForgotPassVerifyModel {
  const _$ForgotPassVerifyModelImpl({required this.resetToken});

  @override
  final String resetToken;

  @override
  String toString() {
    return 'ForgotPassVerifyModel(resetToken: $resetToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPassVerifyModelImpl &&
            (identical(other.resetToken, resetToken) ||
                other.resetToken == resetToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resetToken);

  /// Create a copy of ForgotPassVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPassVerifyModelImplCopyWith<_$ForgotPassVerifyModelImpl>
      get copyWith => __$$ForgotPassVerifyModelImplCopyWithImpl<
          _$ForgotPassVerifyModelImpl>(this, _$identity);
}

abstract class _ForgotPassVerifyModel implements ForgotPassVerifyModel {
  const factory _ForgotPassVerifyModel({required final String resetToken}) =
      _$ForgotPassVerifyModelImpl;

  @override
  String get resetToken;

  /// Create a copy of ForgotPassVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPassVerifyModelImplCopyWith<_$ForgotPassVerifyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

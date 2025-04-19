// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_verify_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPassVerifyModel {
  String get resetToken;

  /// Create a copy of ForgotPassVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForgotPassVerifyModelCopyWith<ForgotPassVerifyModel> get copyWith =>
      _$ForgotPassVerifyModelCopyWithImpl<ForgotPassVerifyModel>(
          this as ForgotPassVerifyModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForgotPassVerifyModel &&
            (identical(other.resetToken, resetToken) ||
                other.resetToken == resetToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resetToken);

  @override
  String toString() {
    return 'ForgotPassVerifyModel(resetToken: $resetToken)';
  }
}

/// @nodoc
abstract mixin class $ForgotPassVerifyModelCopyWith<$Res> {
  factory $ForgotPassVerifyModelCopyWith(ForgotPassVerifyModel value,
          $Res Function(ForgotPassVerifyModel) _then) =
      _$ForgotPassVerifyModelCopyWithImpl;
  @useResult
  $Res call({String resetToken});
}

/// @nodoc
class _$ForgotPassVerifyModelCopyWithImpl<$Res>
    implements $ForgotPassVerifyModelCopyWith<$Res> {
  _$ForgotPassVerifyModelCopyWithImpl(this._self, this._then);

  final ForgotPassVerifyModel _self;
  final $Res Function(ForgotPassVerifyModel) _then;

  /// Create a copy of ForgotPassVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetToken = null,
  }) {
    return _then(_self.copyWith(
      resetToken: null == resetToken
          ? _self.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ForgotPassVerifyModel implements ForgotPassVerifyModel {
  const _ForgotPassVerifyModel({required this.resetToken});

  @override
  final String resetToken;

  /// Create a copy of ForgotPassVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPassVerifyModelCopyWith<_ForgotPassVerifyModel> get copyWith =>
      __$ForgotPassVerifyModelCopyWithImpl<_ForgotPassVerifyModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPassVerifyModel &&
            (identical(other.resetToken, resetToken) ||
                other.resetToken == resetToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resetToken);

  @override
  String toString() {
    return 'ForgotPassVerifyModel(resetToken: $resetToken)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPassVerifyModelCopyWith<$Res>
    implements $ForgotPassVerifyModelCopyWith<$Res> {
  factory _$ForgotPassVerifyModelCopyWith(_ForgotPassVerifyModel value,
          $Res Function(_ForgotPassVerifyModel) _then) =
      __$ForgotPassVerifyModelCopyWithImpl;
  @override
  @useResult
  $Res call({String resetToken});
}

/// @nodoc
class __$ForgotPassVerifyModelCopyWithImpl<$Res>
    implements _$ForgotPassVerifyModelCopyWith<$Res> {
  __$ForgotPassVerifyModelCopyWithImpl(this._self, this._then);

  final _ForgotPassVerifyModel _self;
  final $Res Function(_ForgotPassVerifyModel) _then;

  /// Create a copy of ForgotPassVerifyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? resetToken = null,
  }) {
    return _then(_ForgotPassVerifyModel(
      resetToken: null == resetToken
          ? _self.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

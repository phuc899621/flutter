// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPassState {
  bool get isLoading;
  bool? get isForgotPassSuccess;
  bool? get isVerifySuccess;
  bool? get isResetSuccess;
  String? get errorForgotPass;
  String? get errorVerify;
  String? get errorReset;
  Map<String, dynamic> get forgotPassForm;
  Map<String, dynamic> get verifyForm;
  Map<String, dynamic> get resetForm;
  ForgotPassVerifyModel? get forgotPassVerifyModel;

  /// Create a copy of ForgotPassState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForgotPassStateCopyWith<ForgotPassState> get copyWith =>
      _$ForgotPassStateCopyWithImpl<ForgotPassState>(
          this as ForgotPassState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForgotPassState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isForgotPassSuccess, isForgotPassSuccess) ||
                other.isForgotPassSuccess == isForgotPassSuccess) &&
            (identical(other.isVerifySuccess, isVerifySuccess) ||
                other.isVerifySuccess == isVerifySuccess) &&
            (identical(other.isResetSuccess, isResetSuccess) ||
                other.isResetSuccess == isResetSuccess) &&
            (identical(other.errorForgotPass, errorForgotPass) ||
                other.errorForgotPass == errorForgotPass) &&
            (identical(other.errorVerify, errorVerify) ||
                other.errorVerify == errorVerify) &&
            (identical(other.errorReset, errorReset) ||
                other.errorReset == errorReset) &&
            const DeepCollectionEquality()
                .equals(other.forgotPassForm, forgotPassForm) &&
            const DeepCollectionEquality()
                .equals(other.verifyForm, verifyForm) &&
            const DeepCollectionEquality().equals(other.resetForm, resetForm) &&
            (identical(other.forgotPassVerifyModel, forgotPassVerifyModel) ||
                other.forgotPassVerifyModel == forgotPassVerifyModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isForgotPassSuccess,
      isVerifySuccess,
      isResetSuccess,
      errorForgotPass,
      errorVerify,
      errorReset,
      const DeepCollectionEquality().hash(forgotPassForm),
      const DeepCollectionEquality().hash(verifyForm),
      const DeepCollectionEquality().hash(resetForm),
      forgotPassVerifyModel);

  @override
  String toString() {
    return 'ForgotPassState(isLoading: $isLoading, isForgotPassSuccess: $isForgotPassSuccess, isVerifySuccess: $isVerifySuccess, isResetSuccess: $isResetSuccess, errorForgotPass: $errorForgotPass, errorVerify: $errorVerify, errorReset: $errorReset, forgotPassForm: $forgotPassForm, verifyForm: $verifyForm, resetForm: $resetForm, forgotPassVerifyModel: $forgotPassVerifyModel)';
  }
}

/// @nodoc
abstract mixin class $ForgotPassStateCopyWith<$Res> {
  factory $ForgotPassStateCopyWith(
          ForgotPassState value, $Res Function(ForgotPassState) _then) =
      _$ForgotPassStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool? isForgotPassSuccess,
      bool? isVerifySuccess,
      bool? isResetSuccess,
      String? errorForgotPass,
      String? errorVerify,
      String? errorReset,
      Map<String, dynamic> forgotPassForm,
      Map<String, dynamic> verifyForm,
      Map<String, dynamic> resetForm,
      ForgotPassVerifyModel? forgotPassVerifyModel});

  $ForgotPassVerifyModelCopyWith<$Res>? get forgotPassVerifyModel;
}

/// @nodoc
class _$ForgotPassStateCopyWithImpl<$Res>
    implements $ForgotPassStateCopyWith<$Res> {
  _$ForgotPassStateCopyWithImpl(this._self, this._then);

  final ForgotPassState _self;
  final $Res Function(ForgotPassState) _then;

  /// Create a copy of ForgotPassState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isForgotPassSuccess = freezed,
    Object? isVerifySuccess = freezed,
    Object? isResetSuccess = freezed,
    Object? errorForgotPass = freezed,
    Object? errorVerify = freezed,
    Object? errorReset = freezed,
    Object? forgotPassForm = null,
    Object? verifyForm = null,
    Object? resetForm = null,
    Object? forgotPassVerifyModel = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isForgotPassSuccess: freezed == isForgotPassSuccess
          ? _self.isForgotPassSuccess
          : isForgotPassSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerifySuccess: freezed == isVerifySuccess
          ? _self.isVerifySuccess
          : isVerifySuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResetSuccess: freezed == isResetSuccess
          ? _self.isResetSuccess
          : isResetSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorForgotPass: freezed == errorForgotPass
          ? _self.errorForgotPass
          : errorForgotPass // ignore: cast_nullable_to_non_nullable
              as String?,
      errorVerify: freezed == errorVerify
          ? _self.errorVerify
          : errorVerify // ignore: cast_nullable_to_non_nullable
              as String?,
      errorReset: freezed == errorReset
          ? _self.errorReset
          : errorReset // ignore: cast_nullable_to_non_nullable
              as String?,
      forgotPassForm: null == forgotPassForm
          ? _self.forgotPassForm
          : forgotPassForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      verifyForm: null == verifyForm
          ? _self.verifyForm
          : verifyForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      resetForm: null == resetForm
          ? _self.resetForm
          : resetForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      forgotPassVerifyModel: freezed == forgotPassVerifyModel
          ? _self.forgotPassVerifyModel
          : forgotPassVerifyModel // ignore: cast_nullable_to_non_nullable
              as ForgotPassVerifyModel?,
    ));
  }

  /// Create a copy of ForgotPassState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForgotPassVerifyModelCopyWith<$Res>? get forgotPassVerifyModel {
    if (_self.forgotPassVerifyModel == null) {
      return null;
    }

    return $ForgotPassVerifyModelCopyWith<$Res>(_self.forgotPassVerifyModel!,
        (value) {
      return _then(_self.copyWith(forgotPassVerifyModel: value));
    });
  }
}

/// @nodoc

class _ForgotPassState implements ForgotPassState {
  const _ForgotPassState(
      {this.isLoading = false,
      this.isForgotPassSuccess,
      this.isVerifySuccess,
      this.isResetSuccess,
      this.errorForgotPass,
      this.errorVerify,
      this.errorReset,
      final Map<String, dynamic> forgotPassForm = const {},
      final Map<String, dynamic> verifyForm = const {},
      final Map<String, dynamic> resetForm = const {},
      this.forgotPassVerifyModel})
      : _forgotPassForm = forgotPassForm,
        _verifyForm = verifyForm,
        _resetForm = resetForm;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? isForgotPassSuccess;
  @override
  final bool? isVerifySuccess;
  @override
  final bool? isResetSuccess;
  @override
  final String? errorForgotPass;
  @override
  final String? errorVerify;
  @override
  final String? errorReset;
  final Map<String, dynamic> _forgotPassForm;
  @override
  @JsonKey()
  Map<String, dynamic> get forgotPassForm {
    if (_forgotPassForm is EqualUnmodifiableMapView) return _forgotPassForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_forgotPassForm);
  }

  final Map<String, dynamic> _verifyForm;
  @override
  @JsonKey()
  Map<String, dynamic> get verifyForm {
    if (_verifyForm is EqualUnmodifiableMapView) return _verifyForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_verifyForm);
  }

  final Map<String, dynamic> _resetForm;
  @override
  @JsonKey()
  Map<String, dynamic> get resetForm {
    if (_resetForm is EqualUnmodifiableMapView) return _resetForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_resetForm);
  }

  @override
  final ForgotPassVerifyModel? forgotPassVerifyModel;

  /// Create a copy of ForgotPassState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPassStateCopyWith<_ForgotPassState> get copyWith =>
      __$ForgotPassStateCopyWithImpl<_ForgotPassState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPassState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isForgotPassSuccess, isForgotPassSuccess) ||
                other.isForgotPassSuccess == isForgotPassSuccess) &&
            (identical(other.isVerifySuccess, isVerifySuccess) ||
                other.isVerifySuccess == isVerifySuccess) &&
            (identical(other.isResetSuccess, isResetSuccess) ||
                other.isResetSuccess == isResetSuccess) &&
            (identical(other.errorForgotPass, errorForgotPass) ||
                other.errorForgotPass == errorForgotPass) &&
            (identical(other.errorVerify, errorVerify) ||
                other.errorVerify == errorVerify) &&
            (identical(other.errorReset, errorReset) ||
                other.errorReset == errorReset) &&
            const DeepCollectionEquality()
                .equals(other._forgotPassForm, _forgotPassForm) &&
            const DeepCollectionEquality()
                .equals(other._verifyForm, _verifyForm) &&
            const DeepCollectionEquality()
                .equals(other._resetForm, _resetForm) &&
            (identical(other.forgotPassVerifyModel, forgotPassVerifyModel) ||
                other.forgotPassVerifyModel == forgotPassVerifyModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isForgotPassSuccess,
      isVerifySuccess,
      isResetSuccess,
      errorForgotPass,
      errorVerify,
      errorReset,
      const DeepCollectionEquality().hash(_forgotPassForm),
      const DeepCollectionEquality().hash(_verifyForm),
      const DeepCollectionEquality().hash(_resetForm),
      forgotPassVerifyModel);

  @override
  String toString() {
    return 'ForgotPassState(isLoading: $isLoading, isForgotPassSuccess: $isForgotPassSuccess, isVerifySuccess: $isVerifySuccess, isResetSuccess: $isResetSuccess, errorForgotPass: $errorForgotPass, errorVerify: $errorVerify, errorReset: $errorReset, forgotPassForm: $forgotPassForm, verifyForm: $verifyForm, resetForm: $resetForm, forgotPassVerifyModel: $forgotPassVerifyModel)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPassStateCopyWith<$Res>
    implements $ForgotPassStateCopyWith<$Res> {
  factory _$ForgotPassStateCopyWith(
          _ForgotPassState value, $Res Function(_ForgotPassState) _then) =
      __$ForgotPassStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool? isForgotPassSuccess,
      bool? isVerifySuccess,
      bool? isResetSuccess,
      String? errorForgotPass,
      String? errorVerify,
      String? errorReset,
      Map<String, dynamic> forgotPassForm,
      Map<String, dynamic> verifyForm,
      Map<String, dynamic> resetForm,
      ForgotPassVerifyModel? forgotPassVerifyModel});

  @override
  $ForgotPassVerifyModelCopyWith<$Res>? get forgotPassVerifyModel;
}

/// @nodoc
class __$ForgotPassStateCopyWithImpl<$Res>
    implements _$ForgotPassStateCopyWith<$Res> {
  __$ForgotPassStateCopyWithImpl(this._self, this._then);

  final _ForgotPassState _self;
  final $Res Function(_ForgotPassState) _then;

  /// Create a copy of ForgotPassState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isForgotPassSuccess = freezed,
    Object? isVerifySuccess = freezed,
    Object? isResetSuccess = freezed,
    Object? errorForgotPass = freezed,
    Object? errorVerify = freezed,
    Object? errorReset = freezed,
    Object? forgotPassForm = null,
    Object? verifyForm = null,
    Object? resetForm = null,
    Object? forgotPassVerifyModel = freezed,
  }) {
    return _then(_ForgotPassState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isForgotPassSuccess: freezed == isForgotPassSuccess
          ? _self.isForgotPassSuccess
          : isForgotPassSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerifySuccess: freezed == isVerifySuccess
          ? _self.isVerifySuccess
          : isVerifySuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResetSuccess: freezed == isResetSuccess
          ? _self.isResetSuccess
          : isResetSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorForgotPass: freezed == errorForgotPass
          ? _self.errorForgotPass
          : errorForgotPass // ignore: cast_nullable_to_non_nullable
              as String?,
      errorVerify: freezed == errorVerify
          ? _self.errorVerify
          : errorVerify // ignore: cast_nullable_to_non_nullable
              as String?,
      errorReset: freezed == errorReset
          ? _self.errorReset
          : errorReset // ignore: cast_nullable_to_non_nullable
              as String?,
      forgotPassForm: null == forgotPassForm
          ? _self._forgotPassForm
          : forgotPassForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      verifyForm: null == verifyForm
          ? _self._verifyForm
          : verifyForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      resetForm: null == resetForm
          ? _self._resetForm
          : resetForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      forgotPassVerifyModel: freezed == forgotPassVerifyModel
          ? _self.forgotPassVerifyModel
          : forgotPassVerifyModel // ignore: cast_nullable_to_non_nullable
              as ForgotPassVerifyModel?,
    ));
  }

  /// Create a copy of ForgotPassState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForgotPassVerifyModelCopyWith<$Res>? get forgotPassVerifyModel {
    if (_self.forgotPassVerifyModel == null) {
      return null;
    }

    return $ForgotPassVerifyModelCopyWith<$Res>(_self.forgotPassVerifyModel!,
        (value) {
      return _then(_self.copyWith(forgotPassVerifyModel: value));
    });
  }
}

// dart format on

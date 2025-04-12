// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupState {
  SignupModel? get signUpModel;
  bool? get isSignUpSuccess;
  bool? get isVerifySuccess;
  bool get isLoading;
  String? get error;
  Map<String, dynamic> get signupForm;
  Map<String, dynamic> get verifyForm;
  bool get isPasswordVisibility;
  bool get isConfirmPasswordVisibility;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignupStateCopyWith<SignupState> get copyWith =>
      _$SignupStateCopyWithImpl<SignupState>(this as SignupState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignupState &&
            (identical(other.signUpModel, signUpModel) ||
                other.signUpModel == signUpModel) &&
            (identical(other.isSignUpSuccess, isSignUpSuccess) ||
                other.isSignUpSuccess == isSignUpSuccess) &&
            (identical(other.isVerifySuccess, isVerifySuccess) ||
                other.isVerifySuccess == isVerifySuccess) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other.signupForm, signupForm) &&
            const DeepCollectionEquality()
                .equals(other.verifyForm, verifyForm) &&
            (identical(other.isPasswordVisibility, isPasswordVisibility) ||
                other.isPasswordVisibility == isPasswordVisibility) &&
            (identical(other.isConfirmPasswordVisibility,
                    isConfirmPasswordVisibility) ||
                other.isConfirmPasswordVisibility ==
                    isConfirmPasswordVisibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      signUpModel,
      isSignUpSuccess,
      isVerifySuccess,
      isLoading,
      error,
      const DeepCollectionEquality().hash(signupForm),
      const DeepCollectionEquality().hash(verifyForm),
      isPasswordVisibility,
      isConfirmPasswordVisibility);

  @override
  String toString() {
    return 'SignupState(signUpModel: $signUpModel, isSignUpSuccess: $isSignUpSuccess, isVerifySuccess: $isVerifySuccess, isLoading: $isLoading, error: $error, signupForm: $signupForm, verifyForm: $verifyForm, isPasswordVisibility: $isPasswordVisibility, isConfirmPasswordVisibility: $isConfirmPasswordVisibility)';
  }
}

/// @nodoc
abstract mixin class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) _then) =
      _$SignupStateCopyWithImpl;
  @useResult
  $Res call(
      {SignupModel? signUpModel,
      bool? isSignUpSuccess,
      bool? isVerifySuccess,
      bool isLoading,
      String? error,
      Map<String, dynamic> signupForm,
      Map<String, dynamic> verifyForm,
      bool isPasswordVisibility,
      bool isConfirmPasswordVisibility});

  $SignupModelCopyWith<$Res>? get signUpModel;
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res> implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._self, this._then);

  final SignupState _self;
  final $Res Function(SignupState) _then;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signUpModel = freezed,
    Object? isSignUpSuccess = freezed,
    Object? isVerifySuccess = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? signupForm = null,
    Object? verifyForm = null,
    Object? isPasswordVisibility = null,
    Object? isConfirmPasswordVisibility = null,
  }) {
    return _then(_self.copyWith(
      signUpModel: freezed == signUpModel
          ? _self.signUpModel
          : signUpModel // ignore: cast_nullable_to_non_nullable
              as SignupModel?,
      isSignUpSuccess: freezed == isSignUpSuccess
          ? _self.isSignUpSuccess
          : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerifySuccess: freezed == isVerifySuccess
          ? _self.isVerifySuccess
          : isVerifySuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      signupForm: null == signupForm
          ? _self.signupForm
          : signupForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      verifyForm: null == verifyForm
          ? _self.verifyForm
          : verifyForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isPasswordVisibility: null == isPasswordVisibility
          ? _self.isPasswordVisibility
          : isPasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordVisibility: null == isConfirmPasswordVisibility
          ? _self.isConfirmPasswordVisibility
          : isConfirmPasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignupModelCopyWith<$Res>? get signUpModel {
    if (_self.signUpModel == null) {
      return null;
    }

    return $SignupModelCopyWith<$Res>(_self.signUpModel!, (value) {
      return _then(_self.copyWith(signUpModel: value));
    });
  }
}

/// @nodoc

class _SignupState implements SignupState {
  _SignupState(
      {this.signUpModel,
      this.isSignUpSuccess,
      this.isVerifySuccess,
      this.isLoading = false,
      this.error,
      final Map<String, dynamic> signupForm = const {},
      final Map<String, dynamic> verifyForm = const {},
      this.isPasswordVisibility = false,
      this.isConfirmPasswordVisibility = false})
      : _signupForm = signupForm,
        _verifyForm = verifyForm;

  @override
  final SignupModel? signUpModel;
  @override
  final bool? isSignUpSuccess;
  @override
  final bool? isVerifySuccess;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  final Map<String, dynamic> _signupForm;
  @override
  @JsonKey()
  Map<String, dynamic> get signupForm {
    if (_signupForm is EqualUnmodifiableMapView) return _signupForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_signupForm);
  }

  final Map<String, dynamic> _verifyForm;
  @override
  @JsonKey()
  Map<String, dynamic> get verifyForm {
    if (_verifyForm is EqualUnmodifiableMapView) return _verifyForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_verifyForm);
  }

  @override
  @JsonKey()
  final bool isPasswordVisibility;
  @override
  @JsonKey()
  final bool isConfirmPasswordVisibility;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignupStateCopyWith<_SignupState> get copyWith =>
      __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignupState &&
            (identical(other.signUpModel, signUpModel) ||
                other.signUpModel == signUpModel) &&
            (identical(other.isSignUpSuccess, isSignUpSuccess) ||
                other.isSignUpSuccess == isSignUpSuccess) &&
            (identical(other.isVerifySuccess, isVerifySuccess) ||
                other.isVerifySuccess == isVerifySuccess) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._signupForm, _signupForm) &&
            const DeepCollectionEquality()
                .equals(other._verifyForm, _verifyForm) &&
            (identical(other.isPasswordVisibility, isPasswordVisibility) ||
                other.isPasswordVisibility == isPasswordVisibility) &&
            (identical(other.isConfirmPasswordVisibility,
                    isConfirmPasswordVisibility) ||
                other.isConfirmPasswordVisibility ==
                    isConfirmPasswordVisibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      signUpModel,
      isSignUpSuccess,
      isVerifySuccess,
      isLoading,
      error,
      const DeepCollectionEquality().hash(_signupForm),
      const DeepCollectionEquality().hash(_verifyForm),
      isPasswordVisibility,
      isConfirmPasswordVisibility);

  @override
  String toString() {
    return 'SignupState(signUpModel: $signUpModel, isSignUpSuccess: $isSignUpSuccess, isVerifySuccess: $isVerifySuccess, isLoading: $isLoading, error: $error, signupForm: $signupForm, verifyForm: $verifyForm, isPasswordVisibility: $isPasswordVisibility, isConfirmPasswordVisibility: $isConfirmPasswordVisibility)';
  }
}

/// @nodoc
abstract mixin class _$SignupStateCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(
          _SignupState value, $Res Function(_SignupState) _then) =
      __$SignupStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SignupModel? signUpModel,
      bool? isSignUpSuccess,
      bool? isVerifySuccess,
      bool isLoading,
      String? error,
      Map<String, dynamic> signupForm,
      Map<String, dynamic> verifyForm,
      bool isPasswordVisibility,
      bool isConfirmPasswordVisibility});

  @override
  $SignupModelCopyWith<$Res>? get signUpModel;
}

/// @nodoc
class __$SignupStateCopyWithImpl<$Res> implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(this._self, this._then);

  final _SignupState _self;
  final $Res Function(_SignupState) _then;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? signUpModel = freezed,
    Object? isSignUpSuccess = freezed,
    Object? isVerifySuccess = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? signupForm = null,
    Object? verifyForm = null,
    Object? isPasswordVisibility = null,
    Object? isConfirmPasswordVisibility = null,
  }) {
    return _then(_SignupState(
      signUpModel: freezed == signUpModel
          ? _self.signUpModel
          : signUpModel // ignore: cast_nullable_to_non_nullable
              as SignupModel?,
      isSignUpSuccess: freezed == isSignUpSuccess
          ? _self.isSignUpSuccess
          : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerifySuccess: freezed == isVerifySuccess
          ? _self.isVerifySuccess
          : isVerifySuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      signupForm: null == signupForm
          ? _self._signupForm
          : signupForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      verifyForm: null == verifyForm
          ? _self._verifyForm
          : verifyForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isPasswordVisibility: null == isPasswordVisibility
          ? _self.isPasswordVisibility
          : isPasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordVisibility: null == isConfirmPasswordVisibility
          ? _self.isConfirmPasswordVisibility
          : isConfirmPasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignupModelCopyWith<$Res>? get signUpModel {
    if (_self.signUpModel == null) {
      return null;
    }

    return $SignupModelCopyWith<$Res>(_self.signUpModel!, (value) {
      return _then(_self.copyWith(signUpModel: value));
    });
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginState {
  bool get isLoading;
  bool? get isLoginSuccess;
  LoginModel? get loginModel;
  String? get error;
  Map<String, dynamic> get loginForm;
  bool get isPasswordVisibility;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginStateCopyWith<LoginState> get copyWith =>
      _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoginSuccess, isLoginSuccess) ||
                other.isLoginSuccess == isLoginSuccess) &&
            (identical(other.loginModel, loginModel) ||
                other.loginModel == loginModel) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.loginForm, loginForm) &&
            (identical(other.isPasswordVisibility, isPasswordVisibility) ||
                other.isPasswordVisibility == isPasswordVisibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoginSuccess,
      loginModel,
      error,
      const DeepCollectionEquality().hash(loginForm),
      isPasswordVisibility);

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, isLoginSuccess: $isLoginSuccess, loginModel: $loginModel, error: $error, loginForm: $loginForm, isPasswordVisibility: $isPasswordVisibility)';
  }
}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) _then) =
      _$LoginStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool? isLoginSuccess,
      LoginModel? loginModel,
      String? error,
      Map<String, dynamic> loginForm,
      bool isPasswordVisibility});

  $LoginModelCopyWith<$Res>? get loginModel;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoginSuccess = freezed,
    Object? loginModel = freezed,
    Object? error = freezed,
    Object? loginForm = null,
    Object? isPasswordVisibility = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: freezed == isLoginSuccess
          ? _self.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginModel: freezed == loginModel
          ? _self.loginModel
          : loginModel // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      loginForm: null == loginForm
          ? _self.loginForm
          : loginForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isPasswordVisibility: null == isPasswordVisibility
          ? _self.isPasswordVisibility
          : isPasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginModelCopyWith<$Res>? get loginModel {
    if (_self.loginModel == null) {
      return null;
    }

    return $LoginModelCopyWith<$Res>(_self.loginModel!, (value) {
      return _then(_self.copyWith(loginModel: value));
    });
  }
}

/// @nodoc

class _LoginState implements LoginState {
  const _LoginState(
      {this.isLoading = false,
      this.isLoginSuccess,
      this.loginModel,
      this.error,
      final Map<String, dynamic> loginForm = const {},
      this.isPasswordVisibility = false})
      : _loginForm = loginForm;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? isLoginSuccess;
  @override
  final LoginModel? loginModel;
  @override
  final String? error;
  final Map<String, dynamic> _loginForm;
  @override
  @JsonKey()
  Map<String, dynamic> get loginForm {
    if (_loginForm is EqualUnmodifiableMapView) return _loginForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_loginForm);
  }

  @override
  @JsonKey()
  final bool isPasswordVisibility;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoginSuccess, isLoginSuccess) ||
                other.isLoginSuccess == isLoginSuccess) &&
            (identical(other.loginModel, loginModel) ||
                other.loginModel == loginModel) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._loginForm, _loginForm) &&
            (identical(other.isPasswordVisibility, isPasswordVisibility) ||
                other.isPasswordVisibility == isPasswordVisibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoginSuccess,
      loginModel,
      error,
      const DeepCollectionEquality().hash(_loginForm),
      isPasswordVisibility);

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, isLoginSuccess: $isLoginSuccess, loginModel: $loginModel, error: $error, loginForm: $loginForm, isPasswordVisibility: $isPasswordVisibility)';
  }
}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) _then) =
      __$LoginStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool? isLoginSuccess,
      LoginModel? loginModel,
      String? error,
      Map<String, dynamic> loginForm,
      bool isPasswordVisibility});

  @override
  $LoginModelCopyWith<$Res>? get loginModel;
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isLoginSuccess = freezed,
    Object? loginModel = freezed,
    Object? error = freezed,
    Object? loginForm = null,
    Object? isPasswordVisibility = null,
  }) {
    return _then(_LoginState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: freezed == isLoginSuccess
          ? _self.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginModel: freezed == loginModel
          ? _self.loginModel
          : loginModel // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      loginForm: null == loginForm
          ? _self._loginForm
          : loginForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isPasswordVisibility: null == isPasswordVisibility
          ? _self.isPasswordVisibility
          : isPasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginModelCopyWith<$Res>? get loginModel {
    if (_self.loginModel == null) {
      return null;
    }

    return $LoginModelCopyWith<$Res>(_self.loginModel!, (value) {
      return _then(_self.copyWith(loginModel: value));
    });
  }
}

// dart format on

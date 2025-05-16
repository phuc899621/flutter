// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get isLoginSuccess => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Map<String, dynamic> get loginForm => throw _privateConstructorUsedError;
  bool get isPasswordVisibility => throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool? isLoginSuccess,
      String? token,
      String? error,
      Map<String, dynamic> loginForm,
      bool isPasswordVisibility});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoginSuccess = freezed,
    Object? token = freezed,
    Object? error = freezed,
    Object? loginForm = null,
    Object? isPasswordVisibility = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: freezed == isLoginSuccess
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      loginForm: null == loginForm
          ? _value.loginForm
          : loginForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isPasswordVisibility: null == isPasswordVisibility
          ? _value.isPasswordVisibility
          : isPasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool? isLoginSuccess,
      String? token,
      String? error,
      Map<String, dynamic> loginForm,
      bool isPasswordVisibility});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoginSuccess = freezed,
    Object? token = freezed,
    Object? error = freezed,
    Object? loginForm = null,
    Object? isPasswordVisibility = null,
  }) {
    return _then(_$LoginStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: freezed == isLoginSuccess
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      loginForm: null == loginForm
          ? _value._loginForm
          : loginForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isPasswordVisibility: null == isPasswordVisibility
          ? _value.isPasswordVisibility
          : isPasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl(
      {this.isLoading = false,
      this.isLoginSuccess,
      this.token,
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
  final String? token;
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

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, isLoginSuccess: $isLoginSuccess, token: $token, error: $error, loginForm: $loginForm, isPasswordVisibility: $isPasswordVisibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoginSuccess, isLoginSuccess) ||
                other.isLoginSuccess == isLoginSuccess) &&
            (identical(other.token, token) || other.token == token) &&
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
      token,
      error,
      const DeepCollectionEquality().hash(_loginForm),
      isPasswordVisibility);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final bool isLoading,
      final bool? isLoginSuccess,
      final String? token,
      final String? error,
      final Map<String, dynamic> loginForm,
      final bool isPasswordVisibility}) = _$LoginStateImpl;

  @override
  bool get isLoading;
  @override
  bool? get isLoginSuccess;
  @override
  String? get token;
  @override
  String? get error;
  @override
  Map<String, dynamic> get loginForm;
  @override
  bool get isPasswordVisibility;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

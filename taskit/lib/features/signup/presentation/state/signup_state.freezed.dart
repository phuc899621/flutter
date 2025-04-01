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
  bool get isLoading;
  String? get error;
  Map<String, dynamic> get signUpform;

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
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other.signUpform, signUpform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpModel, isSignUpSuccess,
      isLoading, error, const DeepCollectionEquality().hash(signUpform));

  @override
  String toString() {
    return 'SignupState(signUpModel: $signUpModel, isSignUpSuccess: $isSignUpSuccess, isLoading: $isLoading, error: $error, signUpform: $signUpform)';
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
      bool isLoading,
      String? error,
      Map<String, dynamic> signUpform});

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
    Object? isLoading = null,
    Object? error = freezed,
    Object? signUpform = null,
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
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      signUpform: null == signUpform
          ? _self.signUpform
          : signUpform // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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
      this.isLoading = false,
      this.error,
      final Map<String, dynamic> signUpform = const {}})
      : _signUpform = signUpform;

  @override
  final SignupModel? signUpModel;
  @override
  final bool? isSignUpSuccess;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  final Map<String, dynamic> _signUpform;
  @override
  @JsonKey()
  Map<String, dynamic> get signUpform {
    if (_signUpform is EqualUnmodifiableMapView) return _signUpform;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_signUpform);
  }

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
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._signUpform, _signUpform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpModel, isSignUpSuccess,
      isLoading, error, const DeepCollectionEquality().hash(_signUpform));

  @override
  String toString() {
    return 'SignupState(signUpModel: $signUpModel, isSignUpSuccess: $isSignUpSuccess, isLoading: $isLoading, error: $error, signUpform: $signUpform)';
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
      bool isLoading,
      String? error,
      Map<String, dynamic> signUpform});

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
    Object? isLoading = null,
    Object? error = freezed,
    Object? signUpform = null,
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
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      signUpform: null == signUpform
          ? _self._signUpform
          : signUpform // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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

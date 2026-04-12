// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 bool? get isSignUpSuccess; bool? get isVerifySuccess; bool get isLoading; String? get error; SignupModel get signupForm; SignupVerifyModel get verifyForm; bool get isPasswordVisibility; bool get isConfirmPasswordVisibility;
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateCopyWith<SignupState> get copyWith => _$SignupStateCopyWithImpl<SignupState>(this as SignupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState&&(identical(other.isSignUpSuccess, isSignUpSuccess) || other.isSignUpSuccess == isSignUpSuccess)&&(identical(other.isVerifySuccess, isVerifySuccess) || other.isVerifySuccess == isVerifySuccess)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.signupForm, signupForm) || other.signupForm == signupForm)&&(identical(other.verifyForm, verifyForm) || other.verifyForm == verifyForm)&&(identical(other.isPasswordVisibility, isPasswordVisibility) || other.isPasswordVisibility == isPasswordVisibility)&&(identical(other.isConfirmPasswordVisibility, isConfirmPasswordVisibility) || other.isConfirmPasswordVisibility == isConfirmPasswordVisibility));
}


@override
int get hashCode => Object.hash(runtimeType,isSignUpSuccess,isVerifySuccess,isLoading,error,signupForm,verifyForm,isPasswordVisibility,isConfirmPasswordVisibility);

@override
String toString() {
  return 'SignupState(isSignUpSuccess: $isSignUpSuccess, isVerifySuccess: $isVerifySuccess, isLoading: $isLoading, error: $error, signupForm: $signupForm, verifyForm: $verifyForm, isPasswordVisibility: $isPasswordVisibility, isConfirmPasswordVisibility: $isConfirmPasswordVisibility)';
}


}

/// @nodoc
abstract mixin class $SignupStateCopyWith<$Res>  {
  factory $SignupStateCopyWith(SignupState value, $Res Function(SignupState) _then) = _$SignupStateCopyWithImpl;
@useResult
$Res call({
 bool? isSignUpSuccess, bool? isVerifySuccess, bool isLoading, String? error, SignupModel signupForm, SignupVerifyModel verifyForm, bool isPasswordVisibility, bool isConfirmPasswordVisibility
});


$SignupModelCopyWith<$Res> get signupForm;$SignupVerifyModelCopyWith<$Res> get verifyForm;

}
/// @nodoc
class _$SignupStateCopyWithImpl<$Res>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._self, this._then);

  final SignupState _self;
  final $Res Function(SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSignUpSuccess = freezed,Object? isVerifySuccess = freezed,Object? isLoading = null,Object? error = freezed,Object? signupForm = null,Object? verifyForm = null,Object? isPasswordVisibility = null,Object? isConfirmPasswordVisibility = null,}) {
  return _then(_self.copyWith(
isSignUpSuccess: freezed == isSignUpSuccess ? _self.isSignUpSuccess : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isVerifySuccess: freezed == isVerifySuccess ? _self.isVerifySuccess : isVerifySuccess // ignore: cast_nullable_to_non_nullable
as bool?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,signupForm: null == signupForm ? _self.signupForm : signupForm // ignore: cast_nullable_to_non_nullable
as SignupModel,verifyForm: null == verifyForm ? _self.verifyForm : verifyForm // ignore: cast_nullable_to_non_nullable
as SignupVerifyModel,isPasswordVisibility: null == isPasswordVisibility ? _self.isPasswordVisibility : isPasswordVisibility // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisibility: null == isConfirmPasswordVisibility ? _self.isConfirmPasswordVisibility : isConfirmPasswordVisibility // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignupModelCopyWith<$Res> get signupForm {
  
  return $SignupModelCopyWith<$Res>(_self.signupForm, (value) {
    return _then(_self.copyWith(signupForm: value));
  });
}/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignupVerifyModelCopyWith<$Res> get verifyForm {
  
  return $SignupVerifyModelCopyWith<$Res>(_self.verifyForm, (value) {
    return _then(_self.copyWith(verifyForm: value));
  });
}
}


/// Adds pattern-matching-related methods to [SignupState].
extension SignupStatePatterns on SignupState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupState value)  $default,){
final _that = this;
switch (_that) {
case _SignupState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupState value)?  $default,){
final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? isSignUpSuccess,  bool? isVerifySuccess,  bool isLoading,  String? error,  SignupModel signupForm,  SignupVerifyModel verifyForm,  bool isPasswordVisibility,  bool isConfirmPasswordVisibility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.isSignUpSuccess,_that.isVerifySuccess,_that.isLoading,_that.error,_that.signupForm,_that.verifyForm,_that.isPasswordVisibility,_that.isConfirmPasswordVisibility);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? isSignUpSuccess,  bool? isVerifySuccess,  bool isLoading,  String? error,  SignupModel signupForm,  SignupVerifyModel verifyForm,  bool isPasswordVisibility,  bool isConfirmPasswordVisibility)  $default,) {final _that = this;
switch (_that) {
case _SignupState():
return $default(_that.isSignUpSuccess,_that.isVerifySuccess,_that.isLoading,_that.error,_that.signupForm,_that.verifyForm,_that.isPasswordVisibility,_that.isConfirmPasswordVisibility);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? isSignUpSuccess,  bool? isVerifySuccess,  bool isLoading,  String? error,  SignupModel signupForm,  SignupVerifyModel verifyForm,  bool isPasswordVisibility,  bool isConfirmPasswordVisibility)?  $default,) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.isSignUpSuccess,_that.isVerifySuccess,_that.isLoading,_that.error,_that.signupForm,_that.verifyForm,_that.isPasswordVisibility,_that.isConfirmPasswordVisibility);case _:
  return null;

}
}

}

/// @nodoc


class _SignupState implements SignupState {
   _SignupState({this.isSignUpSuccess, this.isVerifySuccess, this.isLoading = false, this.error, this.signupForm = const SignupModel(email: '', password: ''), this.verifyForm = const SignupVerifyModel(email: '', otp: ''), this.isPasswordVisibility = false, this.isConfirmPasswordVisibility = false});
  

@override final  bool? isSignUpSuccess;
@override final  bool? isVerifySuccess;
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  SignupModel signupForm;
@override@JsonKey() final  SignupVerifyModel verifyForm;
@override@JsonKey() final  bool isPasswordVisibility;
@override@JsonKey() final  bool isConfirmPasswordVisibility;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupStateCopyWith<_SignupState> get copyWith => __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupState&&(identical(other.isSignUpSuccess, isSignUpSuccess) || other.isSignUpSuccess == isSignUpSuccess)&&(identical(other.isVerifySuccess, isVerifySuccess) || other.isVerifySuccess == isVerifySuccess)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.signupForm, signupForm) || other.signupForm == signupForm)&&(identical(other.verifyForm, verifyForm) || other.verifyForm == verifyForm)&&(identical(other.isPasswordVisibility, isPasswordVisibility) || other.isPasswordVisibility == isPasswordVisibility)&&(identical(other.isConfirmPasswordVisibility, isConfirmPasswordVisibility) || other.isConfirmPasswordVisibility == isConfirmPasswordVisibility));
}


@override
int get hashCode => Object.hash(runtimeType,isSignUpSuccess,isVerifySuccess,isLoading,error,signupForm,verifyForm,isPasswordVisibility,isConfirmPasswordVisibility);

@override
String toString() {
  return 'SignupState(isSignUpSuccess: $isSignUpSuccess, isVerifySuccess: $isVerifySuccess, isLoading: $isLoading, error: $error, signupForm: $signupForm, verifyForm: $verifyForm, isPasswordVisibility: $isPasswordVisibility, isConfirmPasswordVisibility: $isConfirmPasswordVisibility)';
}


}

/// @nodoc
abstract mixin class _$SignupStateCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(_SignupState value, $Res Function(_SignupState) _then) = __$SignupStateCopyWithImpl;
@override @useResult
$Res call({
 bool? isSignUpSuccess, bool? isVerifySuccess, bool isLoading, String? error, SignupModel signupForm, SignupVerifyModel verifyForm, bool isPasswordVisibility, bool isConfirmPasswordVisibility
});


@override $SignupModelCopyWith<$Res> get signupForm;@override $SignupVerifyModelCopyWith<$Res> get verifyForm;

}
/// @nodoc
class __$SignupStateCopyWithImpl<$Res>
    implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(this._self, this._then);

  final _SignupState _self;
  final $Res Function(_SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSignUpSuccess = freezed,Object? isVerifySuccess = freezed,Object? isLoading = null,Object? error = freezed,Object? signupForm = null,Object? verifyForm = null,Object? isPasswordVisibility = null,Object? isConfirmPasswordVisibility = null,}) {
  return _then(_SignupState(
isSignUpSuccess: freezed == isSignUpSuccess ? _self.isSignUpSuccess : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isVerifySuccess: freezed == isVerifySuccess ? _self.isVerifySuccess : isVerifySuccess // ignore: cast_nullable_to_non_nullable
as bool?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,signupForm: null == signupForm ? _self.signupForm : signupForm // ignore: cast_nullable_to_non_nullable
as SignupModel,verifyForm: null == verifyForm ? _self.verifyForm : verifyForm // ignore: cast_nullable_to_non_nullable
as SignupVerifyModel,isPasswordVisibility: null == isPasswordVisibility ? _self.isPasswordVisibility : isPasswordVisibility // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisibility: null == isConfirmPasswordVisibility ? _self.isConfirmPasswordVisibility : isConfirmPasswordVisibility // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignupModelCopyWith<$Res> get signupForm {
  
  return $SignupModelCopyWith<$Res>(_self.signupForm, (value) {
    return _then(_self.copyWith(signupForm: value));
  });
}/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignupVerifyModelCopyWith<$Res> get verifyForm {
  
  return $SignupVerifyModelCopyWith<$Res>(_self.verifyForm, (value) {
    return _then(_self.copyWith(verifyForm: value));
  });
}
}

// dart format on

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

 bool get isLoading; String? get apiError; SignupStatus get status; SignupRegisterEntity get registerForm; SignupVerifyEntity get verifyForm; SignupResendEntity get resendForm;
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateCopyWith<SignupState> get copyWith => _$SignupStateCopyWithImpl<SignupState>(this as SignupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.apiError, apiError) || other.apiError == apiError)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.registerForm, registerForm)&&const DeepCollectionEquality().equals(other.verifyForm, verifyForm)&&const DeepCollectionEquality().equals(other.resendForm, resendForm));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,apiError,status,const DeepCollectionEquality().hash(registerForm),const DeepCollectionEquality().hash(verifyForm),const DeepCollectionEquality().hash(resendForm));

@override
String toString() {
  return 'SignupState(isLoading: $isLoading, apiError: $apiError, status: $status, registerForm: $registerForm, verifyForm: $verifyForm, resendForm: $resendForm)';
}


}

/// @nodoc
abstract mixin class $SignupStateCopyWith<$Res>  {
  factory $SignupStateCopyWith(SignupState value, $Res Function(SignupState) _then) = _$SignupStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? apiError, SignupStatus status, SignupRegisterEntity registerForm, SignupVerifyEntity verifyForm, SignupResendEntity resendForm
});




}
/// @nodoc
class _$SignupStateCopyWithImpl<$Res>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._self, this._then);

  final SignupState _self;
  final $Res Function(SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? apiError = freezed,Object? status = null,Object? registerForm = freezed,Object? verifyForm = freezed,Object? resendForm = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,apiError: freezed == apiError ? _self.apiError : apiError // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SignupStatus,registerForm: freezed == registerForm ? _self.registerForm : registerForm // ignore: cast_nullable_to_non_nullable
as SignupRegisterEntity,verifyForm: freezed == verifyForm ? _self.verifyForm : verifyForm // ignore: cast_nullable_to_non_nullable
as SignupVerifyEntity,resendForm: freezed == resendForm ? _self.resendForm : resendForm // ignore: cast_nullable_to_non_nullable
as SignupResendEntity,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? apiError,  SignupStatus status,  SignupRegisterEntity registerForm,  SignupVerifyEntity verifyForm,  SignupResendEntity resendForm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.isLoading,_that.apiError,_that.status,_that.registerForm,_that.verifyForm,_that.resendForm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? apiError,  SignupStatus status,  SignupRegisterEntity registerForm,  SignupVerifyEntity verifyForm,  SignupResendEntity resendForm)  $default,) {final _that = this;
switch (_that) {
case _SignupState():
return $default(_that.isLoading,_that.apiError,_that.status,_that.registerForm,_that.verifyForm,_that.resendForm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? apiError,  SignupStatus status,  SignupRegisterEntity registerForm,  SignupVerifyEntity verifyForm,  SignupResendEntity resendForm)?  $default,) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.isLoading,_that.apiError,_that.status,_that.registerForm,_that.verifyForm,_that.resendForm);case _:
  return null;

}
}

}

/// @nodoc


class _SignupState implements SignupState {
   _SignupState({this.isLoading = false, this.apiError, this.status = SignupStatus.initial, this.registerForm = SignupEntity.initialRegister, this.verifyForm = SignupEntity.initialVerify, this.resendForm = SignupEntity.initialResend});
  

@override@JsonKey() final  bool isLoading;
@override final  String? apiError;
@override@JsonKey() final  SignupStatus status;
@override@JsonKey() final  SignupRegisterEntity registerForm;
@override@JsonKey() final  SignupVerifyEntity verifyForm;
@override@JsonKey() final  SignupResendEntity resendForm;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupStateCopyWith<_SignupState> get copyWith => __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.apiError, apiError) || other.apiError == apiError)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.registerForm, registerForm)&&const DeepCollectionEquality().equals(other.verifyForm, verifyForm)&&const DeepCollectionEquality().equals(other.resendForm, resendForm));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,apiError,status,const DeepCollectionEquality().hash(registerForm),const DeepCollectionEquality().hash(verifyForm),const DeepCollectionEquality().hash(resendForm));

@override
String toString() {
  return 'SignupState(isLoading: $isLoading, apiError: $apiError, status: $status, registerForm: $registerForm, verifyForm: $verifyForm, resendForm: $resendForm)';
}


}

/// @nodoc
abstract mixin class _$SignupStateCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(_SignupState value, $Res Function(_SignupState) _then) = __$SignupStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? apiError, SignupStatus status, SignupRegisterEntity registerForm, SignupVerifyEntity verifyForm, SignupResendEntity resendForm
});




}
/// @nodoc
class __$SignupStateCopyWithImpl<$Res>
    implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(this._self, this._then);

  final _SignupState _self;
  final $Res Function(_SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? apiError = freezed,Object? status = null,Object? registerForm = freezed,Object? verifyForm = freezed,Object? resendForm = freezed,}) {
  return _then(_SignupState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,apiError: freezed == apiError ? _self.apiError : apiError // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SignupStatus,registerForm: freezed == registerForm ? _self.registerForm : registerForm // ignore: cast_nullable_to_non_nullable
as SignupRegisterEntity,verifyForm: freezed == verifyForm ? _self.verifyForm : verifyForm // ignore: cast_nullable_to_non_nullable
as SignupVerifyEntity,resendForm: freezed == resendForm ? _self.resendForm : resendForm // ignore: cast_nullable_to_non_nullable
as SignupResendEntity,
  ));
}


}

// dart format on

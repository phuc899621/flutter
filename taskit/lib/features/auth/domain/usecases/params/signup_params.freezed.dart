// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupParams {

 String get email;
/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupParamsCopyWith<SignupParams> get copyWith => _$SignupParamsCopyWithImpl<SignupParams>(this as SignupParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupParams&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignupParams(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignupParamsCopyWith<$Res>  {
  factory $SignupParamsCopyWith(SignupParams value, $Res Function(SignupParams) _then) = _$SignupParamsCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignupParamsCopyWithImpl<$Res>
    implements $SignupParamsCopyWith<$Res> {
  _$SignupParamsCopyWithImpl(this._self, this._then);

  final SignupParams _self;
  final $Res Function(SignupParams) _then;

/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupParams].
extension SignupParamsPatterns on SignupParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignupRegisterParams value)?  register,TResult Function( SignupVerifyParams value)?  verify,TResult Function( SignupResendParams value)?  resend,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignupRegisterParams() when register != null:
return register(_that);case SignupVerifyParams() when verify != null:
return verify(_that);case SignupResendParams() when resend != null:
return resend(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignupRegisterParams value)  register,required TResult Function( SignupVerifyParams value)  verify,required TResult Function( SignupResendParams value)  resend,}){
final _that = this;
switch (_that) {
case SignupRegisterParams():
return register(_that);case SignupVerifyParams():
return verify(_that);case SignupResendParams():
return resend(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignupRegisterParams value)?  register,TResult? Function( SignupVerifyParams value)?  verify,TResult? Function( SignupResendParams value)?  resend,}){
final _that = this;
switch (_that) {
case SignupRegisterParams() when register != null:
return register(_that);case SignupVerifyParams() when verify != null:
return verify(_that);case SignupResendParams() when resend != null:
return resend(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  register,TResult Function( String email,  String otp)?  verify,TResult Function( String email)?  resend,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignupRegisterParams() when register != null:
return register(_that.email,_that.password);case SignupVerifyParams() when verify != null:
return verify(_that.email,_that.otp);case SignupResendParams() when resend != null:
return resend(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  register,required TResult Function( String email,  String otp)  verify,required TResult Function( String email)  resend,}) {final _that = this;
switch (_that) {
case SignupRegisterParams():
return register(_that.email,_that.password);case SignupVerifyParams():
return verify(_that.email,_that.otp);case SignupResendParams():
return resend(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  register,TResult? Function( String email,  String otp)?  verify,TResult? Function( String email)?  resend,}) {final _that = this;
switch (_that) {
case SignupRegisterParams() when register != null:
return register(_that.email,_that.password);case SignupVerifyParams() when verify != null:
return verify(_that.email,_that.otp);case SignupResendParams() when resend != null:
return resend(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class SignupRegisterParams implements SignupParams {
  const SignupRegisterParams({required this.email, required this.password});
  

@override final  String email;
 final  String password;

/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupRegisterParamsCopyWith<SignupRegisterParams> get copyWith => _$SignupRegisterParamsCopyWithImpl<SignupRegisterParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupRegisterParams&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SignupParams.register(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignupRegisterParamsCopyWith<$Res> implements $SignupParamsCopyWith<$Res> {
  factory $SignupRegisterParamsCopyWith(SignupRegisterParams value, $Res Function(SignupRegisterParams) _then) = _$SignupRegisterParamsCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$SignupRegisterParamsCopyWithImpl<$Res>
    implements $SignupRegisterParamsCopyWith<$Res> {
  _$SignupRegisterParamsCopyWithImpl(this._self, this._then);

  final SignupRegisterParams _self;
  final $Res Function(SignupRegisterParams) _then;

/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SignupRegisterParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupVerifyParams implements SignupParams {
  const SignupVerifyParams({required this.email, required this.otp});
  

@override final  String email;
 final  String otp;

/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupVerifyParamsCopyWith<SignupVerifyParams> get copyWith => _$SignupVerifyParamsCopyWithImpl<SignupVerifyParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupVerifyParams&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'SignupParams.verify(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $SignupVerifyParamsCopyWith<$Res> implements $SignupParamsCopyWith<$Res> {
  factory $SignupVerifyParamsCopyWith(SignupVerifyParams value, $Res Function(SignupVerifyParams) _then) = _$SignupVerifyParamsCopyWithImpl;
@override @useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class _$SignupVerifyParamsCopyWithImpl<$Res>
    implements $SignupVerifyParamsCopyWith<$Res> {
  _$SignupVerifyParamsCopyWithImpl(this._self, this._then);

  final SignupVerifyParams _self;
  final $Res Function(SignupVerifyParams) _then;

/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(SignupVerifyParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupResendParams implements SignupParams {
  const SignupResendParams({required this.email});
  

@override final  String email;

/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupResendParamsCopyWith<SignupResendParams> get copyWith => _$SignupResendParamsCopyWithImpl<SignupResendParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupResendParams&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignupParams.resend(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignupResendParamsCopyWith<$Res> implements $SignupParamsCopyWith<$Res> {
  factory $SignupResendParamsCopyWith(SignupResendParams value, $Res Function(SignupResendParams) _then) = _$SignupResendParamsCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignupResendParamsCopyWithImpl<$Res>
    implements $SignupResendParamsCopyWith<$Res> {
  _$SignupResendParamsCopyWithImpl(this._self, this._then);

  final SignupResendParams _self;
  final $Res Function(SignupResendParams) _then;

/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(SignupResendParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

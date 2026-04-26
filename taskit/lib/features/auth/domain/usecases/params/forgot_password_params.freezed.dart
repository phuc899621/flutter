// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPassParams {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPassParams);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPassParams()';
}


}

/// @nodoc
class $ForgotPassParamsCopyWith<$Res>  {
$ForgotPassParamsCopyWith(ForgotPassParams _, $Res Function(ForgotPassParams) __);
}


/// Adds pattern-matching-related methods to [ForgotPassParams].
extension ForgotPassParamsPatterns on ForgotPassParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ForgotPasswordParams value)?  forgot,TResult Function( ForgotPasswordVerifyParams value)?  verify,TResult Function( ForgotPasswordResetParams value)?  reset,TResult Function( ForgotPasswordResendParams value)?  resend,TResult Function( ForgotPasswordVerifyResultParams value)?  verifyResult,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ForgotPasswordParams() when forgot != null:
return forgot(_that);case ForgotPasswordVerifyParams() when verify != null:
return verify(_that);case ForgotPasswordResetParams() when reset != null:
return reset(_that);case ForgotPasswordResendParams() when resend != null:
return resend(_that);case ForgotPasswordVerifyResultParams() when verifyResult != null:
return verifyResult(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ForgotPasswordParams value)  forgot,required TResult Function( ForgotPasswordVerifyParams value)  verify,required TResult Function( ForgotPasswordResetParams value)  reset,required TResult Function( ForgotPasswordResendParams value)  resend,required TResult Function( ForgotPasswordVerifyResultParams value)  verifyResult,}){
final _that = this;
switch (_that) {
case ForgotPasswordParams():
return forgot(_that);case ForgotPasswordVerifyParams():
return verify(_that);case ForgotPasswordResetParams():
return reset(_that);case ForgotPasswordResendParams():
return resend(_that);case ForgotPasswordVerifyResultParams():
return verifyResult(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ForgotPasswordParams value)?  forgot,TResult? Function( ForgotPasswordVerifyParams value)?  verify,TResult? Function( ForgotPasswordResetParams value)?  reset,TResult? Function( ForgotPasswordResendParams value)?  resend,TResult? Function( ForgotPasswordVerifyResultParams value)?  verifyResult,}){
final _that = this;
switch (_that) {
case ForgotPasswordParams() when forgot != null:
return forgot(_that);case ForgotPasswordVerifyParams() when verify != null:
return verify(_that);case ForgotPasswordResetParams() when reset != null:
return reset(_that);case ForgotPasswordResendParams() when resend != null:
return resend(_that);case ForgotPasswordVerifyResultParams() when verifyResult != null:
return verifyResult(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  forgot,TResult Function( String email,  String otp)?  verify,TResult Function( String resetToken,  String password)?  reset,TResult Function( String email)?  resend,TResult Function( String resetToken)?  verifyResult,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ForgotPasswordParams() when forgot != null:
return forgot(_that.email);case ForgotPasswordVerifyParams() when verify != null:
return verify(_that.email,_that.otp);case ForgotPasswordResetParams() when reset != null:
return reset(_that.resetToken,_that.password);case ForgotPasswordResendParams() when resend != null:
return resend(_that.email);case ForgotPasswordVerifyResultParams() when verifyResult != null:
return verifyResult(_that.resetToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  forgot,required TResult Function( String email,  String otp)  verify,required TResult Function( String resetToken,  String password)  reset,required TResult Function( String email)  resend,required TResult Function( String resetToken)  verifyResult,}) {final _that = this;
switch (_that) {
case ForgotPasswordParams():
return forgot(_that.email);case ForgotPasswordVerifyParams():
return verify(_that.email,_that.otp);case ForgotPasswordResetParams():
return reset(_that.resetToken,_that.password);case ForgotPasswordResendParams():
return resend(_that.email);case ForgotPasswordVerifyResultParams():
return verifyResult(_that.resetToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  forgot,TResult? Function( String email,  String otp)?  verify,TResult? Function( String resetToken,  String password)?  reset,TResult? Function( String email)?  resend,TResult? Function( String resetToken)?  verifyResult,}) {final _that = this;
switch (_that) {
case ForgotPasswordParams() when forgot != null:
return forgot(_that.email);case ForgotPasswordVerifyParams() when verify != null:
return verify(_that.email,_that.otp);case ForgotPasswordResetParams() when reset != null:
return reset(_that.resetToken,_that.password);case ForgotPasswordResendParams() when resend != null:
return resend(_that.email);case ForgotPasswordVerifyResultParams() when verifyResult != null:
return verifyResult(_that.resetToken);case _:
  return null;

}
}

}

/// @nodoc


class ForgotPasswordParams implements ForgotPassParams {
  const ForgotPasswordParams({required this.email});
  

 final  String email;

/// Create a copy of ForgotPassParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordParamsCopyWith<ForgotPasswordParams> get copyWith => _$ForgotPasswordParamsCopyWithImpl<ForgotPasswordParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordParams&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPassParams.forgot(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordParamsCopyWith<$Res> implements $ForgotPassParamsCopyWith<$Res> {
  factory $ForgotPasswordParamsCopyWith(ForgotPasswordParams value, $Res Function(ForgotPasswordParams) _then) = _$ForgotPasswordParamsCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordParamsCopyWithImpl<$Res>
    implements $ForgotPasswordParamsCopyWith<$Res> {
  _$ForgotPasswordParamsCopyWithImpl(this._self, this._then);

  final ForgotPasswordParams _self;
  final $Res Function(ForgotPasswordParams) _then;

/// Create a copy of ForgotPassParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ForgotPasswordParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForgotPasswordVerifyParams implements ForgotPassParams {
  const ForgotPasswordVerifyParams({required this.email, required this.otp});
  

 final  String email;
 final  String otp;

/// Create a copy of ForgotPassParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordVerifyParamsCopyWith<ForgotPasswordVerifyParams> get copyWith => _$ForgotPasswordVerifyParamsCopyWithImpl<ForgotPasswordVerifyParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordVerifyParams&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'ForgotPassParams.verify(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordVerifyParamsCopyWith<$Res> implements $ForgotPassParamsCopyWith<$Res> {
  factory $ForgotPasswordVerifyParamsCopyWith(ForgotPasswordVerifyParams value, $Res Function(ForgotPasswordVerifyParams) _then) = _$ForgotPasswordVerifyParamsCopyWithImpl;
@useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class _$ForgotPasswordVerifyParamsCopyWithImpl<$Res>
    implements $ForgotPasswordVerifyParamsCopyWith<$Res> {
  _$ForgotPasswordVerifyParamsCopyWithImpl(this._self, this._then);

  final ForgotPasswordVerifyParams _self;
  final $Res Function(ForgotPasswordVerifyParams) _then;

/// Create a copy of ForgotPassParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(ForgotPasswordVerifyParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForgotPasswordResetParams implements ForgotPassParams {
  const ForgotPasswordResetParams({required this.resetToken, required this.password});
  

 final  String resetToken;
 final  String password;

/// Create a copy of ForgotPassParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordResetParamsCopyWith<ForgotPasswordResetParams> get copyWith => _$ForgotPasswordResetParamsCopyWithImpl<ForgotPasswordResetParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordResetParams&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,resetToken,password);

@override
String toString() {
  return 'ForgotPassParams.reset(resetToken: $resetToken, password: $password)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordResetParamsCopyWith<$Res> implements $ForgotPassParamsCopyWith<$Res> {
  factory $ForgotPasswordResetParamsCopyWith(ForgotPasswordResetParams value, $Res Function(ForgotPasswordResetParams) _then) = _$ForgotPasswordResetParamsCopyWithImpl;
@useResult
$Res call({
 String resetToken, String password
});




}
/// @nodoc
class _$ForgotPasswordResetParamsCopyWithImpl<$Res>
    implements $ForgotPasswordResetParamsCopyWith<$Res> {
  _$ForgotPasswordResetParamsCopyWithImpl(this._self, this._then);

  final ForgotPasswordResetParams _self;
  final $Res Function(ForgotPasswordResetParams) _then;

/// Create a copy of ForgotPassParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resetToken = null,Object? password = null,}) {
  return _then(ForgotPasswordResetParams(
resetToken: null == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForgotPasswordResendParams implements ForgotPassParams {
  const ForgotPasswordResendParams({required this.email});
  

 final  String email;

/// Create a copy of ForgotPassParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordResendParamsCopyWith<ForgotPasswordResendParams> get copyWith => _$ForgotPasswordResendParamsCopyWithImpl<ForgotPasswordResendParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordResendParams&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPassParams.resend(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordResendParamsCopyWith<$Res> implements $ForgotPassParamsCopyWith<$Res> {
  factory $ForgotPasswordResendParamsCopyWith(ForgotPasswordResendParams value, $Res Function(ForgotPasswordResendParams) _then) = _$ForgotPasswordResendParamsCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordResendParamsCopyWithImpl<$Res>
    implements $ForgotPasswordResendParamsCopyWith<$Res> {
  _$ForgotPasswordResendParamsCopyWithImpl(this._self, this._then);

  final ForgotPasswordResendParams _self;
  final $Res Function(ForgotPasswordResendParams) _then;

/// Create a copy of ForgotPassParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ForgotPasswordResendParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForgotPasswordVerifyResultParams implements ForgotPassParams {
  const ForgotPasswordVerifyResultParams({required this.resetToken});
  

 final  String resetToken;

/// Create a copy of ForgotPassParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordVerifyResultParamsCopyWith<ForgotPasswordVerifyResultParams> get copyWith => _$ForgotPasswordVerifyResultParamsCopyWithImpl<ForgotPasswordVerifyResultParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordVerifyResultParams&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}


@override
int get hashCode => Object.hash(runtimeType,resetToken);

@override
String toString() {
  return 'ForgotPassParams.verifyResult(resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordVerifyResultParamsCopyWith<$Res> implements $ForgotPassParamsCopyWith<$Res> {
  factory $ForgotPasswordVerifyResultParamsCopyWith(ForgotPasswordVerifyResultParams value, $Res Function(ForgotPasswordVerifyResultParams) _then) = _$ForgotPasswordVerifyResultParamsCopyWithImpl;
@useResult
$Res call({
 String resetToken
});




}
/// @nodoc
class _$ForgotPasswordVerifyResultParamsCopyWithImpl<$Res>
    implements $ForgotPasswordVerifyResultParamsCopyWith<$Res> {
  _$ForgotPasswordVerifyResultParamsCopyWithImpl(this._self, this._then);

  final ForgotPasswordVerifyResultParams _self;
  final $Res Function(ForgotPasswordVerifyResultParams) _then;

/// Create a copy of ForgotPassParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resetToken = null,}) {
  return _then(ForgotPasswordVerifyResultParams(
resetToken: null == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPassEntity {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPassEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPassEntity()';
}


}

/// @nodoc
class $ForgotPassEntityCopyWith<$Res>  {
$ForgotPassEntityCopyWith(ForgotPassEntity _, $Res Function(ForgotPassEntity) __);
}


/// Adds pattern-matching-related methods to [ForgotPassEntity].
extension ForgotPassEntityPatterns on ForgotPassEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ForgotPasswordEntity value)?  forgot,TResult Function( ForgotPasswordVerifyEntity value)?  verify,TResult Function( ForgotPasswordResetEntity value)?  reset,TResult Function( ForgotPasswordResendEntity value)?  resend,TResult Function( ForgotPasswordVerifyResultEntity value)?  verifyResult,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ForgotPasswordEntity() when forgot != null:
return forgot(_that);case ForgotPasswordVerifyEntity() when verify != null:
return verify(_that);case ForgotPasswordResetEntity() when reset != null:
return reset(_that);case ForgotPasswordResendEntity() when resend != null:
return resend(_that);case ForgotPasswordVerifyResultEntity() when verifyResult != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ForgotPasswordEntity value)  forgot,required TResult Function( ForgotPasswordVerifyEntity value)  verify,required TResult Function( ForgotPasswordResetEntity value)  reset,required TResult Function( ForgotPasswordResendEntity value)  resend,required TResult Function( ForgotPasswordVerifyResultEntity value)  verifyResult,}){
final _that = this;
switch (_that) {
case ForgotPasswordEntity():
return forgot(_that);case ForgotPasswordVerifyEntity():
return verify(_that);case ForgotPasswordResetEntity():
return reset(_that);case ForgotPasswordResendEntity():
return resend(_that);case ForgotPasswordVerifyResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ForgotPasswordEntity value)?  forgot,TResult? Function( ForgotPasswordVerifyEntity value)?  verify,TResult? Function( ForgotPasswordResetEntity value)?  reset,TResult? Function( ForgotPasswordResendEntity value)?  resend,TResult? Function( ForgotPasswordVerifyResultEntity value)?  verifyResult,}){
final _that = this;
switch (_that) {
case ForgotPasswordEntity() when forgot != null:
return forgot(_that);case ForgotPasswordVerifyEntity() when verify != null:
return verify(_that);case ForgotPasswordResetEntity() when reset != null:
return reset(_that);case ForgotPasswordResendEntity() when resend != null:
return resend(_that);case ForgotPasswordVerifyResultEntity() when verifyResult != null:
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
case ForgotPasswordEntity() when forgot != null:
return forgot(_that.email);case ForgotPasswordVerifyEntity() when verify != null:
return verify(_that.email,_that.otp);case ForgotPasswordResetEntity() when reset != null:
return reset(_that.resetToken,_that.password);case ForgotPasswordResendEntity() when resend != null:
return resend(_that.email);case ForgotPasswordVerifyResultEntity() when verifyResult != null:
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
case ForgotPasswordEntity():
return forgot(_that.email);case ForgotPasswordVerifyEntity():
return verify(_that.email,_that.otp);case ForgotPasswordResetEntity():
return reset(_that.resetToken,_that.password);case ForgotPasswordResendEntity():
return resend(_that.email);case ForgotPasswordVerifyResultEntity():
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
case ForgotPasswordEntity() when forgot != null:
return forgot(_that.email);case ForgotPasswordVerifyEntity() when verify != null:
return verify(_that.email,_that.otp);case ForgotPasswordResetEntity() when reset != null:
return reset(_that.resetToken,_that.password);case ForgotPasswordResendEntity() when resend != null:
return resend(_that.email);case ForgotPasswordVerifyResultEntity() when verifyResult != null:
return verifyResult(_that.resetToken);case _:
  return null;

}
}

}

/// @nodoc


class ForgotPasswordEntity implements ForgotPassEntity {
  const ForgotPasswordEntity({required this.email});
  

 final  String email;

/// Create a copy of ForgotPassEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordEntityCopyWith<ForgotPasswordEntity> get copyWith => _$ForgotPasswordEntityCopyWithImpl<ForgotPasswordEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordEntity&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPassEntity.forgot(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordEntityCopyWith<$Res> implements $ForgotPassEntityCopyWith<$Res> {
  factory $ForgotPasswordEntityCopyWith(ForgotPasswordEntity value, $Res Function(ForgotPasswordEntity) _then) = _$ForgotPasswordEntityCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordEntityCopyWithImpl<$Res>
    implements $ForgotPasswordEntityCopyWith<$Res> {
  _$ForgotPasswordEntityCopyWithImpl(this._self, this._then);

  final ForgotPasswordEntity _self;
  final $Res Function(ForgotPasswordEntity) _then;

/// Create a copy of ForgotPassEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ForgotPasswordEntity(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForgotPasswordVerifyEntity implements ForgotPassEntity {
  const ForgotPasswordVerifyEntity({required this.email, required this.otp});
  

 final  String email;
 final  String otp;

/// Create a copy of ForgotPassEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordVerifyEntityCopyWith<ForgotPasswordVerifyEntity> get copyWith => _$ForgotPasswordVerifyEntityCopyWithImpl<ForgotPasswordVerifyEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordVerifyEntity&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'ForgotPassEntity.verify(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordVerifyEntityCopyWith<$Res> implements $ForgotPassEntityCopyWith<$Res> {
  factory $ForgotPasswordVerifyEntityCopyWith(ForgotPasswordVerifyEntity value, $Res Function(ForgotPasswordVerifyEntity) _then) = _$ForgotPasswordVerifyEntityCopyWithImpl;
@useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class _$ForgotPasswordVerifyEntityCopyWithImpl<$Res>
    implements $ForgotPasswordVerifyEntityCopyWith<$Res> {
  _$ForgotPasswordVerifyEntityCopyWithImpl(this._self, this._then);

  final ForgotPasswordVerifyEntity _self;
  final $Res Function(ForgotPasswordVerifyEntity) _then;

/// Create a copy of ForgotPassEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(ForgotPasswordVerifyEntity(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForgotPasswordResetEntity implements ForgotPassEntity {
  const ForgotPasswordResetEntity({required this.resetToken, required this.password});
  

 final  String resetToken;
 final  String password;

/// Create a copy of ForgotPassEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordResetEntityCopyWith<ForgotPasswordResetEntity> get copyWith => _$ForgotPasswordResetEntityCopyWithImpl<ForgotPasswordResetEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordResetEntity&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,resetToken,password);

@override
String toString() {
  return 'ForgotPassEntity.reset(resetToken: $resetToken, password: $password)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordResetEntityCopyWith<$Res> implements $ForgotPassEntityCopyWith<$Res> {
  factory $ForgotPasswordResetEntityCopyWith(ForgotPasswordResetEntity value, $Res Function(ForgotPasswordResetEntity) _then) = _$ForgotPasswordResetEntityCopyWithImpl;
@useResult
$Res call({
 String resetToken, String password
});




}
/// @nodoc
class _$ForgotPasswordResetEntityCopyWithImpl<$Res>
    implements $ForgotPasswordResetEntityCopyWith<$Res> {
  _$ForgotPasswordResetEntityCopyWithImpl(this._self, this._then);

  final ForgotPasswordResetEntity _self;
  final $Res Function(ForgotPasswordResetEntity) _then;

/// Create a copy of ForgotPassEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resetToken = null,Object? password = null,}) {
  return _then(ForgotPasswordResetEntity(
resetToken: null == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForgotPasswordResendEntity implements ForgotPassEntity {
  const ForgotPasswordResendEntity({required this.email});
  

 final  String email;

/// Create a copy of ForgotPassEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordResendEntityCopyWith<ForgotPasswordResendEntity> get copyWith => _$ForgotPasswordResendEntityCopyWithImpl<ForgotPasswordResendEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordResendEntity&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPassEntity.resend(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordResendEntityCopyWith<$Res> implements $ForgotPassEntityCopyWith<$Res> {
  factory $ForgotPasswordResendEntityCopyWith(ForgotPasswordResendEntity value, $Res Function(ForgotPasswordResendEntity) _then) = _$ForgotPasswordResendEntityCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordResendEntityCopyWithImpl<$Res>
    implements $ForgotPasswordResendEntityCopyWith<$Res> {
  _$ForgotPasswordResendEntityCopyWithImpl(this._self, this._then);

  final ForgotPasswordResendEntity _self;
  final $Res Function(ForgotPasswordResendEntity) _then;

/// Create a copy of ForgotPassEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ForgotPasswordResendEntity(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForgotPasswordVerifyResultEntity implements ForgotPassEntity {
  const ForgotPasswordVerifyResultEntity({required this.resetToken});
  

 final  String resetToken;

/// Create a copy of ForgotPassEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordVerifyResultEntityCopyWith<ForgotPasswordVerifyResultEntity> get copyWith => _$ForgotPasswordVerifyResultEntityCopyWithImpl<ForgotPasswordVerifyResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordVerifyResultEntity&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}


@override
int get hashCode => Object.hash(runtimeType,resetToken);

@override
String toString() {
  return 'ForgotPassEntity.verifyResult(resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordVerifyResultEntityCopyWith<$Res> implements $ForgotPassEntityCopyWith<$Res> {
  factory $ForgotPasswordVerifyResultEntityCopyWith(ForgotPasswordVerifyResultEntity value, $Res Function(ForgotPasswordVerifyResultEntity) _then) = _$ForgotPasswordVerifyResultEntityCopyWithImpl;
@useResult
$Res call({
 String resetToken
});




}
/// @nodoc
class _$ForgotPasswordVerifyResultEntityCopyWithImpl<$Res>
    implements $ForgotPasswordVerifyResultEntityCopyWith<$Res> {
  _$ForgotPasswordVerifyResultEntityCopyWithImpl(this._self, this._then);

  final ForgotPasswordVerifyResultEntity _self;
  final $Res Function(ForgotPasswordVerifyResultEntity) _then;

/// Create a copy of ForgotPassEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resetToken = null,}) {
  return _then(ForgotPasswordVerifyResultEntity(
resetToken: null == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

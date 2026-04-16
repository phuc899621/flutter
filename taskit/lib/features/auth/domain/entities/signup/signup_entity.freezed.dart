// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupEntity {

 String get email;
/// Create a copy of SignupEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupEntityCopyWith<SignupEntity> get copyWith => _$SignupEntityCopyWithImpl<SignupEntity>(this as SignupEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupEntity&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignupEntity(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignupEntityCopyWith<$Res>  {
  factory $SignupEntityCopyWith(SignupEntity value, $Res Function(SignupEntity) _then) = _$SignupEntityCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignupEntityCopyWithImpl<$Res>
    implements $SignupEntityCopyWith<$Res> {
  _$SignupEntityCopyWithImpl(this._self, this._then);

  final SignupEntity _self;
  final $Res Function(SignupEntity) _then;

/// Create a copy of SignupEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupEntity].
extension SignupEntityPatterns on SignupEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignupRegisterEntity value)?  register,TResult Function( SignupVerifyEntity value)?  verify,TResult Function( SignupResendEntity value)?  resend,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignupRegisterEntity() when register != null:
return register(_that);case SignupVerifyEntity() when verify != null:
return verify(_that);case SignupResendEntity() when resend != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignupRegisterEntity value)  register,required TResult Function( SignupVerifyEntity value)  verify,required TResult Function( SignupResendEntity value)  resend,}){
final _that = this;
switch (_that) {
case SignupRegisterEntity():
return register(_that);case SignupVerifyEntity():
return verify(_that);case SignupResendEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignupRegisterEntity value)?  register,TResult? Function( SignupVerifyEntity value)?  verify,TResult? Function( SignupResendEntity value)?  resend,}){
final _that = this;
switch (_that) {
case SignupRegisterEntity() when register != null:
return register(_that);case SignupVerifyEntity() when verify != null:
return verify(_that);case SignupResendEntity() when resend != null:
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
case SignupRegisterEntity() when register != null:
return register(_that.email,_that.password);case SignupVerifyEntity() when verify != null:
return verify(_that.email,_that.otp);case SignupResendEntity() when resend != null:
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
case SignupRegisterEntity():
return register(_that.email,_that.password);case SignupVerifyEntity():
return verify(_that.email,_that.otp);case SignupResendEntity():
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
case SignupRegisterEntity() when register != null:
return register(_that.email,_that.password);case SignupVerifyEntity() when verify != null:
return verify(_that.email,_that.otp);case SignupResendEntity() when resend != null:
return resend(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class SignupRegisterEntity implements SignupEntity {
  const SignupRegisterEntity({required this.email, required this.password});
  

@override final  String email;
 final  String password;

/// Create a copy of SignupEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupRegisterEntityCopyWith<SignupRegisterEntity> get copyWith => _$SignupRegisterEntityCopyWithImpl<SignupRegisterEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupRegisterEntity&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SignupEntity.register(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignupRegisterEntityCopyWith<$Res> implements $SignupEntityCopyWith<$Res> {
  factory $SignupRegisterEntityCopyWith(SignupRegisterEntity value, $Res Function(SignupRegisterEntity) _then) = _$SignupRegisterEntityCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$SignupRegisterEntityCopyWithImpl<$Res>
    implements $SignupRegisterEntityCopyWith<$Res> {
  _$SignupRegisterEntityCopyWithImpl(this._self, this._then);

  final SignupRegisterEntity _self;
  final $Res Function(SignupRegisterEntity) _then;

/// Create a copy of SignupEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SignupRegisterEntity(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupVerifyEntity implements SignupEntity {
  const SignupVerifyEntity({required this.email, required this.otp});
  

@override final  String email;
 final  String otp;

/// Create a copy of SignupEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupVerifyEntityCopyWith<SignupVerifyEntity> get copyWith => _$SignupVerifyEntityCopyWithImpl<SignupVerifyEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupVerifyEntity&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'SignupEntity.verify(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $SignupVerifyEntityCopyWith<$Res> implements $SignupEntityCopyWith<$Res> {
  factory $SignupVerifyEntityCopyWith(SignupVerifyEntity value, $Res Function(SignupVerifyEntity) _then) = _$SignupVerifyEntityCopyWithImpl;
@override @useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class _$SignupVerifyEntityCopyWithImpl<$Res>
    implements $SignupVerifyEntityCopyWith<$Res> {
  _$SignupVerifyEntityCopyWithImpl(this._self, this._then);

  final SignupVerifyEntity _self;
  final $Res Function(SignupVerifyEntity) _then;

/// Create a copy of SignupEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(SignupVerifyEntity(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupResendEntity implements SignupEntity {
  const SignupResendEntity({required this.email});
  

@override final  String email;

/// Create a copy of SignupEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupResendEntityCopyWith<SignupResendEntity> get copyWith => _$SignupResendEntityCopyWithImpl<SignupResendEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupResendEntity&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignupEntity.resend(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignupResendEntityCopyWith<$Res> implements $SignupEntityCopyWith<$Res> {
  factory $SignupResendEntityCopyWith(SignupResendEntity value, $Res Function(SignupResendEntity) _then) = _$SignupResendEntityCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignupResendEntityCopyWithImpl<$Res>
    implements $SignupResendEntityCopyWith<$Res> {
  _$SignupResendEntityCopyWithImpl(this._self, this._then);

  final SignupResendEntity _self;
  final $Res Function(SignupResendEntity) _then;

/// Create a copy of SignupEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(SignupResendEntity(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

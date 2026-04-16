// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SignupRequest _$SignupRequestFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'register':
          return SignupRegisterRequest.fromJson(
            json
          );
                case 'verify':
          return SignupVerifyRequest.fromJson(
            json
          );
                case 'resend':
          return SignupResendRequest.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'SignupRequest',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$SignupRequest {

 String get email;
/// Create a copy of SignupRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupRequestCopyWith<SignupRequest> get copyWith => _$SignupRequestCopyWithImpl<SignupRequest>(this as SignupRequest, _$identity);

  /// Serializes this SignupRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupRequest&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignupRequest(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignupRequestCopyWith<$Res>  {
  factory $SignupRequestCopyWith(SignupRequest value, $Res Function(SignupRequest) _then) = _$SignupRequestCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignupRequestCopyWithImpl<$Res>
    implements $SignupRequestCopyWith<$Res> {
  _$SignupRequestCopyWithImpl(this._self, this._then);

  final SignupRequest _self;
  final $Res Function(SignupRequest) _then;

/// Create a copy of SignupRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupRequest].
extension SignupRequestPatterns on SignupRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignupRegisterRequest value)?  register,TResult Function( SignupVerifyRequest value)?  verify,TResult Function( SignupResendRequest value)?  resend,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignupRegisterRequest() when register != null:
return register(_that);case SignupVerifyRequest() when verify != null:
return verify(_that);case SignupResendRequest() when resend != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignupRegisterRequest value)  register,required TResult Function( SignupVerifyRequest value)  verify,required TResult Function( SignupResendRequest value)  resend,}){
final _that = this;
switch (_that) {
case SignupRegisterRequest():
return register(_that);case SignupVerifyRequest():
return verify(_that);case SignupResendRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignupRegisterRequest value)?  register,TResult? Function( SignupVerifyRequest value)?  verify,TResult? Function( SignupResendRequest value)?  resend,}){
final _that = this;
switch (_that) {
case SignupRegisterRequest() when register != null:
return register(_that);case SignupVerifyRequest() when verify != null:
return verify(_that);case SignupResendRequest() when resend != null:
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
case SignupRegisterRequest() when register != null:
return register(_that.email,_that.password);case SignupVerifyRequest() when verify != null:
return verify(_that.email,_that.otp);case SignupResendRequest() when resend != null:
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
case SignupRegisterRequest():
return register(_that.email,_that.password);case SignupVerifyRequest():
return verify(_that.email,_that.otp);case SignupResendRequest():
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
case SignupRegisterRequest() when register != null:
return register(_that.email,_that.password);case SignupVerifyRequest() when verify != null:
return verify(_that.email,_that.otp);case SignupResendRequest() when resend != null:
return resend(_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class SignupRegisterRequest implements SignupRequest {
  const SignupRegisterRequest({required this.email, required this.password, final  String? $type}): $type = $type ?? 'register';
  factory SignupRegisterRequest.fromJson(Map<String, dynamic> json) => _$SignupRegisterRequestFromJson(json);

@override final  String email;
 final  String password;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SignupRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupRegisterRequestCopyWith<SignupRegisterRequest> get copyWith => _$SignupRegisterRequestCopyWithImpl<SignupRegisterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignupRegisterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupRegisterRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SignupRequest.register(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignupRegisterRequestCopyWith<$Res> implements $SignupRequestCopyWith<$Res> {
  factory $SignupRegisterRequestCopyWith(SignupRegisterRequest value, $Res Function(SignupRegisterRequest) _then) = _$SignupRegisterRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$SignupRegisterRequestCopyWithImpl<$Res>
    implements $SignupRegisterRequestCopyWith<$Res> {
  _$SignupRegisterRequestCopyWithImpl(this._self, this._then);

  final SignupRegisterRequest _self;
  final $Res Function(SignupRegisterRequest) _then;

/// Create a copy of SignupRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SignupRegisterRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SignupVerifyRequest implements SignupRequest {
  const SignupVerifyRequest({required this.email, required this.otp, final  String? $type}): $type = $type ?? 'verify';
  factory SignupVerifyRequest.fromJson(Map<String, dynamic> json) => _$SignupVerifyRequestFromJson(json);

@override final  String email;
 final  String otp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SignupRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupVerifyRequestCopyWith<SignupVerifyRequest> get copyWith => _$SignupVerifyRequestCopyWithImpl<SignupVerifyRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignupVerifyRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupVerifyRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'SignupRequest.verify(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $SignupVerifyRequestCopyWith<$Res> implements $SignupRequestCopyWith<$Res> {
  factory $SignupVerifyRequestCopyWith(SignupVerifyRequest value, $Res Function(SignupVerifyRequest) _then) = _$SignupVerifyRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class _$SignupVerifyRequestCopyWithImpl<$Res>
    implements $SignupVerifyRequestCopyWith<$Res> {
  _$SignupVerifyRequestCopyWithImpl(this._self, this._then);

  final SignupVerifyRequest _self;
  final $Res Function(SignupVerifyRequest) _then;

/// Create a copy of SignupRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(SignupVerifyRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SignupResendRequest implements SignupRequest {
  const SignupResendRequest({required this.email, final  String? $type}): $type = $type ?? 'resend';
  factory SignupResendRequest.fromJson(Map<String, dynamic> json) => _$SignupResendRequestFromJson(json);

@override final  String email;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SignupRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupResendRequestCopyWith<SignupResendRequest> get copyWith => _$SignupResendRequestCopyWithImpl<SignupResendRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignupResendRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupResendRequest&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignupRequest.resend(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignupResendRequestCopyWith<$Res> implements $SignupRequestCopyWith<$Res> {
  factory $SignupResendRequestCopyWith(SignupResendRequest value, $Res Function(SignupResendRequest) _then) = _$SignupResendRequestCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignupResendRequestCopyWithImpl<$Res>
    implements $SignupResendRequestCopyWith<$Res> {
  _$SignupResendRequestCopyWithImpl(this._self, this._then);

  final SignupResendRequest _self;
  final $Res Function(SignupResendRequest) _then;

/// Create a copy of SignupRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(SignupResendRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

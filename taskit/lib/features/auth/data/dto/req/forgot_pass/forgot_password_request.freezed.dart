// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ForgotPassRequest _$ForgotPassRequestFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'forgot':
          return ForgotPasswordRequest.fromJson(
            json
          );
                case 'verify':
          return ForgotPasswordVerifyRequest.fromJson(
            json
          );
                case 'resend':
          return ForgotPasswordResendRequest.fromJson(
            json
          );
                case 'reset':
          return ForgotPasswordResetRequest.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ForgotPassRequest',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ForgotPassRequest {



  /// Serializes this ForgotPassRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPassRequest);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPassRequest()';
}


}

/// @nodoc
class $ForgotPassRequestCopyWith<$Res>  {
$ForgotPassRequestCopyWith(ForgotPassRequest _, $Res Function(ForgotPassRequest) __);
}


/// Adds pattern-matching-related methods to [ForgotPassRequest].
extension ForgotPassRequestPatterns on ForgotPassRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ForgotPasswordRequest value)?  forgot,TResult Function( ForgotPasswordVerifyRequest value)?  verify,TResult Function( ForgotPasswordResendRequest value)?  resend,TResult Function( ForgotPasswordResetRequest value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ForgotPasswordRequest() when forgot != null:
return forgot(_that);case ForgotPasswordVerifyRequest() when verify != null:
return verify(_that);case ForgotPasswordResendRequest() when resend != null:
return resend(_that);case ForgotPasswordResetRequest() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ForgotPasswordRequest value)  forgot,required TResult Function( ForgotPasswordVerifyRequest value)  verify,required TResult Function( ForgotPasswordResendRequest value)  resend,required TResult Function( ForgotPasswordResetRequest value)  reset,}){
final _that = this;
switch (_that) {
case ForgotPasswordRequest():
return forgot(_that);case ForgotPasswordVerifyRequest():
return verify(_that);case ForgotPasswordResendRequest():
return resend(_that);case ForgotPasswordResetRequest():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ForgotPasswordRequest value)?  forgot,TResult? Function( ForgotPasswordVerifyRequest value)?  verify,TResult? Function( ForgotPasswordResendRequest value)?  resend,TResult? Function( ForgotPasswordResetRequest value)?  reset,}){
final _that = this;
switch (_that) {
case ForgotPasswordRequest() when forgot != null:
return forgot(_that);case ForgotPasswordVerifyRequest() when verify != null:
return verify(_that);case ForgotPasswordResendRequest() when resend != null:
return resend(_that);case ForgotPasswordResetRequest() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  forgot,TResult Function( String email,  String otp)?  verify,TResult Function( String email)?  resend,TResult Function( String resetToken,  String password)?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ForgotPasswordRequest() when forgot != null:
return forgot(_that.email);case ForgotPasswordVerifyRequest() when verify != null:
return verify(_that.email,_that.otp);case ForgotPasswordResendRequest() when resend != null:
return resend(_that.email);case ForgotPasswordResetRequest() when reset != null:
return reset(_that.resetToken,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  forgot,required TResult Function( String email,  String otp)  verify,required TResult Function( String email)  resend,required TResult Function( String resetToken,  String password)  reset,}) {final _that = this;
switch (_that) {
case ForgotPasswordRequest():
return forgot(_that.email);case ForgotPasswordVerifyRequest():
return verify(_that.email,_that.otp);case ForgotPasswordResendRequest():
return resend(_that.email);case ForgotPasswordResetRequest():
return reset(_that.resetToken,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  forgot,TResult? Function( String email,  String otp)?  verify,TResult? Function( String email)?  resend,TResult? Function( String resetToken,  String password)?  reset,}) {final _that = this;
switch (_that) {
case ForgotPasswordRequest() when forgot != null:
return forgot(_that.email);case ForgotPasswordVerifyRequest() when verify != null:
return verify(_that.email,_that.otp);case ForgotPasswordResendRequest() when resend != null:
return resend(_that.email);case ForgotPasswordResetRequest() when reset != null:
return reset(_that.resetToken,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ForgotPasswordRequest implements ForgotPassRequest {
  const ForgotPasswordRequest({required this.email, final  String? $type}): $type = $type ?? 'forgot';
  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) => _$ForgotPasswordRequestFromJson(json);

 final  String email;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ForgotPassRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordRequestCopyWith<ForgotPasswordRequest> get copyWith => _$ForgotPasswordRequestCopyWithImpl<ForgotPasswordRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgotPasswordRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordRequest&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPassRequest.forgot(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordRequestCopyWith<$Res> implements $ForgotPassRequestCopyWith<$Res> {
  factory $ForgotPasswordRequestCopyWith(ForgotPasswordRequest value, $Res Function(ForgotPasswordRequest) _then) = _$ForgotPasswordRequestCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordRequestCopyWithImpl<$Res>
    implements $ForgotPasswordRequestCopyWith<$Res> {
  _$ForgotPasswordRequestCopyWithImpl(this._self, this._then);

  final ForgotPasswordRequest _self;
  final $Res Function(ForgotPasswordRequest) _then;

/// Create a copy of ForgotPassRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ForgotPasswordRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ForgotPasswordVerifyRequest implements ForgotPassRequest {
  const ForgotPasswordVerifyRequest({required this.email, required this.otp, final  String? $type}): $type = $type ?? 'verify';
  factory ForgotPasswordVerifyRequest.fromJson(Map<String, dynamic> json) => _$ForgotPasswordVerifyRequestFromJson(json);

 final  String email;
 final  String otp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ForgotPassRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordVerifyRequestCopyWith<ForgotPasswordVerifyRequest> get copyWith => _$ForgotPasswordVerifyRequestCopyWithImpl<ForgotPasswordVerifyRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgotPasswordVerifyRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordVerifyRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'ForgotPassRequest.verify(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordVerifyRequestCopyWith<$Res> implements $ForgotPassRequestCopyWith<$Res> {
  factory $ForgotPasswordVerifyRequestCopyWith(ForgotPasswordVerifyRequest value, $Res Function(ForgotPasswordVerifyRequest) _then) = _$ForgotPasswordVerifyRequestCopyWithImpl;
@useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class _$ForgotPasswordVerifyRequestCopyWithImpl<$Res>
    implements $ForgotPasswordVerifyRequestCopyWith<$Res> {
  _$ForgotPasswordVerifyRequestCopyWithImpl(this._self, this._then);

  final ForgotPasswordVerifyRequest _self;
  final $Res Function(ForgotPasswordVerifyRequest) _then;

/// Create a copy of ForgotPassRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(ForgotPasswordVerifyRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ForgotPasswordResendRequest implements ForgotPassRequest {
  const ForgotPasswordResendRequest({required this.email, final  String? $type}): $type = $type ?? 'resend';
  factory ForgotPasswordResendRequest.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResendRequestFromJson(json);

 final  String email;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ForgotPassRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordResendRequestCopyWith<ForgotPasswordResendRequest> get copyWith => _$ForgotPasswordResendRequestCopyWithImpl<ForgotPasswordResendRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgotPasswordResendRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordResendRequest&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPassRequest.resend(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordResendRequestCopyWith<$Res> implements $ForgotPassRequestCopyWith<$Res> {
  factory $ForgotPasswordResendRequestCopyWith(ForgotPasswordResendRequest value, $Res Function(ForgotPasswordResendRequest) _then) = _$ForgotPasswordResendRequestCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordResendRequestCopyWithImpl<$Res>
    implements $ForgotPasswordResendRequestCopyWith<$Res> {
  _$ForgotPasswordResendRequestCopyWithImpl(this._self, this._then);

  final ForgotPasswordResendRequest _self;
  final $Res Function(ForgotPasswordResendRequest) _then;

/// Create a copy of ForgotPassRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ForgotPasswordResendRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ForgotPasswordResetRequest implements ForgotPassRequest {
  const ForgotPasswordResetRequest({required this.resetToken, required this.password, final  String? $type}): $type = $type ?? 'reset';
  factory ForgotPasswordResetRequest.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResetRequestFromJson(json);

 final  String resetToken;
 final  String password;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ForgotPassRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordResetRequestCopyWith<ForgotPasswordResetRequest> get copyWith => _$ForgotPasswordResetRequestCopyWithImpl<ForgotPasswordResetRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgotPasswordResetRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordResetRequest&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resetToken,password);

@override
String toString() {
  return 'ForgotPassRequest.reset(resetToken: $resetToken, password: $password)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordResetRequestCopyWith<$Res> implements $ForgotPassRequestCopyWith<$Res> {
  factory $ForgotPasswordResetRequestCopyWith(ForgotPasswordResetRequest value, $Res Function(ForgotPasswordResetRequest) _then) = _$ForgotPasswordResetRequestCopyWithImpl;
@useResult
$Res call({
 String resetToken, String password
});




}
/// @nodoc
class _$ForgotPasswordResetRequestCopyWithImpl<$Res>
    implements $ForgotPasswordResetRequestCopyWith<$Res> {
  _$ForgotPasswordResetRequestCopyWithImpl(this._self, this._then);

  final ForgotPasswordResetRequest _self;
  final $Res Function(ForgotPasswordResetRequest) _then;

/// Create a copy of ForgotPassRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resetToken = null,Object? password = null,}) {
  return _then(ForgotPasswordResetRequest(
resetToken: null == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

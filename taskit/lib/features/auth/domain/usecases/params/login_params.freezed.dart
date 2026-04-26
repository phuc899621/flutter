// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginParams {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginParams);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginParams()';
}


}

/// @nodoc
class $LoginParamsCopyWith<$Res>  {
$LoginParamsCopyWith(LoginParams _, $Res Function(LoginParams) __);
}


/// Adds pattern-matching-related methods to [LoginParams].
extension LoginParamsPatterns on LoginParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CredentialsLoginParams value)?  credentials,TResult Function( GoogleLoginParams value)?  google,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CredentialsLoginParams() when credentials != null:
return credentials(_that);case GoogleLoginParams() when google != null:
return google(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CredentialsLoginParams value)  credentials,required TResult Function( GoogleLoginParams value)  google,}){
final _that = this;
switch (_that) {
case CredentialsLoginParams():
return credentials(_that);case GoogleLoginParams():
return google(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CredentialsLoginParams value)?  credentials,TResult? Function( GoogleLoginParams value)?  google,}){
final _that = this;
switch (_that) {
case CredentialsLoginParams() when credentials != null:
return credentials(_that);case GoogleLoginParams() when google != null:
return google(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  credentials,TResult Function( String token)?  google,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CredentialsLoginParams() when credentials != null:
return credentials(_that.email,_that.password);case GoogleLoginParams() when google != null:
return google(_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  credentials,required TResult Function( String token)  google,}) {final _that = this;
switch (_that) {
case CredentialsLoginParams():
return credentials(_that.email,_that.password);case GoogleLoginParams():
return google(_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  credentials,TResult? Function( String token)?  google,}) {final _that = this;
switch (_that) {
case CredentialsLoginParams() when credentials != null:
return credentials(_that.email,_that.password);case GoogleLoginParams() when google != null:
return google(_that.token);case _:
  return null;

}
}

}

/// @nodoc


class CredentialsLoginParams implements LoginParams {
  const CredentialsLoginParams({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of LoginParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CredentialsLoginParamsCopyWith<CredentialsLoginParams> get copyWith => _$CredentialsLoginParamsCopyWithImpl<CredentialsLoginParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CredentialsLoginParams&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginParams.credentials(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $CredentialsLoginParamsCopyWith<$Res> implements $LoginParamsCopyWith<$Res> {
  factory $CredentialsLoginParamsCopyWith(CredentialsLoginParams value, $Res Function(CredentialsLoginParams) _then) = _$CredentialsLoginParamsCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$CredentialsLoginParamsCopyWithImpl<$Res>
    implements $CredentialsLoginParamsCopyWith<$Res> {
  _$CredentialsLoginParamsCopyWithImpl(this._self, this._then);

  final CredentialsLoginParams _self;
  final $Res Function(CredentialsLoginParams) _then;

/// Create a copy of LoginParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(CredentialsLoginParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GoogleLoginParams implements LoginParams {
  const GoogleLoginParams({required this.token});
  

 final  String token;

/// Create a copy of LoginParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleLoginParamsCopyWith<GoogleLoginParams> get copyWith => _$GoogleLoginParamsCopyWithImpl<GoogleLoginParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleLoginParams&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'LoginParams.google(token: $token)';
}


}

/// @nodoc
abstract mixin class $GoogleLoginParamsCopyWith<$Res> implements $LoginParamsCopyWith<$Res> {
  factory $GoogleLoginParamsCopyWith(GoogleLoginParams value, $Res Function(GoogleLoginParams) _then) = _$GoogleLoginParamsCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$GoogleLoginParamsCopyWithImpl<$Res>
    implements $GoogleLoginParamsCopyWith<$Res> {
  _$GoogleLoginParamsCopyWithImpl(this._self, this._then);

  final GoogleLoginParams _self;
  final $Res Function(GoogleLoginParams) _then;

/// Create a copy of LoginParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(GoogleLoginParams(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

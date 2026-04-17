// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPassState {

 String? get apiError; ForgotPassStatus get status; String get email; String get otp; String get password; String? get resetToken;
/// Create a copy of ForgotPassState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPassStateCopyWith<ForgotPassState> get copyWith => _$ForgotPassStateCopyWithImpl<ForgotPassState>(this as ForgotPassState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPassState&&(identical(other.apiError, apiError) || other.apiError == apiError)&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.password, password) || other.password == password)&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}


@override
int get hashCode => Object.hash(runtimeType,apiError,status,email,otp,password,resetToken);

@override
String toString() {
  return 'ForgotPassState(apiError: $apiError, status: $status, email: $email, otp: $otp, password: $password, resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class $ForgotPassStateCopyWith<$Res>  {
  factory $ForgotPassStateCopyWith(ForgotPassState value, $Res Function(ForgotPassState) _then) = _$ForgotPassStateCopyWithImpl;
@useResult
$Res call({
 String? apiError, ForgotPassStatus status, String email, String otp, String password, String? resetToken
});




}
/// @nodoc
class _$ForgotPassStateCopyWithImpl<$Res>
    implements $ForgotPassStateCopyWith<$Res> {
  _$ForgotPassStateCopyWithImpl(this._self, this._then);

  final ForgotPassState _self;
  final $Res Function(ForgotPassState) _then;

/// Create a copy of ForgotPassState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apiError = freezed,Object? status = null,Object? email = null,Object? otp = null,Object? password = null,Object? resetToken = freezed,}) {
  return _then(_self.copyWith(
apiError: freezed == apiError ? _self.apiError : apiError // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ForgotPassStatus,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,resetToken: freezed == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPassState].
extension ForgotPassStatePatterns on ForgotPassState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPassState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPassState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPassState value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPassState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPassState value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPassState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? apiError,  ForgotPassStatus status,  String email,  String otp,  String password,  String? resetToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPassState() when $default != null:
return $default(_that.apiError,_that.status,_that.email,_that.otp,_that.password,_that.resetToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? apiError,  ForgotPassStatus status,  String email,  String otp,  String password,  String? resetToken)  $default,) {final _that = this;
switch (_that) {
case _ForgotPassState():
return $default(_that.apiError,_that.status,_that.email,_that.otp,_that.password,_that.resetToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? apiError,  ForgotPassStatus status,  String email,  String otp,  String password,  String? resetToken)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPassState() when $default != null:
return $default(_that.apiError,_that.status,_that.email,_that.otp,_that.password,_that.resetToken);case _:
  return null;

}
}

}

/// @nodoc


class _ForgotPassState implements ForgotPassState {
  const _ForgotPassState({this.apiError, this.status = ForgotPassStatus.initial, this.email = '', this.otp = '', this.password = '', this.resetToken});
  

@override final  String? apiError;
@override@JsonKey() final  ForgotPassStatus status;
@override@JsonKey() final  String email;
@override@JsonKey() final  String otp;
@override@JsonKey() final  String password;
@override final  String? resetToken;

/// Create a copy of ForgotPassState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPassStateCopyWith<_ForgotPassState> get copyWith => __$ForgotPassStateCopyWithImpl<_ForgotPassState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPassState&&(identical(other.apiError, apiError) || other.apiError == apiError)&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.password, password) || other.password == password)&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}


@override
int get hashCode => Object.hash(runtimeType,apiError,status,email,otp,password,resetToken);

@override
String toString() {
  return 'ForgotPassState(apiError: $apiError, status: $status, email: $email, otp: $otp, password: $password, resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class _$ForgotPassStateCopyWith<$Res> implements $ForgotPassStateCopyWith<$Res> {
  factory _$ForgotPassStateCopyWith(_ForgotPassState value, $Res Function(_ForgotPassState) _then) = __$ForgotPassStateCopyWithImpl;
@override @useResult
$Res call({
 String? apiError, ForgotPassStatus status, String email, String otp, String password, String? resetToken
});




}
/// @nodoc
class __$ForgotPassStateCopyWithImpl<$Res>
    implements _$ForgotPassStateCopyWith<$Res> {
  __$ForgotPassStateCopyWithImpl(this._self, this._then);

  final _ForgotPassState _self;
  final $Res Function(_ForgotPassState) _then;

/// Create a copy of ForgotPassState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apiError = freezed,Object? status = null,Object? email = null,Object? otp = null,Object? password = null,Object? resetToken = freezed,}) {
  return _then(_ForgotPassState(
apiError: freezed == apiError ? _self.apiError : apiError // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ForgotPassStatus,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,resetToken: freezed == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

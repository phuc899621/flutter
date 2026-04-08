// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPassRequest {

 String get email; String get password; String get passwordConfirm;
/// Create a copy of ResetPassRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPassRequestCopyWith<ResetPassRequest> get copyWith => _$ResetPassRequestCopyWithImpl<ResetPassRequest>(this as ResetPassRequest, _$identity);

  /// Serializes this ResetPassRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPassRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirm, passwordConfirm) || other.passwordConfirm == passwordConfirm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,passwordConfirm);

@override
String toString() {
  return 'ResetPassRequest(email: $email, password: $password, passwordConfirm: $passwordConfirm)';
}


}

/// @nodoc
abstract mixin class $ResetPassRequestCopyWith<$Res>  {
  factory $ResetPassRequestCopyWith(ResetPassRequest value, $Res Function(ResetPassRequest) _then) = _$ResetPassRequestCopyWithImpl;
@useResult
$Res call({
 String email, String password, String passwordConfirm
});




}
/// @nodoc
class _$ResetPassRequestCopyWithImpl<$Res>
    implements $ResetPassRequestCopyWith<$Res> {
  _$ResetPassRequestCopyWithImpl(this._self, this._then);

  final ResetPassRequest _self;
  final $Res Function(ResetPassRequest) _then;

/// Create a copy of ResetPassRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? passwordConfirm = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirm: null == passwordConfirm ? _self.passwordConfirm : passwordConfirm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPassRequest].
extension ResetPassRequestPatterns on ResetPassRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPassRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPassRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPassRequest value)  $default,){
final _that = this;
switch (_that) {
case _ResetPassRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPassRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPassRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String passwordConfirm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPassRequest() when $default != null:
return $default(_that.email,_that.password,_that.passwordConfirm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String passwordConfirm)  $default,) {final _that = this;
switch (_that) {
case _ResetPassRequest():
return $default(_that.email,_that.password,_that.passwordConfirm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String passwordConfirm)?  $default,) {final _that = this;
switch (_that) {
case _ResetPassRequest() when $default != null:
return $default(_that.email,_that.password,_that.passwordConfirm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResetPassRequest implements ResetPassRequest {
  const _ResetPassRequest({required this.email, required this.password, required this.passwordConfirm});
  factory _ResetPassRequest.fromJson(Map<String, dynamic> json) => _$ResetPassRequestFromJson(json);

@override final  String email;
@override final  String password;
@override final  String passwordConfirm;

/// Create a copy of ResetPassRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPassRequestCopyWith<_ResetPassRequest> get copyWith => __$ResetPassRequestCopyWithImpl<_ResetPassRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPassRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPassRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirm, passwordConfirm) || other.passwordConfirm == passwordConfirm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,passwordConfirm);

@override
String toString() {
  return 'ResetPassRequest(email: $email, password: $password, passwordConfirm: $passwordConfirm)';
}


}

/// @nodoc
abstract mixin class _$ResetPassRequestCopyWith<$Res> implements $ResetPassRequestCopyWith<$Res> {
  factory _$ResetPassRequestCopyWith(_ResetPassRequest value, $Res Function(_ResetPassRequest) _then) = __$ResetPassRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String passwordConfirm
});




}
/// @nodoc
class __$ResetPassRequestCopyWithImpl<$Res>
    implements _$ResetPassRequestCopyWith<$Res> {
  __$ResetPassRequestCopyWithImpl(this._self, this._then);

  final _ResetPassRequest _self;
  final $Res Function(_ResetPassRequest) _then;

/// Create a copy of ResetPassRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? passwordConfirm = null,}) {
  return _then(_ResetPassRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirm: null == passwordConfirm ? _self.passwordConfirm : passwordConfirm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

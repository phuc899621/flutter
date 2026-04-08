// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_verify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPassVerifyEntity {

 String get resetToken;
/// Create a copy of ForgotPassVerifyEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPassVerifyEntityCopyWith<ForgotPassVerifyEntity> get copyWith => _$ForgotPassVerifyEntityCopyWithImpl<ForgotPassVerifyEntity>(this as ForgotPassVerifyEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPassVerifyEntity&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}


@override
int get hashCode => Object.hash(runtimeType,resetToken);

@override
String toString() {
  return 'ForgotPassVerifyEntity(resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class $ForgotPassVerifyEntityCopyWith<$Res>  {
  factory $ForgotPassVerifyEntityCopyWith(ForgotPassVerifyEntity value, $Res Function(ForgotPassVerifyEntity) _then) = _$ForgotPassVerifyEntityCopyWithImpl;
@useResult
$Res call({
 String resetToken
});




}
/// @nodoc
class _$ForgotPassVerifyEntityCopyWithImpl<$Res>
    implements $ForgotPassVerifyEntityCopyWith<$Res> {
  _$ForgotPassVerifyEntityCopyWithImpl(this._self, this._then);

  final ForgotPassVerifyEntity _self;
  final $Res Function(ForgotPassVerifyEntity) _then;

/// Create a copy of ForgotPassVerifyEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resetToken = null,}) {
  return _then(_self.copyWith(
resetToken: null == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPassVerifyEntity].
extension ForgotPassVerifyEntityPatterns on ForgotPassVerifyEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPassVerifyEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPassVerifyEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPassVerifyEntity value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPassVerifyEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPassVerifyEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPassVerifyEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String resetToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPassVerifyEntity() when $default != null:
return $default(_that.resetToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String resetToken)  $default,) {final _that = this;
switch (_that) {
case _ForgotPassVerifyEntity():
return $default(_that.resetToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String resetToken)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPassVerifyEntity() when $default != null:
return $default(_that.resetToken);case _:
  return null;

}
}

}

/// @nodoc


class _ForgotPassVerifyEntity implements ForgotPassVerifyEntity {
  const _ForgotPassVerifyEntity({required this.resetToken});
  

@override final  String resetToken;

/// Create a copy of ForgotPassVerifyEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPassVerifyEntityCopyWith<_ForgotPassVerifyEntity> get copyWith => __$ForgotPassVerifyEntityCopyWithImpl<_ForgotPassVerifyEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPassVerifyEntity&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}


@override
int get hashCode => Object.hash(runtimeType,resetToken);

@override
String toString() {
  return 'ForgotPassVerifyEntity(resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class _$ForgotPassVerifyEntityCopyWith<$Res> implements $ForgotPassVerifyEntityCopyWith<$Res> {
  factory _$ForgotPassVerifyEntityCopyWith(_ForgotPassVerifyEntity value, $Res Function(_ForgotPassVerifyEntity) _then) = __$ForgotPassVerifyEntityCopyWithImpl;
@override @useResult
$Res call({
 String resetToken
});




}
/// @nodoc
class __$ForgotPassVerifyEntityCopyWithImpl<$Res>
    implements _$ForgotPassVerifyEntityCopyWith<$Res> {
  __$ForgotPassVerifyEntityCopyWithImpl(this._self, this._then);

  final _ForgotPassVerifyEntity _self;
  final $Res Function(_ForgotPassVerifyEntity) _then;

/// Create a copy of ForgotPassVerifyEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resetToken = null,}) {
  return _then(_ForgotPassVerifyEntity(
resetToken: null == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

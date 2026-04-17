// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'default_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DefaultResult {

 String get message;
/// Create a copy of DefaultResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefaultResultCopyWith<DefaultResult> get copyWith => _$DefaultResultCopyWithImpl<DefaultResult>(this as DefaultResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefaultResult&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DefaultResult(message: $message)';
}


}

/// @nodoc
abstract mixin class $DefaultResultCopyWith<$Res>  {
  factory $DefaultResultCopyWith(DefaultResult value, $Res Function(DefaultResult) _then) = _$DefaultResultCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DefaultResultCopyWithImpl<$Res>
    implements $DefaultResultCopyWith<$Res> {
  _$DefaultResultCopyWithImpl(this._self, this._then);

  final DefaultResult _self;
  final $Res Function(DefaultResult) _then;

/// Create a copy of DefaultResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DefaultResult].
extension DefaultResultPatterns on DefaultResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DefaultResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DefaultResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DefaultResult value)  $default,){
final _that = this;
switch (_that) {
case _DefaultResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DefaultResult value)?  $default,){
final _that = this;
switch (_that) {
case _DefaultResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DefaultResult() when $default != null:
return $default(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message)  $default,) {final _that = this;
switch (_that) {
case _DefaultResult():
return $default(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message)?  $default,) {final _that = this;
switch (_that) {
case _DefaultResult() when $default != null:
return $default(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _DefaultResult implements DefaultResult {
  const _DefaultResult({required this.message});
  

@override final  String message;

/// Create a copy of DefaultResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefaultResultCopyWith<_DefaultResult> get copyWith => __$DefaultResultCopyWithImpl<_DefaultResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DefaultResult&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DefaultResult(message: $message)';
}


}

/// @nodoc
abstract mixin class _$DefaultResultCopyWith<$Res> implements $DefaultResultCopyWith<$Res> {
  factory _$DefaultResultCopyWith(_DefaultResult value, $Res Function(_DefaultResult) _then) = __$DefaultResultCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$DefaultResultCopyWithImpl<$Res>
    implements _$DefaultResultCopyWith<$Res> {
  __$DefaultResultCopyWithImpl(this._self, this._then);

  final _DefaultResult _self;
  final $Res Function(_DefaultResult) _then;

/// Create a copy of DefaultResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_DefaultResult(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateReq<T> {

 T get updateData;
/// Create a copy of UpdateReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateReqCopyWith<T, UpdateReq<T>> get copyWith => _$UpdateReqCopyWithImpl<T, UpdateReq<T>>(this as UpdateReq<T>, _$identity);

  /// Serializes this UpdateReq to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateReq<T>&&const DeepCollectionEquality().equals(other.updateData, updateData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(updateData));

@override
String toString() {
  return 'UpdateReq<$T>(updateData: $updateData)';
}


}

/// @nodoc
abstract mixin class $UpdateReqCopyWith<T,$Res>  {
  factory $UpdateReqCopyWith(UpdateReq<T> value, $Res Function(UpdateReq<T>) _then) = _$UpdateReqCopyWithImpl;
@useResult
$Res call({
 T updateData
});




}
/// @nodoc
class _$UpdateReqCopyWithImpl<T,$Res>
    implements $UpdateReqCopyWith<T, $Res> {
  _$UpdateReqCopyWithImpl(this._self, this._then);

  final UpdateReq<T> _self;
  final $Res Function(UpdateReq<T>) _then;

/// Create a copy of UpdateReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updateData = freezed,}) {
  return _then(_self.copyWith(
updateData: freezed == updateData ? _self.updateData : updateData // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateReq].
extension UpdateReqPatterns<T> on UpdateReq<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateReq<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateReq<T> value)  $default,){
final _that = this;
switch (_that) {
case _UpdateReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateReq<T> value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T updateData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateReq() when $default != null:
return $default(_that.updateData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T updateData)  $default,) {final _that = this;
switch (_that) {
case _UpdateReq():
return $default(_that.updateData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T updateData)?  $default,) {final _that = this;
switch (_that) {
case _UpdateReq() when $default != null:
return $default(_that.updateData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _UpdateReq<T> implements UpdateReq<T> {
  const _UpdateReq({required this.updateData});
  factory _UpdateReq.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$UpdateReqFromJson(json,fromJsonT);

@override final  T updateData;

/// Create a copy of UpdateReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateReqCopyWith<T, _UpdateReq<T>> get copyWith => __$UpdateReqCopyWithImpl<T, _UpdateReq<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$UpdateReqToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateReq<T>&&const DeepCollectionEquality().equals(other.updateData, updateData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(updateData));

@override
String toString() {
  return 'UpdateReq<$T>(updateData: $updateData)';
}


}

/// @nodoc
abstract mixin class _$UpdateReqCopyWith<T,$Res> implements $UpdateReqCopyWith<T, $Res> {
  factory _$UpdateReqCopyWith(_UpdateReq<T> value, $Res Function(_UpdateReq<T>) _then) = __$UpdateReqCopyWithImpl;
@override @useResult
$Res call({
 T updateData
});




}
/// @nodoc
class __$UpdateReqCopyWithImpl<T,$Res>
    implements _$UpdateReqCopyWith<T, $Res> {
  __$UpdateReqCopyWithImpl(this._self, this._then);

  final _UpdateReq<T> _self;
  final $Res Function(_UpdateReq<T>) _then;

/// Create a copy of UpdateReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updateData = freezed,}) {
  return _then(_UpdateReq<T>(
updateData: freezed == updateData ? _self.updateData : updateData // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on

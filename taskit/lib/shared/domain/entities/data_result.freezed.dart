// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DataResult<T> {

 T get data; String get message;
/// Create a copy of DataResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataResultCopyWith<T, DataResult<T>> get copyWith => _$DataResultCopyWithImpl<T, DataResult<T>>(this as DataResult<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataResult<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'DataResult<$T>(data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $DataResultCopyWith<T,$Res>  {
  factory $DataResultCopyWith(DataResult<T> value, $Res Function(DataResult<T>) _then) = _$DataResultCopyWithImpl;
@useResult
$Res call({
 T data, String message
});




}
/// @nodoc
class _$DataResultCopyWithImpl<T,$Res>
    implements $DataResultCopyWith<T, $Res> {
  _$DataResultCopyWithImpl(this._self, this._then);

  final DataResult<T> _self;
  final $Res Function(DataResult<T>) _then;

/// Create a copy of DataResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DataResult].
extension DataResultPatterns<T> on DataResult<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataResult<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataResult<T> value)  $default,){
final _that = this;
switch (_that) {
case _DataResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataResult<T> value)?  $default,){
final _that = this;
switch (_that) {
case _DataResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataResult() when $default != null:
return $default(_that.data,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T data,  String message)  $default,) {final _that = this;
switch (_that) {
case _DataResult():
return $default(_that.data,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _DataResult() when $default != null:
return $default(_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _DataResult<T> implements DataResult<T> {
  const _DataResult({required this.data, required this.message});
  

@override final  T data;
@override final  String message;

/// Create a copy of DataResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataResultCopyWith<T, _DataResult<T>> get copyWith => __$DataResultCopyWithImpl<T, _DataResult<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataResult<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'DataResult<$T>(data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$DataResultCopyWith<T,$Res> implements $DataResultCopyWith<T, $Res> {
  factory _$DataResultCopyWith(_DataResult<T> value, $Res Function(_DataResult<T>) _then) = __$DataResultCopyWithImpl;
@override @useResult
$Res call({
 T data, String message
});




}
/// @nodoc
class __$DataResultCopyWithImpl<T,$Res>
    implements _$DataResultCopyWith<T, $Res> {
  __$DataResultCopyWithImpl(this._self, this._then);

  final _DataResult<T> _self;
  final $Res Function(_DataResult<T>) _then;

/// Create a copy of DataResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = null,}) {
  return _then(_DataResult<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

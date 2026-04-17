// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataResponse<T> {

 String get message; T get data;
/// Create a copy of DataResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataResponseCopyWith<T, DataResponse<T>> get copyWith => _$DataResponseCopyWithImpl<T, DataResponse<T>>(this as DataResponse<T>, _$identity);

  /// Serializes this DataResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataResponse<T>&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DataResponse<$T>(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $DataResponseCopyWith<T,$Res>  {
  factory $DataResponseCopyWith(DataResponse<T> value, $Res Function(DataResponse<T>) _then) = _$DataResponseCopyWithImpl;
@useResult
$Res call({
 String message, T data
});




}
/// @nodoc
class _$DataResponseCopyWithImpl<T,$Res>
    implements $DataResponseCopyWith<T, $Res> {
  _$DataResponseCopyWithImpl(this._self, this._then);

  final DataResponse<T> _self;
  final $Res Function(DataResponse<T>) _then;

/// Create a copy of DataResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// Adds pattern-matching-related methods to [DataResponse].
extension DataResponsePatterns<T> on DataResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _DataResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _DataResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  T data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataResponse() when $default != null:
return $default(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  T data)  $default,) {final _that = this;
switch (_that) {
case _DataResponse():
return $default(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  T data)?  $default,) {final _that = this;
switch (_that) {
case _DataResponse() when $default != null:
return $default(_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _DataResponse<T> implements DataResponse<T> {
  const _DataResponse({required this.message, required this.data});
  factory _DataResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$DataResponseFromJson(json,fromJsonT);

@override final  String message;
@override final  T data;

/// Create a copy of DataResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataResponseCopyWith<T, _DataResponse<T>> get copyWith => __$DataResponseCopyWithImpl<T, _DataResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$DataResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataResponse<T>&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DataResponse<$T>(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DataResponseCopyWith<T,$Res> implements $DataResponseCopyWith<T, $Res> {
  factory _$DataResponseCopyWith(_DataResponse<T> value, $Res Function(_DataResponse<T>) _then) = __$DataResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, T data
});




}
/// @nodoc
class __$DataResponseCopyWithImpl<T,$Res>
    implements _$DataResponseCopyWith<T, $Res> {
  __$DataResponseCopyWithImpl(this._self, this._then);

  final _DataResponse<T> _self;
  final $Res Function(_DataResponse<T>) _then;

/// Create a copy of DataResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(_DataResponse<T>(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on

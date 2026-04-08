// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_subtask_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddSubtaskData {

 int get localId;@JsonKey(name: '_id') String get id;
/// Create a copy of AddSubtaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddSubtaskDataCopyWith<AddSubtaskData> get copyWith => _$AddSubtaskDataCopyWithImpl<AddSubtaskData>(this as AddSubtaskData, _$identity);

  /// Serializes this AddSubtaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddSubtaskData&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id);

@override
String toString() {
  return 'AddSubtaskData(localId: $localId, id: $id)';
}


}

/// @nodoc
abstract mixin class $AddSubtaskDataCopyWith<$Res>  {
  factory $AddSubtaskDataCopyWith(AddSubtaskData value, $Res Function(AddSubtaskData) _then) = _$AddSubtaskDataCopyWithImpl;
@useResult
$Res call({
 int localId,@JsonKey(name: '_id') String id
});




}
/// @nodoc
class _$AddSubtaskDataCopyWithImpl<$Res>
    implements $AddSubtaskDataCopyWith<$Res> {
  _$AddSubtaskDataCopyWithImpl(this._self, this._then);

  final AddSubtaskData _self;
  final $Res Function(AddSubtaskData) _then;

/// Create a copy of AddSubtaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? id = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddSubtaskData].
extension AddSubtaskDataPatterns on AddSubtaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddSubtaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddSubtaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddSubtaskData value)  $default,){
final _that = this;
switch (_that) {
case _AddSubtaskData():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddSubtaskData value)?  $default,){
final _that = this;
switch (_that) {
case _AddSubtaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int localId, @JsonKey(name: '_id')  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddSubtaskData() when $default != null:
return $default(_that.localId,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int localId, @JsonKey(name: '_id')  String id)  $default,) {final _that = this;
switch (_that) {
case _AddSubtaskData():
return $default(_that.localId,_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int localId, @JsonKey(name: '_id')  String id)?  $default,) {final _that = this;
switch (_that) {
case _AddSubtaskData() when $default != null:
return $default(_that.localId,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddSubtaskData implements AddSubtaskData {
  const _AddSubtaskData({required this.localId, @JsonKey(name: '_id') required this.id});
  factory _AddSubtaskData.fromJson(Map<String, dynamic> json) => _$AddSubtaskDataFromJson(json);

@override final  int localId;
@override@JsonKey(name: '_id') final  String id;

/// Create a copy of AddSubtaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddSubtaskDataCopyWith<_AddSubtaskData> get copyWith => __$AddSubtaskDataCopyWithImpl<_AddSubtaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddSubtaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddSubtaskData&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id);

@override
String toString() {
  return 'AddSubtaskData(localId: $localId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$AddSubtaskDataCopyWith<$Res> implements $AddSubtaskDataCopyWith<$Res> {
  factory _$AddSubtaskDataCopyWith(_AddSubtaskData value, $Res Function(_AddSubtaskData) _then) = __$AddSubtaskDataCopyWithImpl;
@override @useResult
$Res call({
 int localId,@JsonKey(name: '_id') String id
});




}
/// @nodoc
class __$AddSubtaskDataCopyWithImpl<$Res>
    implements _$AddSubtaskDataCopyWith<$Res> {
  __$AddSubtaskDataCopyWithImpl(this._self, this._then);

  final _AddSubtaskData _self;
  final $Res Function(_AddSubtaskData) _then;

/// Create a copy of AddSubtaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? id = null,}) {
  return _then(_AddSubtaskData(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_sync_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesSyncData {

 String get id; int get localId; String get name;
/// Create a copy of CategoriesSyncData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesSyncDataCopyWith<CategoriesSyncData> get copyWith => _$CategoriesSyncDataCopyWithImpl<CategoriesSyncData>(this as CategoriesSyncData, _$identity);

  /// Serializes this CategoriesSyncData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesSyncData&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,name);

@override
String toString() {
  return 'CategoriesSyncData(id: $id, localId: $localId, name: $name)';
}


}

/// @nodoc
abstract mixin class $CategoriesSyncDataCopyWith<$Res>  {
  factory $CategoriesSyncDataCopyWith(CategoriesSyncData value, $Res Function(CategoriesSyncData) _then) = _$CategoriesSyncDataCopyWithImpl;
@useResult
$Res call({
 String id, int localId, String name
});




}
/// @nodoc
class _$CategoriesSyncDataCopyWithImpl<$Res>
    implements $CategoriesSyncDataCopyWith<$Res> {
  _$CategoriesSyncDataCopyWithImpl(this._self, this._then);

  final CategoriesSyncData _self;
  final $Res Function(CategoriesSyncData) _then;

/// Create a copy of CategoriesSyncData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? localId = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoriesSyncData].
extension CategoriesSyncDataPatterns on CategoriesSyncData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriesSyncData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriesSyncData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriesSyncData value)  $default,){
final _that = this;
switch (_that) {
case _CategoriesSyncData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriesSyncData value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriesSyncData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int localId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriesSyncData() when $default != null:
return $default(_that.id,_that.localId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int localId,  String name)  $default,) {final _that = this;
switch (_that) {
case _CategoriesSyncData():
return $default(_that.id,_that.localId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int localId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _CategoriesSyncData() when $default != null:
return $default(_that.id,_that.localId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoriesSyncData implements CategoriesSyncData {
  const _CategoriesSyncData({required this.id, required this.localId, required this.name});
  factory _CategoriesSyncData.fromJson(Map<String, dynamic> json) => _$CategoriesSyncDataFromJson(json);

@override final  String id;
@override final  int localId;
@override final  String name;

/// Create a copy of CategoriesSyncData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesSyncDataCopyWith<_CategoriesSyncData> get copyWith => __$CategoriesSyncDataCopyWithImpl<_CategoriesSyncData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriesSyncDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriesSyncData&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,name);

@override
String toString() {
  return 'CategoriesSyncData(id: $id, localId: $localId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CategoriesSyncDataCopyWith<$Res> implements $CategoriesSyncDataCopyWith<$Res> {
  factory _$CategoriesSyncDataCopyWith(_CategoriesSyncData value, $Res Function(_CategoriesSyncData) _then) = __$CategoriesSyncDataCopyWithImpl;
@override @useResult
$Res call({
 String id, int localId, String name
});




}
/// @nodoc
class __$CategoriesSyncDataCopyWithImpl<$Res>
    implements _$CategoriesSyncDataCopyWith<$Res> {
  __$CategoriesSyncDataCopyWithImpl(this._self, this._then);

  final _CategoriesSyncData _self;
  final $Res Function(_CategoriesSyncData) _then;

/// Create a copy of CategoriesSyncData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? localId = null,Object? name = null,}) {
  return _then(_CategoriesSyncData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

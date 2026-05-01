// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deleted_categories_sync_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeletedCategoriesSyncData {

 int get localId; String get id;
/// Create a copy of DeletedCategoriesSyncData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletedCategoriesSyncDataCopyWith<DeletedCategoriesSyncData> get copyWith => _$DeletedCategoriesSyncDataCopyWithImpl<DeletedCategoriesSyncData>(this as DeletedCategoriesSyncData, _$identity);

  /// Serializes this DeletedCategoriesSyncData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedCategoriesSyncData&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id);

@override
String toString() {
  return 'DeletedCategoriesSyncData(localId: $localId, id: $id)';
}


}

/// @nodoc
abstract mixin class $DeletedCategoriesSyncDataCopyWith<$Res>  {
  factory $DeletedCategoriesSyncDataCopyWith(DeletedCategoriesSyncData value, $Res Function(DeletedCategoriesSyncData) _then) = _$DeletedCategoriesSyncDataCopyWithImpl;
@useResult
$Res call({
 int localId, String id
});




}
/// @nodoc
class _$DeletedCategoriesSyncDataCopyWithImpl<$Res>
    implements $DeletedCategoriesSyncDataCopyWith<$Res> {
  _$DeletedCategoriesSyncDataCopyWithImpl(this._self, this._then);

  final DeletedCategoriesSyncData _self;
  final $Res Function(DeletedCategoriesSyncData) _then;

/// Create a copy of DeletedCategoriesSyncData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? id = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeletedCategoriesSyncData].
extension DeletedCategoriesSyncDataPatterns on DeletedCategoriesSyncData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletedCategoriesSyncData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletedCategoriesSyncData value)  $default,){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletedCategoriesSyncData value)?  $default,){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int localId,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeletedCategoriesSyncData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int localId,  String id)  $default,) {final _that = this;
switch (_that) {
case _DeletedCategoriesSyncData():
return $default(_that.localId,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int localId,  String id)?  $default,) {final _that = this;
switch (_that) {
case _DeletedCategoriesSyncData() when $default != null:
return $default(_that.localId,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletedCategoriesSyncData implements DeletedCategoriesSyncData {
  const _DeletedCategoriesSyncData({required this.localId, required this.id});
  factory _DeletedCategoriesSyncData.fromJson(Map<String, dynamic> json) => _$DeletedCategoriesSyncDataFromJson(json);

@override final  int localId;
@override final  String id;

/// Create a copy of DeletedCategoriesSyncData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCategoriesSyncDataCopyWith<_DeletedCategoriesSyncData> get copyWith => __$DeletedCategoriesSyncDataCopyWithImpl<_DeletedCategoriesSyncData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletedCategoriesSyncDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletedCategoriesSyncData&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id);

@override
String toString() {
  return 'DeletedCategoriesSyncData(localId: $localId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeletedCategoriesSyncDataCopyWith<$Res> implements $DeletedCategoriesSyncDataCopyWith<$Res> {
  factory _$DeletedCategoriesSyncDataCopyWith(_DeletedCategoriesSyncData value, $Res Function(_DeletedCategoriesSyncData) _then) = __$DeletedCategoriesSyncDataCopyWithImpl;
@override @useResult
$Res call({
 int localId, String id
});




}
/// @nodoc
class __$DeletedCategoriesSyncDataCopyWithImpl<$Res>
    implements _$DeletedCategoriesSyncDataCopyWith<$Res> {
  __$DeletedCategoriesSyncDataCopyWithImpl(this._self, this._then);

  final _DeletedCategoriesSyncData _self;
  final $Res Function(_DeletedCategoriesSyncData) _then;

/// Create a copy of DeletedCategoriesSyncData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? id = null,}) {
  return _then(_DeletedCategoriesSyncData(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

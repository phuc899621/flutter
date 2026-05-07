// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deleted_categories_sync_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeletedCategoriesSyncRes {

 int get localId; String get id;
/// Create a copy of DeletedCategoriesSyncRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletedCategoriesSyncResCopyWith<DeletedCategoriesSyncRes> get copyWith => _$DeletedCategoriesSyncResCopyWithImpl<DeletedCategoriesSyncRes>(this as DeletedCategoriesSyncRes, _$identity);

  /// Serializes this DeletedCategoriesSyncRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedCategoriesSyncRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id);

@override
String toString() {
  return 'DeletedCategoriesSyncRes(localId: $localId, id: $id)';
}


}

/// @nodoc
abstract mixin class $DeletedCategoriesSyncResCopyWith<$Res>  {
  factory $DeletedCategoriesSyncResCopyWith(DeletedCategoriesSyncRes value, $Res Function(DeletedCategoriesSyncRes) _then) = _$DeletedCategoriesSyncResCopyWithImpl;
@useResult
$Res call({
 int localId, String id
});




}
/// @nodoc
class _$DeletedCategoriesSyncResCopyWithImpl<$Res>
    implements $DeletedCategoriesSyncResCopyWith<$Res> {
  _$DeletedCategoriesSyncResCopyWithImpl(this._self, this._then);

  final DeletedCategoriesSyncRes _self;
  final $Res Function(DeletedCategoriesSyncRes) _then;

/// Create a copy of DeletedCategoriesSyncRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? id = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeletedCategoriesSyncRes].
extension DeletedCategoriesSyncResPatterns on DeletedCategoriesSyncRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletedCategoriesSyncRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletedCategoriesSyncRes value)  $default,){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletedCategoriesSyncRes value)?  $default,){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncRes() when $default != null:
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
case _DeletedCategoriesSyncRes() when $default != null:
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
case _DeletedCategoriesSyncRes():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int localId,  String id)?  $default,) {final _that = this;
switch (_that) {
case _DeletedCategoriesSyncRes() when $default != null:
return $default(_that.localId,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletedCategoriesSyncRes implements DeletedCategoriesSyncRes {
  const _DeletedCategoriesSyncRes({required this.localId, required this.id});
  factory _DeletedCategoriesSyncRes.fromJson(Map<String, dynamic> json) => _$DeletedCategoriesSyncResFromJson(json);

@override final  int localId;
@override final  String id;

/// Create a copy of DeletedCategoriesSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCategoriesSyncResCopyWith<_DeletedCategoriesSyncRes> get copyWith => __$DeletedCategoriesSyncResCopyWithImpl<_DeletedCategoriesSyncRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletedCategoriesSyncResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletedCategoriesSyncRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id);

@override
String toString() {
  return 'DeletedCategoriesSyncRes(localId: $localId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeletedCategoriesSyncResCopyWith<$Res> implements $DeletedCategoriesSyncResCopyWith<$Res> {
  factory _$DeletedCategoriesSyncResCopyWith(_DeletedCategoriesSyncRes value, $Res Function(_DeletedCategoriesSyncRes) _then) = __$DeletedCategoriesSyncResCopyWithImpl;
@override @useResult
$Res call({
 int localId, String id
});




}
/// @nodoc
class __$DeletedCategoriesSyncResCopyWithImpl<$Res>
    implements _$DeletedCategoriesSyncResCopyWith<$Res> {
  __$DeletedCategoriesSyncResCopyWithImpl(this._self, this._then);

  final _DeletedCategoriesSyncRes _self;
  final $Res Function(_DeletedCategoriesSyncRes) _then;

/// Create a copy of DeletedCategoriesSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? id = null,}) {
  return _then(_DeletedCategoriesSyncRes(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

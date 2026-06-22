// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deleted_tasks_sync_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeletedTasksSyncRes {

 int get localId; String get id;
/// Create a copy of DeletedTasksSyncRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletedTasksSyncResCopyWith<DeletedTasksSyncRes> get copyWith => _$DeletedTasksSyncResCopyWithImpl<DeletedTasksSyncRes>(this as DeletedTasksSyncRes, _$identity);

  /// Serializes this DeletedTasksSyncRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedTasksSyncRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id);

@override
String toString() {
  return 'DeletedTasksSyncRes(localId: $localId, id: $id)';
}


}

/// @nodoc
abstract mixin class $DeletedTasksSyncResCopyWith<$Res>  {
  factory $DeletedTasksSyncResCopyWith(DeletedTasksSyncRes value, $Res Function(DeletedTasksSyncRes) _then) = _$DeletedTasksSyncResCopyWithImpl;
@useResult
$Res call({
 int localId, String id
});




}
/// @nodoc
class _$DeletedTasksSyncResCopyWithImpl<$Res>
    implements $DeletedTasksSyncResCopyWith<$Res> {
  _$DeletedTasksSyncResCopyWithImpl(this._self, this._then);

  final DeletedTasksSyncRes _self;
  final $Res Function(DeletedTasksSyncRes) _then;

/// Create a copy of DeletedTasksSyncRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? id = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeletedTasksSyncRes].
extension DeletedTasksSyncResPatterns on DeletedTasksSyncRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletedTasksSyncRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletedTasksSyncRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletedTasksSyncRes value)  $default,){
final _that = this;
switch (_that) {
case _DeletedTasksSyncRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletedTasksSyncRes value)?  $default,){
final _that = this;
switch (_that) {
case _DeletedTasksSyncRes() when $default != null:
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
case _DeletedTasksSyncRes() when $default != null:
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
case _DeletedTasksSyncRes():
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
case _DeletedTasksSyncRes() when $default != null:
return $default(_that.localId,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletedTasksSyncRes implements DeletedTasksSyncRes {
  const _DeletedTasksSyncRes({required this.localId, required this.id});
  factory _DeletedTasksSyncRes.fromJson(Map<String, dynamic> json) => _$DeletedTasksSyncResFromJson(json);

@override final  int localId;
@override final  String id;

/// Create a copy of DeletedTasksSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedTasksSyncResCopyWith<_DeletedTasksSyncRes> get copyWith => __$DeletedTasksSyncResCopyWithImpl<_DeletedTasksSyncRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletedTasksSyncResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletedTasksSyncRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id);

@override
String toString() {
  return 'DeletedTasksSyncRes(localId: $localId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeletedTasksSyncResCopyWith<$Res> implements $DeletedTasksSyncResCopyWith<$Res> {
  factory _$DeletedTasksSyncResCopyWith(_DeletedTasksSyncRes value, $Res Function(_DeletedTasksSyncRes) _then) = __$DeletedTasksSyncResCopyWithImpl;
@override @useResult
$Res call({
 int localId, String id
});




}
/// @nodoc
class __$DeletedTasksSyncResCopyWithImpl<$Res>
    implements _$DeletedTasksSyncResCopyWith<$Res> {
  __$DeletedTasksSyncResCopyWithImpl(this._self, this._then);

  final _DeletedTasksSyncRes _self;
  final $Res Function(_DeletedTasksSyncRes) _then;

/// Create a copy of DeletedTasksSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? id = null,}) {
  return _then(_DeletedTasksSyncRes(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

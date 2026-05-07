// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_category_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCategoryRes {

 int get localId; String get id;
/// Create a copy of AddCategoryRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddCategoryResCopyWith<AddCategoryRes> get copyWith => _$AddCategoryResCopyWithImpl<AddCategoryRes>(this as AddCategoryRes, _$identity);

  /// Serializes this AddCategoryRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddCategoryRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id);

@override
String toString() {
  return 'AddCategoryRes(localId: $localId, id: $id)';
}


}

/// @nodoc
abstract mixin class $AddCategoryResCopyWith<$Res>  {
  factory $AddCategoryResCopyWith(AddCategoryRes value, $Res Function(AddCategoryRes) _then) = _$AddCategoryResCopyWithImpl;
@useResult
$Res call({
 int localId, String id
});




}
/// @nodoc
class _$AddCategoryResCopyWithImpl<$Res>
    implements $AddCategoryResCopyWith<$Res> {
  _$AddCategoryResCopyWithImpl(this._self, this._then);

  final AddCategoryRes _self;
  final $Res Function(AddCategoryRes) _then;

/// Create a copy of AddCategoryRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? id = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddCategoryRes].
extension AddCategoryResPatterns on AddCategoryRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddCategoryRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddCategoryRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddCategoryRes value)  $default,){
final _that = this;
switch (_that) {
case _AddCategoryRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddCategoryRes value)?  $default,){
final _that = this;
switch (_that) {
case _AddCategoryRes() when $default != null:
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
case _AddCategoryRes() when $default != null:
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
case _AddCategoryRes():
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
case _AddCategoryRes() when $default != null:
return $default(_that.localId,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddCategoryRes implements AddCategoryRes {
  const _AddCategoryRes({required this.localId, required this.id});
  factory _AddCategoryRes.fromJson(Map<String, dynamic> json) => _$AddCategoryResFromJson(json);

@override final  int localId;
@override final  String id;

/// Create a copy of AddCategoryRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCategoryResCopyWith<_AddCategoryRes> get copyWith => __$AddCategoryResCopyWithImpl<_AddCategoryRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddCategoryResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCategoryRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id);

@override
String toString() {
  return 'AddCategoryRes(localId: $localId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$AddCategoryResCopyWith<$Res> implements $AddCategoryResCopyWith<$Res> {
  factory _$AddCategoryResCopyWith(_AddCategoryRes value, $Res Function(_AddCategoryRes) _then) = __$AddCategoryResCopyWithImpl;
@override @useResult
$Res call({
 int localId, String id
});




}
/// @nodoc
class __$AddCategoryResCopyWithImpl<$Res>
    implements _$AddCategoryResCopyWith<$Res> {
  __$AddCategoryResCopyWithImpl(this._self, this._then);

  final _AddCategoryRes _self;
  final $Res Function(_AddCategoryRes) _then;

/// Create a copy of AddCategoryRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? id = null,}) {
  return _then(_AddCategoryRes(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

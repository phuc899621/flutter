// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryRes {

 String get id; String get name;@JsonKey(name: 'default') bool get isDefault; bool get deleted; DateTime get createdAt; DateTime get updatedAt; String get userId;
/// Create a copy of CategoryRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryResCopyWith<CategoryRes> get copyWith => _$CategoryResCopyWithImpl<CategoryRes>(this as CategoryRes, _$identity);

  /// Serializes this CategoryRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryRes&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,isDefault,deleted,createdAt,updatedAt,userId);

@override
String toString() {
  return 'CategoryRes(id: $id, name: $name, isDefault: $isDefault, deleted: $deleted, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $CategoryResCopyWith<$Res>  {
  factory $CategoryResCopyWith(CategoryRes value, $Res Function(CategoryRes) _then) = _$CategoryResCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'default') bool isDefault, bool deleted, DateTime createdAt, DateTime updatedAt, String userId
});




}
/// @nodoc
class _$CategoryResCopyWithImpl<$Res>
    implements $CategoryResCopyWith<$Res> {
  _$CategoryResCopyWithImpl(this._self, this._then);

  final CategoryRes _self;
  final $Res Function(CategoryRes) _then;

/// Create a copy of CategoryRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? isDefault = null,Object? deleted = null,Object? createdAt = null,Object? updatedAt = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryRes].
extension CategoryResPatterns on CategoryRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryRes value)  $default,){
final _that = this;
switch (_that) {
case _CategoryRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryRes value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'default')  bool isDefault,  bool deleted,  DateTime createdAt,  DateTime updatedAt,  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryRes() when $default != null:
return $default(_that.id,_that.name,_that.isDefault,_that.deleted,_that.createdAt,_that.updatedAt,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'default')  bool isDefault,  bool deleted,  DateTime createdAt,  DateTime updatedAt,  String userId)  $default,) {final _that = this;
switch (_that) {
case _CategoryRes():
return $default(_that.id,_that.name,_that.isDefault,_that.deleted,_that.createdAt,_that.updatedAt,_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'default')  bool isDefault,  bool deleted,  DateTime createdAt,  DateTime updatedAt,  String userId)?  $default,) {final _that = this;
switch (_that) {
case _CategoryRes() when $default != null:
return $default(_that.id,_that.name,_that.isDefault,_that.deleted,_that.createdAt,_that.updatedAt,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryRes implements CategoryRes {
  const _CategoryRes({required this.id, required this.name, @JsonKey(name: 'default') required this.isDefault, required this.deleted, required this.createdAt, required this.updatedAt, required this.userId});
  factory _CategoryRes.fromJson(Map<String, dynamic> json) => _$CategoryResFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'default') final  bool isDefault;
@override final  bool deleted;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String userId;

/// Create a copy of CategoryRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryResCopyWith<_CategoryRes> get copyWith => __$CategoryResCopyWithImpl<_CategoryRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryRes&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,isDefault,deleted,createdAt,updatedAt,userId);

@override
String toString() {
  return 'CategoryRes(id: $id, name: $name, isDefault: $isDefault, deleted: $deleted, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$CategoryResCopyWith<$Res> implements $CategoryResCopyWith<$Res> {
  factory _$CategoryResCopyWith(_CategoryRes value, $Res Function(_CategoryRes) _then) = __$CategoryResCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'default') bool isDefault, bool deleted, DateTime createdAt, DateTime updatedAt, String userId
});




}
/// @nodoc
class __$CategoryResCopyWithImpl<$Res>
    implements _$CategoryResCopyWith<$Res> {
  __$CategoryResCopyWithImpl(this._self, this._then);

  final _CategoryRes _self;
  final $Res Function(_CategoryRes) _then;

/// Create a copy of CategoryRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? isDefault = null,Object? deleted = null,Object? createdAt = null,Object? updatedAt = null,Object? userId = null,}) {
  return _then(_CategoryRes(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

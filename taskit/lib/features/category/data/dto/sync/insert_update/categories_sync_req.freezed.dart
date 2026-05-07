// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_sync_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesSyncReq {

 List<CategorySyncReqEntry> get categories;
/// Create a copy of CategoriesSyncReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesSyncReqCopyWith<CategoriesSyncReq> get copyWith => _$CategoriesSyncReqCopyWithImpl<CategoriesSyncReq>(this as CategoriesSyncReq, _$identity);

  /// Serializes this CategoriesSyncReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesSyncReq&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'CategoriesSyncReq(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $CategoriesSyncReqCopyWith<$Res>  {
  factory $CategoriesSyncReqCopyWith(CategoriesSyncReq value, $Res Function(CategoriesSyncReq) _then) = _$CategoriesSyncReqCopyWithImpl;
@useResult
$Res call({
 List<CategorySyncReqEntry> categories
});




}
/// @nodoc
class _$CategoriesSyncReqCopyWithImpl<$Res>
    implements $CategoriesSyncReqCopyWith<$Res> {
  _$CategoriesSyncReqCopyWithImpl(this._self, this._then);

  final CategoriesSyncReq _self;
  final $Res Function(CategoriesSyncReq) _then;

/// Create a copy of CategoriesSyncReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategorySyncReqEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoriesSyncReq].
extension CategoriesSyncReqPatterns on CategoriesSyncReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriesSyncReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriesSyncReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriesSyncReq value)  $default,){
final _that = this;
switch (_that) {
case _CategoriesSyncReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriesSyncReq value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriesSyncReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CategorySyncReqEntry> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriesSyncReq() when $default != null:
return $default(_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CategorySyncReqEntry> categories)  $default,) {final _that = this;
switch (_that) {
case _CategoriesSyncReq():
return $default(_that.categories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CategorySyncReqEntry> categories)?  $default,) {final _that = this;
switch (_that) {
case _CategoriesSyncReq() when $default != null:
return $default(_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoriesSyncReq implements CategoriesSyncReq {
  const _CategoriesSyncReq({required final  List<CategorySyncReqEntry> categories}): _categories = categories;
  factory _CategoriesSyncReq.fromJson(Map<String, dynamic> json) => _$CategoriesSyncReqFromJson(json);

 final  List<CategorySyncReqEntry> _categories;
@override List<CategorySyncReqEntry> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CategoriesSyncReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesSyncReqCopyWith<_CategoriesSyncReq> get copyWith => __$CategoriesSyncReqCopyWithImpl<_CategoriesSyncReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriesSyncReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriesSyncReq&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoriesSyncReq(categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$CategoriesSyncReqCopyWith<$Res> implements $CategoriesSyncReqCopyWith<$Res> {
  factory _$CategoriesSyncReqCopyWith(_CategoriesSyncReq value, $Res Function(_CategoriesSyncReq) _then) = __$CategoriesSyncReqCopyWithImpl;
@override @useResult
$Res call({
 List<CategorySyncReqEntry> categories
});




}
/// @nodoc
class __$CategoriesSyncReqCopyWithImpl<$Res>
    implements _$CategoriesSyncReqCopyWith<$Res> {
  __$CategoriesSyncReqCopyWithImpl(this._self, this._then);

  final _CategoriesSyncReq _self;
  final $Res Function(_CategoriesSyncReq) _then;

/// Create a copy of CategoriesSyncReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(_CategoriesSyncReq(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategorySyncReqEntry>,
  ));
}


}


/// @nodoc
mixin _$CategorySyncReqEntry {

 String? get id; int get localId; String get name; DateTime get updatedAt;
/// Create a copy of CategorySyncReqEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategorySyncReqEntryCopyWith<CategorySyncReqEntry> get copyWith => _$CategorySyncReqEntryCopyWithImpl<CategorySyncReqEntry>(this as CategorySyncReqEntry, _$identity);

  /// Serializes this CategorySyncReqEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategorySyncReqEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,name,updatedAt);

@override
String toString() {
  return 'CategorySyncReqEntry(id: $id, localId: $localId, name: $name, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CategorySyncReqEntryCopyWith<$Res>  {
  factory $CategorySyncReqEntryCopyWith(CategorySyncReqEntry value, $Res Function(CategorySyncReqEntry) _then) = _$CategorySyncReqEntryCopyWithImpl;
@useResult
$Res call({
 String? id, int localId, String name, DateTime updatedAt
});




}
/// @nodoc
class _$CategorySyncReqEntryCopyWithImpl<$Res>
    implements $CategorySyncReqEntryCopyWith<$Res> {
  _$CategorySyncReqEntryCopyWithImpl(this._self, this._then);

  final CategorySyncReqEntry _self;
  final $Res Function(CategorySyncReqEntry) _then;

/// Create a copy of CategorySyncReqEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? localId = null,Object? name = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CategorySyncReqEntry].
extension CategorySyncReqEntryPatterns on CategorySyncReqEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategorySyncReqEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategorySyncReqEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategorySyncReqEntry value)  $default,){
final _that = this;
switch (_that) {
case _CategorySyncReqEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategorySyncReqEntry value)?  $default,){
final _that = this;
switch (_that) {
case _CategorySyncReqEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int localId,  String name,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategorySyncReqEntry() when $default != null:
return $default(_that.id,_that.localId,_that.name,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int localId,  String name,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CategorySyncReqEntry():
return $default(_that.id,_that.localId,_that.name,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int localId,  String name,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CategorySyncReqEntry() when $default != null:
return $default(_that.id,_that.localId,_that.name,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategorySyncReqEntry implements CategorySyncReqEntry {
  const _CategorySyncReqEntry({this.id, required this.localId, required this.name, required this.updatedAt});
  factory _CategorySyncReqEntry.fromJson(Map<String, dynamic> json) => _$CategorySyncReqEntryFromJson(json);

@override final  String? id;
@override final  int localId;
@override final  String name;
@override final  DateTime updatedAt;

/// Create a copy of CategorySyncReqEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategorySyncReqEntryCopyWith<_CategorySyncReqEntry> get copyWith => __$CategorySyncReqEntryCopyWithImpl<_CategorySyncReqEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategorySyncReqEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategorySyncReqEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,name,updatedAt);

@override
String toString() {
  return 'CategorySyncReqEntry(id: $id, localId: $localId, name: $name, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CategorySyncReqEntryCopyWith<$Res> implements $CategorySyncReqEntryCopyWith<$Res> {
  factory _$CategorySyncReqEntryCopyWith(_CategorySyncReqEntry value, $Res Function(_CategorySyncReqEntry) _then) = __$CategorySyncReqEntryCopyWithImpl;
@override @useResult
$Res call({
 String? id, int localId, String name, DateTime updatedAt
});




}
/// @nodoc
class __$CategorySyncReqEntryCopyWithImpl<$Res>
    implements _$CategorySyncReqEntryCopyWith<$Res> {
  __$CategorySyncReqEntryCopyWithImpl(this._self, this._then);

  final _CategorySyncReqEntry _self;
  final $Res Function(_CategorySyncReqEntry) _then;

/// Create a copy of CategorySyncReqEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? localId = null,Object? name = null,Object? updatedAt = null,}) {
  return _then(_CategorySyncReqEntry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

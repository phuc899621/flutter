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

 List<CategoriesSyncReqData> get categories;
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
 List<CategoriesSyncReqData> categories
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
as List<CategoriesSyncReqData>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CategoriesSyncReqData> categories)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CategoriesSyncReqData> categories)  $default,) {final _that = this;
switch (_that) {
case _CategoriesSyncReq():
return $default(_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CategoriesSyncReqData> categories)?  $default,) {final _that = this;
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
  const _CategoriesSyncReq({required final  List<CategoriesSyncReqData> categories}): _categories = categories;
  factory _CategoriesSyncReq.fromJson(Map<String, dynamic> json) => _$CategoriesSyncReqFromJson(json);

 final  List<CategoriesSyncReqData> _categories;
@override List<CategoriesSyncReqData> get categories {
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
 List<CategoriesSyncReqData> categories
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
as List<CategoriesSyncReqData>,
  ));
}


}


/// @nodoc
mixin _$CategoriesSyncReqData {

 String? get id; int get localId; String get name;
/// Create a copy of CategoriesSyncReqData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesSyncReqDataCopyWith<CategoriesSyncReqData> get copyWith => _$CategoriesSyncReqDataCopyWithImpl<CategoriesSyncReqData>(this as CategoriesSyncReqData, _$identity);

  /// Serializes this CategoriesSyncReqData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesSyncReqData&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,name);

@override
String toString() {
  return 'CategoriesSyncReqData(id: $id, localId: $localId, name: $name)';
}


}

/// @nodoc
abstract mixin class $CategoriesSyncReqDataCopyWith<$Res>  {
  factory $CategoriesSyncReqDataCopyWith(CategoriesSyncReqData value, $Res Function(CategoriesSyncReqData) _then) = _$CategoriesSyncReqDataCopyWithImpl;
@useResult
$Res call({
 String? id, int localId, String name
});




}
/// @nodoc
class _$CategoriesSyncReqDataCopyWithImpl<$Res>
    implements $CategoriesSyncReqDataCopyWith<$Res> {
  _$CategoriesSyncReqDataCopyWithImpl(this._self, this._then);

  final CategoriesSyncReqData _self;
  final $Res Function(CategoriesSyncReqData) _then;

/// Create a copy of CategoriesSyncReqData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? localId = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoriesSyncReqData].
extension CategoriesSyncReqDataPatterns on CategoriesSyncReqData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriesSyncReqData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriesSyncReqData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriesSyncReqData value)  $default,){
final _that = this;
switch (_that) {
case _CategoriesSyncReqData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriesSyncReqData value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriesSyncReqData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int localId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriesSyncReqData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int localId,  String name)  $default,) {final _that = this;
switch (_that) {
case _CategoriesSyncReqData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int localId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _CategoriesSyncReqData() when $default != null:
return $default(_that.id,_that.localId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoriesSyncReqData implements CategoriesSyncReqData {
  const _CategoriesSyncReqData({this.id, required this.localId, required this.name});
  factory _CategoriesSyncReqData.fromJson(Map<String, dynamic> json) => _$CategoriesSyncReqDataFromJson(json);

@override final  String? id;
@override final  int localId;
@override final  String name;

/// Create a copy of CategoriesSyncReqData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesSyncReqDataCopyWith<_CategoriesSyncReqData> get copyWith => __$CategoriesSyncReqDataCopyWithImpl<_CategoriesSyncReqData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriesSyncReqDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriesSyncReqData&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,name);

@override
String toString() {
  return 'CategoriesSyncReqData(id: $id, localId: $localId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CategoriesSyncReqDataCopyWith<$Res> implements $CategoriesSyncReqDataCopyWith<$Res> {
  factory _$CategoriesSyncReqDataCopyWith(_CategoriesSyncReqData value, $Res Function(_CategoriesSyncReqData) _then) = __$CategoriesSyncReqDataCopyWithImpl;
@override @useResult
$Res call({
 String? id, int localId, String name
});




}
/// @nodoc
class __$CategoriesSyncReqDataCopyWithImpl<$Res>
    implements _$CategoriesSyncReqDataCopyWith<$Res> {
  __$CategoriesSyncReqDataCopyWithImpl(this._self, this._then);

  final _CategoriesSyncReqData _self;
  final $Res Function(_CategoriesSyncReqData) _then;

/// Create a copy of CategoriesSyncReqData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? localId = null,Object? name = null,}) {
  return _then(_CategoriesSyncReqData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deleted_categories_sync_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeletedCategoriesSyncReqData {

 String? get id; int get localId;
/// Create a copy of DeletedCategoriesSyncReqData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletedCategoriesSyncReqDataCopyWith<DeletedCategoriesSyncReqData> get copyWith => _$DeletedCategoriesSyncReqDataCopyWithImpl<DeletedCategoriesSyncReqData>(this as DeletedCategoriesSyncReqData, _$identity);

  /// Serializes this DeletedCategoriesSyncReqData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedCategoriesSyncReqData&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId);

@override
String toString() {
  return 'DeletedCategoriesSyncReqData(id: $id, localId: $localId)';
}


}

/// @nodoc
abstract mixin class $DeletedCategoriesSyncReqDataCopyWith<$Res>  {
  factory $DeletedCategoriesSyncReqDataCopyWith(DeletedCategoriesSyncReqData value, $Res Function(DeletedCategoriesSyncReqData) _then) = _$DeletedCategoriesSyncReqDataCopyWithImpl;
@useResult
$Res call({
 String? id, int localId
});




}
/// @nodoc
class _$DeletedCategoriesSyncReqDataCopyWithImpl<$Res>
    implements $DeletedCategoriesSyncReqDataCopyWith<$Res> {
  _$DeletedCategoriesSyncReqDataCopyWithImpl(this._self, this._then);

  final DeletedCategoriesSyncReqData _self;
  final $Res Function(DeletedCategoriesSyncReqData) _then;

/// Create a copy of DeletedCategoriesSyncReqData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? localId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeletedCategoriesSyncReqData].
extension DeletedCategoriesSyncReqDataPatterns on DeletedCategoriesSyncReqData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletedCategoriesSyncReqData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReqData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletedCategoriesSyncReqData value)  $default,){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReqData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletedCategoriesSyncReqData value)?  $default,){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReqData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int localId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReqData() when $default != null:
return $default(_that.id,_that.localId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int localId)  $default,) {final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReqData():
return $default(_that.id,_that.localId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int localId)?  $default,) {final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReqData() when $default != null:
return $default(_that.id,_that.localId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletedCategoriesSyncReqData implements DeletedCategoriesSyncReqData {
  const _DeletedCategoriesSyncReqData({this.id, required this.localId});
  factory _DeletedCategoriesSyncReqData.fromJson(Map<String, dynamic> json) => _$DeletedCategoriesSyncReqDataFromJson(json);

@override final  String? id;
@override final  int localId;

/// Create a copy of DeletedCategoriesSyncReqData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCategoriesSyncReqDataCopyWith<_DeletedCategoriesSyncReqData> get copyWith => __$DeletedCategoriesSyncReqDataCopyWithImpl<_DeletedCategoriesSyncReqData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletedCategoriesSyncReqDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletedCategoriesSyncReqData&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId);

@override
String toString() {
  return 'DeletedCategoriesSyncReqData(id: $id, localId: $localId)';
}


}

/// @nodoc
abstract mixin class _$DeletedCategoriesSyncReqDataCopyWith<$Res> implements $DeletedCategoriesSyncReqDataCopyWith<$Res> {
  factory _$DeletedCategoriesSyncReqDataCopyWith(_DeletedCategoriesSyncReqData value, $Res Function(_DeletedCategoriesSyncReqData) _then) = __$DeletedCategoriesSyncReqDataCopyWithImpl;
@override @useResult
$Res call({
 String? id, int localId
});




}
/// @nodoc
class __$DeletedCategoriesSyncReqDataCopyWithImpl<$Res>
    implements _$DeletedCategoriesSyncReqDataCopyWith<$Res> {
  __$DeletedCategoriesSyncReqDataCopyWithImpl(this._self, this._then);

  final _DeletedCategoriesSyncReqData _self;
  final $Res Function(_DeletedCategoriesSyncReqData) _then;

/// Create a copy of DeletedCategoriesSyncReqData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? localId = null,}) {
  return _then(_DeletedCategoriesSyncReqData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DeletedCategoriesSyncReq {

 List<DeletedCategoriesSyncReqData> get categories;
/// Create a copy of DeletedCategoriesSyncReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletedCategoriesSyncReqCopyWith<DeletedCategoriesSyncReq> get copyWith => _$DeletedCategoriesSyncReqCopyWithImpl<DeletedCategoriesSyncReq>(this as DeletedCategoriesSyncReq, _$identity);

  /// Serializes this DeletedCategoriesSyncReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedCategoriesSyncReq&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'DeletedCategoriesSyncReq(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $DeletedCategoriesSyncReqCopyWith<$Res>  {
  factory $DeletedCategoriesSyncReqCopyWith(DeletedCategoriesSyncReq value, $Res Function(DeletedCategoriesSyncReq) _then) = _$DeletedCategoriesSyncReqCopyWithImpl;
@useResult
$Res call({
 List<DeletedCategoriesSyncReqData> categories
});




}
/// @nodoc
class _$DeletedCategoriesSyncReqCopyWithImpl<$Res>
    implements $DeletedCategoriesSyncReqCopyWith<$Res> {
  _$DeletedCategoriesSyncReqCopyWithImpl(this._self, this._then);

  final DeletedCategoriesSyncReq _self;
  final $Res Function(DeletedCategoriesSyncReq) _then;

/// Create a copy of DeletedCategoriesSyncReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<DeletedCategoriesSyncReqData>,
  ));
}

}


/// Adds pattern-matching-related methods to [DeletedCategoriesSyncReq].
extension DeletedCategoriesSyncReqPatterns on DeletedCategoriesSyncReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletedCategoriesSyncReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletedCategoriesSyncReq value)  $default,){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletedCategoriesSyncReq value)?  $default,){
final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DeletedCategoriesSyncReqData> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReq() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DeletedCategoriesSyncReqData> categories)  $default,) {final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReq():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DeletedCategoriesSyncReqData> categories)?  $default,) {final _that = this;
switch (_that) {
case _DeletedCategoriesSyncReq() when $default != null:
return $default(_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletedCategoriesSyncReq implements DeletedCategoriesSyncReq {
  const _DeletedCategoriesSyncReq({required final  List<DeletedCategoriesSyncReqData> categories}): _categories = categories;
  factory _DeletedCategoriesSyncReq.fromJson(Map<String, dynamic> json) => _$DeletedCategoriesSyncReqFromJson(json);

 final  List<DeletedCategoriesSyncReqData> _categories;
@override List<DeletedCategoriesSyncReqData> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of DeletedCategoriesSyncReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCategoriesSyncReqCopyWith<_DeletedCategoriesSyncReq> get copyWith => __$DeletedCategoriesSyncReqCopyWithImpl<_DeletedCategoriesSyncReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletedCategoriesSyncReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletedCategoriesSyncReq&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'DeletedCategoriesSyncReq(categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$DeletedCategoriesSyncReqCopyWith<$Res> implements $DeletedCategoriesSyncReqCopyWith<$Res> {
  factory _$DeletedCategoriesSyncReqCopyWith(_DeletedCategoriesSyncReq value, $Res Function(_DeletedCategoriesSyncReq) _then) = __$DeletedCategoriesSyncReqCopyWithImpl;
@override @useResult
$Res call({
 List<DeletedCategoriesSyncReqData> categories
});




}
/// @nodoc
class __$DeletedCategoriesSyncReqCopyWithImpl<$Res>
    implements _$DeletedCategoriesSyncReqCopyWith<$Res> {
  __$DeletedCategoriesSyncReqCopyWithImpl(this._self, this._then);

  final _DeletedCategoriesSyncReq _self;
  final $Res Function(_DeletedCategoriesSyncReq) _then;

/// Create a copy of DeletedCategoriesSyncReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(_DeletedCategoriesSyncReq(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<DeletedCategoriesSyncReqData>,
  ));
}


}

// dart format on

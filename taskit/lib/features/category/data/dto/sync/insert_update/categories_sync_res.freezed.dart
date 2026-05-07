// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_sync_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesSyncRes {

 List<AcceptCategorySyncRes> get accept; List<RejectCategorySyncRes> get reject;
/// Create a copy of CategoriesSyncRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesSyncResCopyWith<CategoriesSyncRes> get copyWith => _$CategoriesSyncResCopyWithImpl<CategoriesSyncRes>(this as CategoriesSyncRes, _$identity);

  /// Serializes this CategoriesSyncRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesSyncRes&&const DeepCollectionEquality().equals(other.accept, accept)&&const DeepCollectionEquality().equals(other.reject, reject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(accept),const DeepCollectionEquality().hash(reject));

@override
String toString() {
  return 'CategoriesSyncRes(accept: $accept, reject: $reject)';
}


}

/// @nodoc
abstract mixin class $CategoriesSyncResCopyWith<$Res>  {
  factory $CategoriesSyncResCopyWith(CategoriesSyncRes value, $Res Function(CategoriesSyncRes) _then) = _$CategoriesSyncResCopyWithImpl;
@useResult
$Res call({
 List<AcceptCategorySyncRes> accept, List<RejectCategorySyncRes> reject
});




}
/// @nodoc
class _$CategoriesSyncResCopyWithImpl<$Res>
    implements $CategoriesSyncResCopyWith<$Res> {
  _$CategoriesSyncResCopyWithImpl(this._self, this._then);

  final CategoriesSyncRes _self;
  final $Res Function(CategoriesSyncRes) _then;

/// Create a copy of CategoriesSyncRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accept = null,Object? reject = null,}) {
  return _then(_self.copyWith(
accept: null == accept ? _self.accept : accept // ignore: cast_nullable_to_non_nullable
as List<AcceptCategorySyncRes>,reject: null == reject ? _self.reject : reject // ignore: cast_nullable_to_non_nullable
as List<RejectCategorySyncRes>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoriesSyncRes].
extension CategoriesSyncResPatterns on CategoriesSyncRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriesSyncRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriesSyncRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriesSyncRes value)  $default,){
final _that = this;
switch (_that) {
case _CategoriesSyncRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriesSyncRes value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriesSyncRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AcceptCategorySyncRes> accept,  List<RejectCategorySyncRes> reject)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriesSyncRes() when $default != null:
return $default(_that.accept,_that.reject);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AcceptCategorySyncRes> accept,  List<RejectCategorySyncRes> reject)  $default,) {final _that = this;
switch (_that) {
case _CategoriesSyncRes():
return $default(_that.accept,_that.reject);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AcceptCategorySyncRes> accept,  List<RejectCategorySyncRes> reject)?  $default,) {final _that = this;
switch (_that) {
case _CategoriesSyncRes() when $default != null:
return $default(_that.accept,_that.reject);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoriesSyncRes implements CategoriesSyncRes {
  const _CategoriesSyncRes({required final  List<AcceptCategorySyncRes> accept, required final  List<RejectCategorySyncRes> reject}): _accept = accept,_reject = reject;
  factory _CategoriesSyncRes.fromJson(Map<String, dynamic> json) => _$CategoriesSyncResFromJson(json);

 final  List<AcceptCategorySyncRes> _accept;
@override List<AcceptCategorySyncRes> get accept {
  if (_accept is EqualUnmodifiableListView) return _accept;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accept);
}

 final  List<RejectCategorySyncRes> _reject;
@override List<RejectCategorySyncRes> get reject {
  if (_reject is EqualUnmodifiableListView) return _reject;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reject);
}


/// Create a copy of CategoriesSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesSyncResCopyWith<_CategoriesSyncRes> get copyWith => __$CategoriesSyncResCopyWithImpl<_CategoriesSyncRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriesSyncResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriesSyncRes&&const DeepCollectionEquality().equals(other._accept, _accept)&&const DeepCollectionEquality().equals(other._reject, _reject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_accept),const DeepCollectionEquality().hash(_reject));

@override
String toString() {
  return 'CategoriesSyncRes(accept: $accept, reject: $reject)';
}


}

/// @nodoc
abstract mixin class _$CategoriesSyncResCopyWith<$Res> implements $CategoriesSyncResCopyWith<$Res> {
  factory _$CategoriesSyncResCopyWith(_CategoriesSyncRes value, $Res Function(_CategoriesSyncRes) _then) = __$CategoriesSyncResCopyWithImpl;
@override @useResult
$Res call({
 List<AcceptCategorySyncRes> accept, List<RejectCategorySyncRes> reject
});




}
/// @nodoc
class __$CategoriesSyncResCopyWithImpl<$Res>
    implements _$CategoriesSyncResCopyWith<$Res> {
  __$CategoriesSyncResCopyWithImpl(this._self, this._then);

  final _CategoriesSyncRes _self;
  final $Res Function(_CategoriesSyncRes) _then;

/// Create a copy of CategoriesSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accept = null,Object? reject = null,}) {
  return _then(_CategoriesSyncRes(
accept: null == accept ? _self._accept : accept // ignore: cast_nullable_to_non_nullable
as List<AcceptCategorySyncRes>,reject: null == reject ? _self._reject : reject // ignore: cast_nullable_to_non_nullable
as List<RejectCategorySyncRes>,
  ));
}


}


/// @nodoc
mixin _$AcceptCategorySyncRes {

 String get id; int get localId; String get name;
/// Create a copy of AcceptCategorySyncRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptCategorySyncResCopyWith<AcceptCategorySyncRes> get copyWith => _$AcceptCategorySyncResCopyWithImpl<AcceptCategorySyncRes>(this as AcceptCategorySyncRes, _$identity);

  /// Serializes this AcceptCategorySyncRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptCategorySyncRes&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,name);

@override
String toString() {
  return 'AcceptCategorySyncRes(id: $id, localId: $localId, name: $name)';
}


}

/// @nodoc
abstract mixin class $AcceptCategorySyncResCopyWith<$Res>  {
  factory $AcceptCategorySyncResCopyWith(AcceptCategorySyncRes value, $Res Function(AcceptCategorySyncRes) _then) = _$AcceptCategorySyncResCopyWithImpl;
@useResult
$Res call({
 String id, int localId, String name
});




}
/// @nodoc
class _$AcceptCategorySyncResCopyWithImpl<$Res>
    implements $AcceptCategorySyncResCopyWith<$Res> {
  _$AcceptCategorySyncResCopyWithImpl(this._self, this._then);

  final AcceptCategorySyncRes _self;
  final $Res Function(AcceptCategorySyncRes) _then;

/// Create a copy of AcceptCategorySyncRes
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


/// Adds pattern-matching-related methods to [AcceptCategorySyncRes].
extension AcceptCategorySyncResPatterns on AcceptCategorySyncRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AcceptCategorySyncRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AcceptCategorySyncRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AcceptCategorySyncRes value)  $default,){
final _that = this;
switch (_that) {
case _AcceptCategorySyncRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AcceptCategorySyncRes value)?  $default,){
final _that = this;
switch (_that) {
case _AcceptCategorySyncRes() when $default != null:
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
case _AcceptCategorySyncRes() when $default != null:
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
case _AcceptCategorySyncRes():
return $default(_that.id,_that.localId,_that.name);}
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
case _AcceptCategorySyncRes() when $default != null:
return $default(_that.id,_that.localId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AcceptCategorySyncRes implements AcceptCategorySyncRes {
  const _AcceptCategorySyncRes({required this.id, required this.localId, required this.name});
  factory _AcceptCategorySyncRes.fromJson(Map<String, dynamic> json) => _$AcceptCategorySyncResFromJson(json);

@override final  String id;
@override final  int localId;
@override final  String name;

/// Create a copy of AcceptCategorySyncRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptCategorySyncResCopyWith<_AcceptCategorySyncRes> get copyWith => __$AcceptCategorySyncResCopyWithImpl<_AcceptCategorySyncRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AcceptCategorySyncResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptCategorySyncRes&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,name);

@override
String toString() {
  return 'AcceptCategorySyncRes(id: $id, localId: $localId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$AcceptCategorySyncResCopyWith<$Res> implements $AcceptCategorySyncResCopyWith<$Res> {
  factory _$AcceptCategorySyncResCopyWith(_AcceptCategorySyncRes value, $Res Function(_AcceptCategorySyncRes) _then) = __$AcceptCategorySyncResCopyWithImpl;
@override @useResult
$Res call({
 String id, int localId, String name
});




}
/// @nodoc
class __$AcceptCategorySyncResCopyWithImpl<$Res>
    implements _$AcceptCategorySyncResCopyWith<$Res> {
  __$AcceptCategorySyncResCopyWithImpl(this._self, this._then);

  final _AcceptCategorySyncRes _self;
  final $Res Function(_AcceptCategorySyncRes) _then;

/// Create a copy of AcceptCategorySyncRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? localId = null,Object? name = null,}) {
  return _then(_AcceptCategorySyncRes(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RejectCategorySyncRes {

 String? get id; int get localId; CategoryServerRes? get serverData;
/// Create a copy of RejectCategorySyncRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RejectCategorySyncResCopyWith<RejectCategorySyncRes> get copyWith => _$RejectCategorySyncResCopyWithImpl<RejectCategorySyncRes>(this as RejectCategorySyncRes, _$identity);

  /// Serializes this RejectCategorySyncRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectCategorySyncRes&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverData, serverData) || other.serverData == serverData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,serverData);

@override
String toString() {
  return 'RejectCategorySyncRes(id: $id, localId: $localId, serverData: $serverData)';
}


}

/// @nodoc
abstract mixin class $RejectCategorySyncResCopyWith<$Res>  {
  factory $RejectCategorySyncResCopyWith(RejectCategorySyncRes value, $Res Function(RejectCategorySyncRes) _then) = _$RejectCategorySyncResCopyWithImpl;
@useResult
$Res call({
 String? id, int localId, CategoryServerRes? serverData
});


$CategoryServerResCopyWith<$Res>? get serverData;

}
/// @nodoc
class _$RejectCategorySyncResCopyWithImpl<$Res>
    implements $RejectCategorySyncResCopyWith<$Res> {
  _$RejectCategorySyncResCopyWithImpl(this._self, this._then);

  final RejectCategorySyncRes _self;
  final $Res Function(RejectCategorySyncRes) _then;

/// Create a copy of RejectCategorySyncRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? localId = null,Object? serverData = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,serverData: freezed == serverData ? _self.serverData : serverData // ignore: cast_nullable_to_non_nullable
as CategoryServerRes?,
  ));
}
/// Create a copy of RejectCategorySyncRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryServerResCopyWith<$Res>? get serverData {
    if (_self.serverData == null) {
    return null;
  }

  return $CategoryServerResCopyWith<$Res>(_self.serverData!, (value) {
    return _then(_self.copyWith(serverData: value));
  });
}
}


/// Adds pattern-matching-related methods to [RejectCategorySyncRes].
extension RejectCategorySyncResPatterns on RejectCategorySyncRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RejectCategorySyncRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RejectCategorySyncRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RejectCategorySyncRes value)  $default,){
final _that = this;
switch (_that) {
case _RejectCategorySyncRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RejectCategorySyncRes value)?  $default,){
final _that = this;
switch (_that) {
case _RejectCategorySyncRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int localId,  CategoryServerRes? serverData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RejectCategorySyncRes() when $default != null:
return $default(_that.id,_that.localId,_that.serverData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int localId,  CategoryServerRes? serverData)  $default,) {final _that = this;
switch (_that) {
case _RejectCategorySyncRes():
return $default(_that.id,_that.localId,_that.serverData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int localId,  CategoryServerRes? serverData)?  $default,) {final _that = this;
switch (_that) {
case _RejectCategorySyncRes() when $default != null:
return $default(_that.id,_that.localId,_that.serverData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RejectCategorySyncRes implements RejectCategorySyncRes {
  const _RejectCategorySyncRes({this.id, required this.localId, this.serverData});
  factory _RejectCategorySyncRes.fromJson(Map<String, dynamic> json) => _$RejectCategorySyncResFromJson(json);

@override final  String? id;
@override final  int localId;
@override final  CategoryServerRes? serverData;

/// Create a copy of RejectCategorySyncRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RejectCategorySyncResCopyWith<_RejectCategorySyncRes> get copyWith => __$RejectCategorySyncResCopyWithImpl<_RejectCategorySyncRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RejectCategorySyncResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RejectCategorySyncRes&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverData, serverData) || other.serverData == serverData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,serverData);

@override
String toString() {
  return 'RejectCategorySyncRes(id: $id, localId: $localId, serverData: $serverData)';
}


}

/// @nodoc
abstract mixin class _$RejectCategorySyncResCopyWith<$Res> implements $RejectCategorySyncResCopyWith<$Res> {
  factory _$RejectCategorySyncResCopyWith(_RejectCategorySyncRes value, $Res Function(_RejectCategorySyncRes) _then) = __$RejectCategorySyncResCopyWithImpl;
@override @useResult
$Res call({
 String? id, int localId, CategoryServerRes? serverData
});


@override $CategoryServerResCopyWith<$Res>? get serverData;

}
/// @nodoc
class __$RejectCategorySyncResCopyWithImpl<$Res>
    implements _$RejectCategorySyncResCopyWith<$Res> {
  __$RejectCategorySyncResCopyWithImpl(this._self, this._then);

  final _RejectCategorySyncRes _self;
  final $Res Function(_RejectCategorySyncRes) _then;

/// Create a copy of RejectCategorySyncRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? localId = null,Object? serverData = freezed,}) {
  return _then(_RejectCategorySyncRes(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,serverData: freezed == serverData ? _self.serverData : serverData // ignore: cast_nullable_to_non_nullable
as CategoryServerRes?,
  ));
}

/// Create a copy of RejectCategorySyncRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryServerResCopyWith<$Res>? get serverData {
    if (_self.serverData == null) {
    return null;
  }

  return $CategoryServerResCopyWith<$Res>(_self.serverData!, (value) {
    return _then(_self.copyWith(serverData: value));
  });
}
}


/// @nodoc
mixin _$CategoryServerRes {

 String get name; DateTime get updatedAt;
/// Create a copy of CategoryServerRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryServerResCopyWith<CategoryServerRes> get copyWith => _$CategoryServerResCopyWithImpl<CategoryServerRes>(this as CategoryServerRes, _$identity);

  /// Serializes this CategoryServerRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryServerRes&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,updatedAt);

@override
String toString() {
  return 'CategoryServerRes(name: $name, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CategoryServerResCopyWith<$Res>  {
  factory $CategoryServerResCopyWith(CategoryServerRes value, $Res Function(CategoryServerRes) _then) = _$CategoryServerResCopyWithImpl;
@useResult
$Res call({
 String name, DateTime updatedAt
});




}
/// @nodoc
class _$CategoryServerResCopyWithImpl<$Res>
    implements $CategoryServerResCopyWith<$Res> {
  _$CategoryServerResCopyWithImpl(this._self, this._then);

  final CategoryServerRes _self;
  final $Res Function(CategoryServerRes) _then;

/// Create a copy of CategoryServerRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryServerRes].
extension CategoryServerResPatterns on CategoryServerRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryServerRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryServerRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryServerRes value)  $default,){
final _that = this;
switch (_that) {
case _CategoryServerRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryServerRes value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryServerRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryServerRes() when $default != null:
return $default(_that.name,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CategoryServerRes():
return $default(_that.name,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CategoryServerRes() when $default != null:
return $default(_that.name,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryServerRes implements CategoryServerRes {
  const _CategoryServerRes({required this.name, required this.updatedAt});
  factory _CategoryServerRes.fromJson(Map<String, dynamic> json) => _$CategoryServerResFromJson(json);

@override final  String name;
@override final  DateTime updatedAt;

/// Create a copy of CategoryServerRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryServerResCopyWith<_CategoryServerRes> get copyWith => __$CategoryServerResCopyWithImpl<_CategoryServerRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryServerResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryServerRes&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,updatedAt);

@override
String toString() {
  return 'CategoryServerRes(name: $name, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CategoryServerResCopyWith<$Res> implements $CategoryServerResCopyWith<$Res> {
  factory _$CategoryServerResCopyWith(_CategoryServerRes value, $Res Function(_CategoryServerRes) _then) = __$CategoryServerResCopyWithImpl;
@override @useResult
$Res call({
 String name, DateTime updatedAt
});




}
/// @nodoc
class __$CategoryServerResCopyWithImpl<$Res>
    implements _$CategoryServerResCopyWith<$Res> {
  __$CategoryServerResCopyWithImpl(this._self, this._then);

  final _CategoryServerRes _self;
  final $Res Function(_CategoryServerRes) _then;

/// Create a copy of CategoryServerRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? updatedAt = null,}) {
  return _then(_CategoryServerRes(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

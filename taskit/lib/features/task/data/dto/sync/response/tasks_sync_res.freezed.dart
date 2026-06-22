// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_sync_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TasksSyncRes {

 List<AcceptTaskSyncRes> get accept; List<RejectTaskSyncRes> get reject;
/// Create a copy of TasksSyncRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksSyncResCopyWith<TasksSyncRes> get copyWith => _$TasksSyncResCopyWithImpl<TasksSyncRes>(this as TasksSyncRes, _$identity);

  /// Serializes this TasksSyncRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksSyncRes&&const DeepCollectionEquality().equals(other.accept, accept)&&const DeepCollectionEquality().equals(other.reject, reject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(accept),const DeepCollectionEquality().hash(reject));

@override
String toString() {
  return 'TasksSyncRes(accept: $accept, reject: $reject)';
}


}

/// @nodoc
abstract mixin class $TasksSyncResCopyWith<$Res>  {
  factory $TasksSyncResCopyWith(TasksSyncRes value, $Res Function(TasksSyncRes) _then) = _$TasksSyncResCopyWithImpl;
@useResult
$Res call({
 List<AcceptTaskSyncRes> accept, List<RejectTaskSyncRes> reject
});




}
/// @nodoc
class _$TasksSyncResCopyWithImpl<$Res>
    implements $TasksSyncResCopyWith<$Res> {
  _$TasksSyncResCopyWithImpl(this._self, this._then);

  final TasksSyncRes _self;
  final $Res Function(TasksSyncRes) _then;

/// Create a copy of TasksSyncRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accept = null,Object? reject = null,}) {
  return _then(_self.copyWith(
accept: null == accept ? _self.accept : accept // ignore: cast_nullable_to_non_nullable
as List<AcceptTaskSyncRes>,reject: null == reject ? _self.reject : reject // ignore: cast_nullable_to_non_nullable
as List<RejectTaskSyncRes>,
  ));
}

}


/// Adds pattern-matching-related methods to [TasksSyncRes].
extension TasksSyncResPatterns on TasksSyncRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TasksSyncRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasksSyncRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TasksSyncRes value)  $default,){
final _that = this;
switch (_that) {
case _TasksSyncRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TasksSyncRes value)?  $default,){
final _that = this;
switch (_that) {
case _TasksSyncRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AcceptTaskSyncRes> accept,  List<RejectTaskSyncRes> reject)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasksSyncRes() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AcceptTaskSyncRes> accept,  List<RejectTaskSyncRes> reject)  $default,) {final _that = this;
switch (_that) {
case _TasksSyncRes():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AcceptTaskSyncRes> accept,  List<RejectTaskSyncRes> reject)?  $default,) {final _that = this;
switch (_that) {
case _TasksSyncRes() when $default != null:
return $default(_that.accept,_that.reject);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TasksSyncRes implements TasksSyncRes {
  const _TasksSyncRes({required final  List<AcceptTaskSyncRes> accept, required final  List<RejectTaskSyncRes> reject}): _accept = accept,_reject = reject;
  factory _TasksSyncRes.fromJson(Map<String, dynamic> json) => _$TasksSyncResFromJson(json);

 final  List<AcceptTaskSyncRes> _accept;
@override List<AcceptTaskSyncRes> get accept {
  if (_accept is EqualUnmodifiableListView) return _accept;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accept);
}

 final  List<RejectTaskSyncRes> _reject;
@override List<RejectTaskSyncRes> get reject {
  if (_reject is EqualUnmodifiableListView) return _reject;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reject);
}


/// Create a copy of TasksSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasksSyncResCopyWith<_TasksSyncRes> get copyWith => __$TasksSyncResCopyWithImpl<_TasksSyncRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TasksSyncResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksSyncRes&&const DeepCollectionEquality().equals(other._accept, _accept)&&const DeepCollectionEquality().equals(other._reject, _reject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_accept),const DeepCollectionEquality().hash(_reject));

@override
String toString() {
  return 'TasksSyncRes(accept: $accept, reject: $reject)';
}


}

/// @nodoc
abstract mixin class _$TasksSyncResCopyWith<$Res> implements $TasksSyncResCopyWith<$Res> {
  factory _$TasksSyncResCopyWith(_TasksSyncRes value, $Res Function(_TasksSyncRes) _then) = __$TasksSyncResCopyWithImpl;
@override @useResult
$Res call({
 List<AcceptTaskSyncRes> accept, List<RejectTaskSyncRes> reject
});




}
/// @nodoc
class __$TasksSyncResCopyWithImpl<$Res>
    implements _$TasksSyncResCopyWith<$Res> {
  __$TasksSyncResCopyWithImpl(this._self, this._then);

  final _TasksSyncRes _self;
  final $Res Function(_TasksSyncRes) _then;

/// Create a copy of TasksSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accept = null,Object? reject = null,}) {
  return _then(_TasksSyncRes(
accept: null == accept ? _self._accept : accept // ignore: cast_nullable_to_non_nullable
as List<AcceptTaskSyncRes>,reject: null == reject ? _self._reject : reject // ignore: cast_nullable_to_non_nullable
as List<RejectTaskSyncRes>,
  ));
}


}


/// @nodoc
mixin _$AcceptTaskSyncRes {

 String get id; int get localId;
/// Create a copy of AcceptTaskSyncRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptTaskSyncResCopyWith<AcceptTaskSyncRes> get copyWith => _$AcceptTaskSyncResCopyWithImpl<AcceptTaskSyncRes>(this as AcceptTaskSyncRes, _$identity);

  /// Serializes this AcceptTaskSyncRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptTaskSyncRes&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId);

@override
String toString() {
  return 'AcceptTaskSyncRes(id: $id, localId: $localId)';
}


}

/// @nodoc
abstract mixin class $AcceptTaskSyncResCopyWith<$Res>  {
  factory $AcceptTaskSyncResCopyWith(AcceptTaskSyncRes value, $Res Function(AcceptTaskSyncRes) _then) = _$AcceptTaskSyncResCopyWithImpl;
@useResult
$Res call({
 String id, int localId
});




}
/// @nodoc
class _$AcceptTaskSyncResCopyWithImpl<$Res>
    implements $AcceptTaskSyncResCopyWith<$Res> {
  _$AcceptTaskSyncResCopyWithImpl(this._self, this._then);

  final AcceptTaskSyncRes _self;
  final $Res Function(AcceptTaskSyncRes) _then;

/// Create a copy of AcceptTaskSyncRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? localId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AcceptTaskSyncRes].
extension AcceptTaskSyncResPatterns on AcceptTaskSyncRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AcceptTaskSyncRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AcceptTaskSyncRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AcceptTaskSyncRes value)  $default,){
final _that = this;
switch (_that) {
case _AcceptTaskSyncRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AcceptTaskSyncRes value)?  $default,){
final _that = this;
switch (_that) {
case _AcceptTaskSyncRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int localId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AcceptTaskSyncRes() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int localId)  $default,) {final _that = this;
switch (_that) {
case _AcceptTaskSyncRes():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int localId)?  $default,) {final _that = this;
switch (_that) {
case _AcceptTaskSyncRes() when $default != null:
return $default(_that.id,_that.localId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AcceptTaskSyncRes implements AcceptTaskSyncRes {
  const _AcceptTaskSyncRes({required this.id, required this.localId});
  factory _AcceptTaskSyncRes.fromJson(Map<String, dynamic> json) => _$AcceptTaskSyncResFromJson(json);

@override final  String id;
@override final  int localId;

/// Create a copy of AcceptTaskSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptTaskSyncResCopyWith<_AcceptTaskSyncRes> get copyWith => __$AcceptTaskSyncResCopyWithImpl<_AcceptTaskSyncRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AcceptTaskSyncResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptTaskSyncRes&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId);

@override
String toString() {
  return 'AcceptTaskSyncRes(id: $id, localId: $localId)';
}


}

/// @nodoc
abstract mixin class _$AcceptTaskSyncResCopyWith<$Res> implements $AcceptTaskSyncResCopyWith<$Res> {
  factory _$AcceptTaskSyncResCopyWith(_AcceptTaskSyncRes value, $Res Function(_AcceptTaskSyncRes) _then) = __$AcceptTaskSyncResCopyWithImpl;
@override @useResult
$Res call({
 String id, int localId
});




}
/// @nodoc
class __$AcceptTaskSyncResCopyWithImpl<$Res>
    implements _$AcceptTaskSyncResCopyWith<$Res> {
  __$AcceptTaskSyncResCopyWithImpl(this._self, this._then);

  final _AcceptTaskSyncRes _self;
  final $Res Function(_AcceptTaskSyncRes) _then;

/// Create a copy of AcceptTaskSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? localId = null,}) {
  return _then(_AcceptTaskSyncRes(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RejectTaskSyncRes {

 String? get id; int get localId; TaskServerRes? get serverData;
/// Create a copy of RejectTaskSyncRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RejectTaskSyncResCopyWith<RejectTaskSyncRes> get copyWith => _$RejectTaskSyncResCopyWithImpl<RejectTaskSyncRes>(this as RejectTaskSyncRes, _$identity);

  /// Serializes this RejectTaskSyncRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectTaskSyncRes&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverData, serverData) || other.serverData == serverData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,serverData);

@override
String toString() {
  return 'RejectTaskSyncRes(id: $id, localId: $localId, serverData: $serverData)';
}


}

/// @nodoc
abstract mixin class $RejectTaskSyncResCopyWith<$Res>  {
  factory $RejectTaskSyncResCopyWith(RejectTaskSyncRes value, $Res Function(RejectTaskSyncRes) _then) = _$RejectTaskSyncResCopyWithImpl;
@useResult
$Res call({
 String? id, int localId, TaskServerRes? serverData
});


$TaskServerResCopyWith<$Res>? get serverData;

}
/// @nodoc
class _$RejectTaskSyncResCopyWithImpl<$Res>
    implements $RejectTaskSyncResCopyWith<$Res> {
  _$RejectTaskSyncResCopyWithImpl(this._self, this._then);

  final RejectTaskSyncRes _self;
  final $Res Function(RejectTaskSyncRes) _then;

/// Create a copy of RejectTaskSyncRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? localId = null,Object? serverData = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,serverData: freezed == serverData ? _self.serverData : serverData // ignore: cast_nullable_to_non_nullable
as TaskServerRes?,
  ));
}
/// Create a copy of RejectTaskSyncRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskServerResCopyWith<$Res>? get serverData {
    if (_self.serverData == null) {
    return null;
  }

  return $TaskServerResCopyWith<$Res>(_self.serverData!, (value) {
    return _then(_self.copyWith(serverData: value));
  });
}
}


/// Adds pattern-matching-related methods to [RejectTaskSyncRes].
extension RejectTaskSyncResPatterns on RejectTaskSyncRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RejectTaskSyncRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RejectTaskSyncRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RejectTaskSyncRes value)  $default,){
final _that = this;
switch (_that) {
case _RejectTaskSyncRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RejectTaskSyncRes value)?  $default,){
final _that = this;
switch (_that) {
case _RejectTaskSyncRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int localId,  TaskServerRes? serverData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RejectTaskSyncRes() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int localId,  TaskServerRes? serverData)  $default,) {final _that = this;
switch (_that) {
case _RejectTaskSyncRes():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int localId,  TaskServerRes? serverData)?  $default,) {final _that = this;
switch (_that) {
case _RejectTaskSyncRes() when $default != null:
return $default(_that.id,_that.localId,_that.serverData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RejectTaskSyncRes implements RejectTaskSyncRes {
  const _RejectTaskSyncRes({this.id, required this.localId, this.serverData});
  factory _RejectTaskSyncRes.fromJson(Map<String, dynamic> json) => _$RejectTaskSyncResFromJson(json);

@override final  String? id;
@override final  int localId;
@override final  TaskServerRes? serverData;

/// Create a copy of RejectTaskSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RejectTaskSyncResCopyWith<_RejectTaskSyncRes> get copyWith => __$RejectTaskSyncResCopyWithImpl<_RejectTaskSyncRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RejectTaskSyncResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RejectTaskSyncRes&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverData, serverData) || other.serverData == serverData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,serverData);

@override
String toString() {
  return 'RejectTaskSyncRes(id: $id, localId: $localId, serverData: $serverData)';
}


}

/// @nodoc
abstract mixin class _$RejectTaskSyncResCopyWith<$Res> implements $RejectTaskSyncResCopyWith<$Res> {
  factory _$RejectTaskSyncResCopyWith(_RejectTaskSyncRes value, $Res Function(_RejectTaskSyncRes) _then) = __$RejectTaskSyncResCopyWithImpl;
@override @useResult
$Res call({
 String? id, int localId, TaskServerRes? serverData
});


@override $TaskServerResCopyWith<$Res>? get serverData;

}
/// @nodoc
class __$RejectTaskSyncResCopyWithImpl<$Res>
    implements _$RejectTaskSyncResCopyWith<$Res> {
  __$RejectTaskSyncResCopyWithImpl(this._self, this._then);

  final _RejectTaskSyncRes _self;
  final $Res Function(_RejectTaskSyncRes) _then;

/// Create a copy of RejectTaskSyncRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? localId = null,Object? serverData = freezed,}) {
  return _then(_RejectTaskSyncRes(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,serverData: freezed == serverData ? _self.serverData : serverData // ignore: cast_nullable_to_non_nullable
as TaskServerRes?,
  ));
}

/// Create a copy of RejectTaskSyncRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskServerResCopyWith<$Res>? get serverData {
    if (_self.serverData == null) {
    return null;
  }

  return $TaskServerResCopyWith<$Res>(_self.serverData!, (value) {
    return _then(_self.copyWith(serverData: value));
  });
}
}


/// @nodoc
mixin _$TaskServerRes {

 String get title; String get description; String get categoryId; String get priority; String get userId; bool get deleted; String get status; DateTime? get dueDate; bool get hasTime; DateTime? get completedAt; DateTime get updatedAt;
/// Create a copy of TaskServerRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskServerResCopyWith<TaskServerRes> get copyWith => _$TaskServerResCopyWithImpl<TaskServerRes>(this as TaskServerRes, _$identity);

  /// Serializes this TaskServerRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskServerRes&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,categoryId,priority,userId,deleted,status,dueDate,hasTime,completedAt,updatedAt);

@override
String toString() {
  return 'TaskServerRes(title: $title, description: $description, categoryId: $categoryId, priority: $priority, userId: $userId, deleted: $deleted, status: $status, dueDate: $dueDate, hasTime: $hasTime, completedAt: $completedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TaskServerResCopyWith<$Res>  {
  factory $TaskServerResCopyWith(TaskServerRes value, $Res Function(TaskServerRes) _then) = _$TaskServerResCopyWithImpl;
@useResult
$Res call({
 String title, String description, String categoryId, String priority, String userId, bool deleted, String status, DateTime? dueDate, bool hasTime, DateTime? completedAt, DateTime updatedAt
});




}
/// @nodoc
class _$TaskServerResCopyWithImpl<$Res>
    implements $TaskServerResCopyWith<$Res> {
  _$TaskServerResCopyWithImpl(this._self, this._then);

  final TaskServerRes _self;
  final $Res Function(TaskServerRes) _then;

/// Create a copy of TaskServerRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? categoryId = null,Object? priority = null,Object? userId = null,Object? deleted = null,Object? status = null,Object? dueDate = freezed,Object? hasTime = null,Object? completedAt = freezed,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskServerRes].
extension TaskServerResPatterns on TaskServerRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskServerRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskServerRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskServerRes value)  $default,){
final _that = this;
switch (_that) {
case _TaskServerRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskServerRes value)?  $default,){
final _that = this;
switch (_that) {
case _TaskServerRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String categoryId,  String priority,  String userId,  bool deleted,  String status,  DateTime? dueDate,  bool hasTime,  DateTime? completedAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskServerRes() when $default != null:
return $default(_that.title,_that.description,_that.categoryId,_that.priority,_that.userId,_that.deleted,_that.status,_that.dueDate,_that.hasTime,_that.completedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String categoryId,  String priority,  String userId,  bool deleted,  String status,  DateTime? dueDate,  bool hasTime,  DateTime? completedAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskServerRes():
return $default(_that.title,_that.description,_that.categoryId,_that.priority,_that.userId,_that.deleted,_that.status,_that.dueDate,_that.hasTime,_that.completedAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String categoryId,  String priority,  String userId,  bool deleted,  String status,  DateTime? dueDate,  bool hasTime,  DateTime? completedAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskServerRes() when $default != null:
return $default(_that.title,_that.description,_that.categoryId,_that.priority,_that.userId,_that.deleted,_that.status,_that.dueDate,_that.hasTime,_that.completedAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskServerRes implements TaskServerRes {
  const _TaskServerRes({required this.title, required this.description, required this.categoryId, required this.priority, required this.userId, required this.deleted, required this.status, this.dueDate, required this.hasTime, this.completedAt, required this.updatedAt});
  factory _TaskServerRes.fromJson(Map<String, dynamic> json) => _$TaskServerResFromJson(json);

@override final  String title;
@override final  String description;
@override final  String categoryId;
@override final  String priority;
@override final  String userId;
@override final  bool deleted;
@override final  String status;
@override final  DateTime? dueDate;
@override final  bool hasTime;
@override final  DateTime? completedAt;
@override final  DateTime updatedAt;

/// Create a copy of TaskServerRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskServerResCopyWith<_TaskServerRes> get copyWith => __$TaskServerResCopyWithImpl<_TaskServerRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskServerResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskServerRes&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,categoryId,priority,userId,deleted,status,dueDate,hasTime,completedAt,updatedAt);

@override
String toString() {
  return 'TaskServerRes(title: $title, description: $description, categoryId: $categoryId, priority: $priority, userId: $userId, deleted: $deleted, status: $status, dueDate: $dueDate, hasTime: $hasTime, completedAt: $completedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskServerResCopyWith<$Res> implements $TaskServerResCopyWith<$Res> {
  factory _$TaskServerResCopyWith(_TaskServerRes value, $Res Function(_TaskServerRes) _then) = __$TaskServerResCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String categoryId, String priority, String userId, bool deleted, String status, DateTime? dueDate, bool hasTime, DateTime? completedAt, DateTime updatedAt
});




}
/// @nodoc
class __$TaskServerResCopyWithImpl<$Res>
    implements _$TaskServerResCopyWith<$Res> {
  __$TaskServerResCopyWithImpl(this._self, this._then);

  final _TaskServerRes _self;
  final $Res Function(_TaskServerRes) _then;

/// Create a copy of TaskServerRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? categoryId = null,Object? priority = null,Object? userId = null,Object? deleted = null,Object? status = null,Object? dueDate = freezed,Object? hasTime = null,Object? completedAt = freezed,Object? updatedAt = null,}) {
  return _then(_TaskServerRes(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

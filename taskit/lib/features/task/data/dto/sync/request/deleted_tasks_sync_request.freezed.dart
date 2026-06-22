// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deleted_tasks_sync_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeletedTasksSyncReqData {

 String? get id; int get localId;
/// Create a copy of DeletedTasksSyncReqData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletedTasksSyncReqDataCopyWith<DeletedTasksSyncReqData> get copyWith => _$DeletedTasksSyncReqDataCopyWithImpl<DeletedTasksSyncReqData>(this as DeletedTasksSyncReqData, _$identity);

  /// Serializes this DeletedTasksSyncReqData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedTasksSyncReqData&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId);

@override
String toString() {
  return 'DeletedTasksSyncReqData(id: $id, localId: $localId)';
}


}

/// @nodoc
abstract mixin class $DeletedTasksSyncReqDataCopyWith<$Res>  {
  factory $DeletedTasksSyncReqDataCopyWith(DeletedTasksSyncReqData value, $Res Function(DeletedTasksSyncReqData) _then) = _$DeletedTasksSyncReqDataCopyWithImpl;
@useResult
$Res call({
 String? id, int localId
});




}
/// @nodoc
class _$DeletedTasksSyncReqDataCopyWithImpl<$Res>
    implements $DeletedTasksSyncReqDataCopyWith<$Res> {
  _$DeletedTasksSyncReqDataCopyWithImpl(this._self, this._then);

  final DeletedTasksSyncReqData _self;
  final $Res Function(DeletedTasksSyncReqData) _then;

/// Create a copy of DeletedTasksSyncReqData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? localId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeletedTasksSyncReqData].
extension DeletedTasksSyncReqDataPatterns on DeletedTasksSyncReqData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletedTasksSyncReqData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletedTasksSyncReqData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletedTasksSyncReqData value)  $default,){
final _that = this;
switch (_that) {
case _DeletedTasksSyncReqData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletedTasksSyncReqData value)?  $default,){
final _that = this;
switch (_that) {
case _DeletedTasksSyncReqData() when $default != null:
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
case _DeletedTasksSyncReqData() when $default != null:
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
case _DeletedTasksSyncReqData():
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
case _DeletedTasksSyncReqData() when $default != null:
return $default(_that.id,_that.localId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletedTasksSyncReqData implements DeletedTasksSyncReqData {
  const _DeletedTasksSyncReqData({this.id, required this.localId});
  factory _DeletedTasksSyncReqData.fromJson(Map<String, dynamic> json) => _$DeletedTasksSyncReqDataFromJson(json);

@override final  String? id;
@override final  int localId;

/// Create a copy of DeletedTasksSyncReqData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedTasksSyncReqDataCopyWith<_DeletedTasksSyncReqData> get copyWith => __$DeletedTasksSyncReqDataCopyWithImpl<_DeletedTasksSyncReqData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletedTasksSyncReqDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletedTasksSyncReqData&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId);

@override
String toString() {
  return 'DeletedTasksSyncReqData(id: $id, localId: $localId)';
}


}

/// @nodoc
abstract mixin class _$DeletedTasksSyncReqDataCopyWith<$Res> implements $DeletedTasksSyncReqDataCopyWith<$Res> {
  factory _$DeletedTasksSyncReqDataCopyWith(_DeletedTasksSyncReqData value, $Res Function(_DeletedTasksSyncReqData) _then) = __$DeletedTasksSyncReqDataCopyWithImpl;
@override @useResult
$Res call({
 String? id, int localId
});




}
/// @nodoc
class __$DeletedTasksSyncReqDataCopyWithImpl<$Res>
    implements _$DeletedTasksSyncReqDataCopyWith<$Res> {
  __$DeletedTasksSyncReqDataCopyWithImpl(this._self, this._then);

  final _DeletedTasksSyncReqData _self;
  final $Res Function(_DeletedTasksSyncReqData) _then;

/// Create a copy of DeletedTasksSyncReqData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? localId = null,}) {
  return _then(_DeletedTasksSyncReqData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DeletedTasksSyncReq {

 List<DeletedTasksSyncReqData> get tasks;
/// Create a copy of DeletedTasksSyncReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletedTasksSyncReqCopyWith<DeletedTasksSyncReq> get copyWith => _$DeletedTasksSyncReqCopyWithImpl<DeletedTasksSyncReq>(this as DeletedTasksSyncReq, _$identity);

  /// Serializes this DeletedTasksSyncReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedTasksSyncReq&&const DeepCollectionEquality().equals(other.tasks, tasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tasks));

@override
String toString() {
  return 'DeletedTasksSyncReq(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $DeletedTasksSyncReqCopyWith<$Res>  {
  factory $DeletedTasksSyncReqCopyWith(DeletedTasksSyncReq value, $Res Function(DeletedTasksSyncReq) _then) = _$DeletedTasksSyncReqCopyWithImpl;
@useResult
$Res call({
 List<DeletedTasksSyncReqData> tasks
});




}
/// @nodoc
class _$DeletedTasksSyncReqCopyWithImpl<$Res>
    implements $DeletedTasksSyncReqCopyWith<$Res> {
  _$DeletedTasksSyncReqCopyWithImpl(this._self, this._then);

  final DeletedTasksSyncReq _self;
  final $Res Function(DeletedTasksSyncReq) _then;

/// Create a copy of DeletedTasksSyncReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tasks = null,}) {
  return _then(_self.copyWith(
tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<DeletedTasksSyncReqData>,
  ));
}

}


/// Adds pattern-matching-related methods to [DeletedTasksSyncReq].
extension DeletedTasksSyncReqPatterns on DeletedTasksSyncReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletedTasksSyncReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletedTasksSyncReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletedTasksSyncReq value)  $default,){
final _that = this;
switch (_that) {
case _DeletedTasksSyncReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletedTasksSyncReq value)?  $default,){
final _that = this;
switch (_that) {
case _DeletedTasksSyncReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DeletedTasksSyncReqData> tasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeletedTasksSyncReq() when $default != null:
return $default(_that.tasks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DeletedTasksSyncReqData> tasks)  $default,) {final _that = this;
switch (_that) {
case _DeletedTasksSyncReq():
return $default(_that.tasks);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DeletedTasksSyncReqData> tasks)?  $default,) {final _that = this;
switch (_that) {
case _DeletedTasksSyncReq() when $default != null:
return $default(_that.tasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletedTasksSyncReq implements DeletedTasksSyncReq {
  const _DeletedTasksSyncReq({required final  List<DeletedTasksSyncReqData> tasks}): _tasks = tasks;
  factory _DeletedTasksSyncReq.fromJson(Map<String, dynamic> json) => _$DeletedTasksSyncReqFromJson(json);

 final  List<DeletedTasksSyncReqData> _tasks;
@override List<DeletedTasksSyncReqData> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of DeletedTasksSyncReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedTasksSyncReqCopyWith<_DeletedTasksSyncReq> get copyWith => __$DeletedTasksSyncReqCopyWithImpl<_DeletedTasksSyncReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletedTasksSyncReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletedTasksSyncReq&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'DeletedTasksSyncReq(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$DeletedTasksSyncReqCopyWith<$Res> implements $DeletedTasksSyncReqCopyWith<$Res> {
  factory _$DeletedTasksSyncReqCopyWith(_DeletedTasksSyncReq value, $Res Function(_DeletedTasksSyncReq) _then) = __$DeletedTasksSyncReqCopyWithImpl;
@override @useResult
$Res call({
 List<DeletedTasksSyncReqData> tasks
});




}
/// @nodoc
class __$DeletedTasksSyncReqCopyWithImpl<$Res>
    implements _$DeletedTasksSyncReqCopyWith<$Res> {
  __$DeletedTasksSyncReqCopyWithImpl(this._self, this._then);

  final _DeletedTasksSyncReq _self;
  final $Res Function(_DeletedTasksSyncReq) _then;

/// Create a copy of DeletedTasksSyncReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tasks = null,}) {
  return _then(_DeletedTasksSyncReq(
tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<DeletedTasksSyncReqData>,
  ));
}


}

// dart format on

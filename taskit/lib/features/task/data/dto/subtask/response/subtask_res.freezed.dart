// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtask_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubtaskRes {

 int? get localId; String get id; String get title; bool get completed; bool get deleted; DateTime? get completedAt; DateTime get updatedAt; DateTime get createdAt; String get taskId;
/// Create a copy of SubtaskRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubtaskResCopyWith<SubtaskRes> get copyWith => _$SubtaskResCopyWithImpl<SubtaskRes>(this as SubtaskRes, _$identity);

  /// Serializes this SubtaskRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubtaskRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.taskId, taskId) || other.taskId == taskId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,title,completed,deleted,completedAt,updatedAt,createdAt,taskId);

@override
String toString() {
  return 'SubtaskRes(localId: $localId, id: $id, title: $title, completed: $completed, deleted: $deleted, completedAt: $completedAt, updatedAt: $updatedAt, createdAt: $createdAt, taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $SubtaskResCopyWith<$Res>  {
  factory $SubtaskResCopyWith(SubtaskRes value, $Res Function(SubtaskRes) _then) = _$SubtaskResCopyWithImpl;
@useResult
$Res call({
 int? localId, String id, String title, bool completed, bool deleted, DateTime? completedAt, DateTime updatedAt, DateTime createdAt, String taskId
});




}
/// @nodoc
class _$SubtaskResCopyWithImpl<$Res>
    implements $SubtaskResCopyWith<$Res> {
  _$SubtaskResCopyWithImpl(this._self, this._then);

  final SubtaskRes _self;
  final $Res Function(SubtaskRes) _then;

/// Create a copy of SubtaskRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = null,Object? title = null,Object? completed = null,Object? deleted = null,Object? completedAt = freezed,Object? updatedAt = null,Object? createdAt = null,Object? taskId = null,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubtaskRes].
extension SubtaskResPatterns on SubtaskRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubtaskRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubtaskRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubtaskRes value)  $default,){
final _that = this;
switch (_that) {
case _SubtaskRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubtaskRes value)?  $default,){
final _that = this;
switch (_that) {
case _SubtaskRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? localId,  String id,  String title,  bool completed,  bool deleted,  DateTime? completedAt,  DateTime updatedAt,  DateTime createdAt,  String taskId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubtaskRes() when $default != null:
return $default(_that.localId,_that.id,_that.title,_that.completed,_that.deleted,_that.completedAt,_that.updatedAt,_that.createdAt,_that.taskId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? localId,  String id,  String title,  bool completed,  bool deleted,  DateTime? completedAt,  DateTime updatedAt,  DateTime createdAt,  String taskId)  $default,) {final _that = this;
switch (_that) {
case _SubtaskRes():
return $default(_that.localId,_that.id,_that.title,_that.completed,_that.deleted,_that.completedAt,_that.updatedAt,_that.createdAt,_that.taskId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? localId,  String id,  String title,  bool completed,  bool deleted,  DateTime? completedAt,  DateTime updatedAt,  DateTime createdAt,  String taskId)?  $default,) {final _that = this;
switch (_that) {
case _SubtaskRes() when $default != null:
return $default(_that.localId,_that.id,_that.title,_that.completed,_that.deleted,_that.completedAt,_that.updatedAt,_that.createdAt,_that.taskId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubtaskRes implements SubtaskRes {
  const _SubtaskRes({this.localId, required this.id, required this.title, required this.completed, required this.deleted, this.completedAt, required this.updatedAt, required this.createdAt, required this.taskId});
  factory _SubtaskRes.fromJson(Map<String, dynamic> json) => _$SubtaskResFromJson(json);

@override final  int? localId;
@override final  String id;
@override final  String title;
@override final  bool completed;
@override final  bool deleted;
@override final  DateTime? completedAt;
@override final  DateTime updatedAt;
@override final  DateTime createdAt;
@override final  String taskId;

/// Create a copy of SubtaskRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubtaskResCopyWith<_SubtaskRes> get copyWith => __$SubtaskResCopyWithImpl<_SubtaskRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubtaskResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubtaskRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.taskId, taskId) || other.taskId == taskId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,title,completed,deleted,completedAt,updatedAt,createdAt,taskId);

@override
String toString() {
  return 'SubtaskRes(localId: $localId, id: $id, title: $title, completed: $completed, deleted: $deleted, completedAt: $completedAt, updatedAt: $updatedAt, createdAt: $createdAt, taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class _$SubtaskResCopyWith<$Res> implements $SubtaskResCopyWith<$Res> {
  factory _$SubtaskResCopyWith(_SubtaskRes value, $Res Function(_SubtaskRes) _then) = __$SubtaskResCopyWithImpl;
@override @useResult
$Res call({
 int? localId, String id, String title, bool completed, bool deleted, DateTime? completedAt, DateTime updatedAt, DateTime createdAt, String taskId
});




}
/// @nodoc
class __$SubtaskResCopyWithImpl<$Res>
    implements _$SubtaskResCopyWith<$Res> {
  __$SubtaskResCopyWithImpl(this._self, this._then);

  final _SubtaskRes _self;
  final $Res Function(_SubtaskRes) _then;

/// Create a copy of SubtaskRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = null,Object? title = null,Object? completed = null,Object? deleted = null,Object? completedAt = freezed,Object? updatedAt = null,Object? createdAt = null,Object? taskId = null,}) {
  return _then(_SubtaskRes(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

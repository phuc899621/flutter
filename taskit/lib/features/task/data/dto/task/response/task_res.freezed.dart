// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskRes {

 int? get localId; String get id; String get title; String get description; String get categoryId; String get priority; String get userId; bool get deleted; String get status; DateTime? get dueDate; bool get hasTime; DateTime? get completedAt; List<SubtaskRes> get subtasks; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TaskRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskResCopyWith<TaskRes> get copyWith => _$TaskResCopyWithImpl<TaskRes>(this as TaskRes, _$identity);

  /// Serializes this TaskRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other.subtasks, subtasks)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,title,description,categoryId,priority,userId,deleted,status,dueDate,hasTime,completedAt,const DeepCollectionEquality().hash(subtasks),createdAt,updatedAt);

@override
String toString() {
  return 'TaskRes(localId: $localId, id: $id, title: $title, description: $description, categoryId: $categoryId, priority: $priority, userId: $userId, deleted: $deleted, status: $status, dueDate: $dueDate, hasTime: $hasTime, completedAt: $completedAt, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TaskResCopyWith<$Res>  {
  factory $TaskResCopyWith(TaskRes value, $Res Function(TaskRes) _then) = _$TaskResCopyWithImpl;
@useResult
$Res call({
 int? localId, String id, String title, String description, String categoryId, String priority, String userId, bool deleted, String status, DateTime? dueDate, bool hasTime, DateTime? completedAt, List<SubtaskRes> subtasks, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TaskResCopyWithImpl<$Res>
    implements $TaskResCopyWith<$Res> {
  _$TaskResCopyWithImpl(this._self, this._then);

  final TaskRes _self;
  final $Res Function(TaskRes) _then;

/// Create a copy of TaskRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = null,Object? title = null,Object? description = null,Object? categoryId = null,Object? priority = null,Object? userId = null,Object? deleted = null,Object? status = null,Object? dueDate = freezed,Object? hasTime = null,Object? completedAt = freezed,Object? subtasks = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,subtasks: null == subtasks ? _self.subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<SubtaskRes>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskRes].
extension TaskResPatterns on TaskRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskRes value)  $default,){
final _that = this;
switch (_that) {
case _TaskRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskRes value)?  $default,){
final _that = this;
switch (_that) {
case _TaskRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? localId,  String id,  String title,  String description,  String categoryId,  String priority,  String userId,  bool deleted,  String status,  DateTime? dueDate,  bool hasTime,  DateTime? completedAt,  List<SubtaskRes> subtasks,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskRes() when $default != null:
return $default(_that.localId,_that.id,_that.title,_that.description,_that.categoryId,_that.priority,_that.userId,_that.deleted,_that.status,_that.dueDate,_that.hasTime,_that.completedAt,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? localId,  String id,  String title,  String description,  String categoryId,  String priority,  String userId,  bool deleted,  String status,  DateTime? dueDate,  bool hasTime,  DateTime? completedAt,  List<SubtaskRes> subtasks,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskRes():
return $default(_that.localId,_that.id,_that.title,_that.description,_that.categoryId,_that.priority,_that.userId,_that.deleted,_that.status,_that.dueDate,_that.hasTime,_that.completedAt,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? localId,  String id,  String title,  String description,  String categoryId,  String priority,  String userId,  bool deleted,  String status,  DateTime? dueDate,  bool hasTime,  DateTime? completedAt,  List<SubtaskRes> subtasks,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskRes() when $default != null:
return $default(_that.localId,_that.id,_that.title,_that.description,_that.categoryId,_that.priority,_that.userId,_that.deleted,_that.status,_that.dueDate,_that.hasTime,_that.completedAt,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskRes implements TaskRes {
  const _TaskRes({this.localId, required this.id, required this.title, required this.description, required this.categoryId, required this.priority, required this.userId, required this.deleted, required this.status, this.dueDate, required this.hasTime, this.completedAt, final  List<SubtaskRes> subtasks = const [], required this.createdAt, required this.updatedAt}): _subtasks = subtasks;
  factory _TaskRes.fromJson(Map<String, dynamic> json) => _$TaskResFromJson(json);

@override final  int? localId;
@override final  String id;
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
 final  List<SubtaskRes> _subtasks;
@override@JsonKey() List<SubtaskRes> get subtasks {
  if (_subtasks is EqualUnmodifiableListView) return _subtasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtasks);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TaskRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskResCopyWith<_TaskRes> get copyWith => __$TaskResCopyWithImpl<_TaskRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other._subtasks, _subtasks)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,title,description,categoryId,priority,userId,deleted,status,dueDate,hasTime,completedAt,const DeepCollectionEquality().hash(_subtasks),createdAt,updatedAt);

@override
String toString() {
  return 'TaskRes(localId: $localId, id: $id, title: $title, description: $description, categoryId: $categoryId, priority: $priority, userId: $userId, deleted: $deleted, status: $status, dueDate: $dueDate, hasTime: $hasTime, completedAt: $completedAt, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskResCopyWith<$Res> implements $TaskResCopyWith<$Res> {
  factory _$TaskResCopyWith(_TaskRes value, $Res Function(_TaskRes) _then) = __$TaskResCopyWithImpl;
@override @useResult
$Res call({
 int? localId, String id, String title, String description, String categoryId, String priority, String userId, bool deleted, String status, DateTime? dueDate, bool hasTime, DateTime? completedAt, List<SubtaskRes> subtasks, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TaskResCopyWithImpl<$Res>
    implements _$TaskResCopyWith<$Res> {
  __$TaskResCopyWithImpl(this._self, this._then);

  final _TaskRes _self;
  final $Res Function(_TaskRes) _then;

/// Create a copy of TaskRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = null,Object? title = null,Object? description = null,Object? categoryId = null,Object? priority = null,Object? userId = null,Object? deleted = null,Object? status = null,Object? dueDate = freezed,Object? hasTime = null,Object? completedAt = freezed,Object? subtasks = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TaskRes(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,subtasks: null == subtasks ? _self._subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<SubtaskRes>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

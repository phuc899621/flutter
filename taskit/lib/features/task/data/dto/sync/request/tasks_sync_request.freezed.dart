// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_sync_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TasksSyncReq {

 List<TasksSyncReqEntry> get tasks;
/// Create a copy of TasksSyncReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksSyncReqCopyWith<TasksSyncReq> get copyWith => _$TasksSyncReqCopyWithImpl<TasksSyncReq>(this as TasksSyncReq, _$identity);

  /// Serializes this TasksSyncReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksSyncReq&&const DeepCollectionEquality().equals(other.tasks, tasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tasks));

@override
String toString() {
  return 'TasksSyncReq(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $TasksSyncReqCopyWith<$Res>  {
  factory $TasksSyncReqCopyWith(TasksSyncReq value, $Res Function(TasksSyncReq) _then) = _$TasksSyncReqCopyWithImpl;
@useResult
$Res call({
 List<TasksSyncReqEntry> tasks
});




}
/// @nodoc
class _$TasksSyncReqCopyWithImpl<$Res>
    implements $TasksSyncReqCopyWith<$Res> {
  _$TasksSyncReqCopyWithImpl(this._self, this._then);

  final TasksSyncReq _self;
  final $Res Function(TasksSyncReq) _then;

/// Create a copy of TasksSyncReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tasks = null,}) {
  return _then(_self.copyWith(
tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TasksSyncReqEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [TasksSyncReq].
extension TasksSyncReqPatterns on TasksSyncReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TasksSyncReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasksSyncReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TasksSyncReq value)  $default,){
final _that = this;
switch (_that) {
case _TasksSyncReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TasksSyncReq value)?  $default,){
final _that = this;
switch (_that) {
case _TasksSyncReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TasksSyncReqEntry> tasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasksSyncReq() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TasksSyncReqEntry> tasks)  $default,) {final _that = this;
switch (_that) {
case _TasksSyncReq():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TasksSyncReqEntry> tasks)?  $default,) {final _that = this;
switch (_that) {
case _TasksSyncReq() when $default != null:
return $default(_that.tasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TasksSyncReq implements TasksSyncReq {
  const _TasksSyncReq({required final  List<TasksSyncReqEntry> tasks}): _tasks = tasks;
  factory _TasksSyncReq.fromJson(Map<String, dynamic> json) => _$TasksSyncReqFromJson(json);

 final  List<TasksSyncReqEntry> _tasks;
@override List<TasksSyncReqEntry> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of TasksSyncReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasksSyncReqCopyWith<_TasksSyncReq> get copyWith => __$TasksSyncReqCopyWithImpl<_TasksSyncReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TasksSyncReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksSyncReq&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'TasksSyncReq(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$TasksSyncReqCopyWith<$Res> implements $TasksSyncReqCopyWith<$Res> {
  factory _$TasksSyncReqCopyWith(_TasksSyncReq value, $Res Function(_TasksSyncReq) _then) = __$TasksSyncReqCopyWithImpl;
@override @useResult
$Res call({
 List<TasksSyncReqEntry> tasks
});




}
/// @nodoc
class __$TasksSyncReqCopyWithImpl<$Res>
    implements _$TasksSyncReqCopyWith<$Res> {
  __$TasksSyncReqCopyWithImpl(this._self, this._then);

  final _TasksSyncReq _self;
  final $Res Function(_TasksSyncReq) _then;

/// Create a copy of TasksSyncReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tasks = null,}) {
  return _then(_TasksSyncReq(
tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TasksSyncReqEntry>,
  ));
}


}


/// @nodoc
mixin _$TasksSyncReqEntry {

 String? get id; int get localId; String get title; String get description; String get categoryId; String get priority; bool get deleted; String get status; DateTime? get reminderAt; DateTime? get dueDate; bool get hasTime; DateTime? get completedAt; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TasksSyncReqEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksSyncReqEntryCopyWith<TasksSyncReqEntry> get copyWith => _$TasksSyncReqEntryCopyWithImpl<TasksSyncReqEntry>(this as TasksSyncReqEntry, _$identity);

  /// Serializes this TasksSyncReqEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksSyncReqEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.status, status) || other.status == status)&&(identical(other.reminderAt, reminderAt) || other.reminderAt == reminderAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,title,description,categoryId,priority,deleted,status,reminderAt,dueDate,hasTime,completedAt,createdAt,updatedAt);

@override
String toString() {
  return 'TasksSyncReqEntry(id: $id, localId: $localId, title: $title, description: $description, categoryId: $categoryId, priority: $priority, deleted: $deleted, status: $status, reminderAt: $reminderAt, dueDate: $dueDate, hasTime: $hasTime, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TasksSyncReqEntryCopyWith<$Res>  {
  factory $TasksSyncReqEntryCopyWith(TasksSyncReqEntry value, $Res Function(TasksSyncReqEntry) _then) = _$TasksSyncReqEntryCopyWithImpl;
@useResult
$Res call({
 String? id, int localId, String title, String description, String categoryId, String priority, bool deleted, String status, DateTime? reminderAt, DateTime? dueDate, bool hasTime, DateTime? completedAt, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TasksSyncReqEntryCopyWithImpl<$Res>
    implements $TasksSyncReqEntryCopyWith<$Res> {
  _$TasksSyncReqEntryCopyWithImpl(this._self, this._then);

  final TasksSyncReqEntry _self;
  final $Res Function(TasksSyncReqEntry) _then;

/// Create a copy of TasksSyncReqEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? localId = null,Object? title = null,Object? description = null,Object? categoryId = null,Object? priority = null,Object? deleted = null,Object? status = null,Object? reminderAt = freezed,Object? dueDate = freezed,Object? hasTime = null,Object? completedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reminderAt: freezed == reminderAt ? _self.reminderAt : reminderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TasksSyncReqEntry].
extension TasksSyncReqEntryPatterns on TasksSyncReqEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TasksSyncReqEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasksSyncReqEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TasksSyncReqEntry value)  $default,){
final _that = this;
switch (_that) {
case _TasksSyncReqEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TasksSyncReqEntry value)?  $default,){
final _that = this;
switch (_that) {
case _TasksSyncReqEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int localId,  String title,  String description,  String categoryId,  String priority,  bool deleted,  String status,  DateTime? reminderAt,  DateTime? dueDate,  bool hasTime,  DateTime? completedAt,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasksSyncReqEntry() when $default != null:
return $default(_that.id,_that.localId,_that.title,_that.description,_that.categoryId,_that.priority,_that.deleted,_that.status,_that.reminderAt,_that.dueDate,_that.hasTime,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int localId,  String title,  String description,  String categoryId,  String priority,  bool deleted,  String status,  DateTime? reminderAt,  DateTime? dueDate,  bool hasTime,  DateTime? completedAt,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TasksSyncReqEntry():
return $default(_that.id,_that.localId,_that.title,_that.description,_that.categoryId,_that.priority,_that.deleted,_that.status,_that.reminderAt,_that.dueDate,_that.hasTime,_that.completedAt,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int localId,  String title,  String description,  String categoryId,  String priority,  bool deleted,  String status,  DateTime? reminderAt,  DateTime? dueDate,  bool hasTime,  DateTime? completedAt,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TasksSyncReqEntry() when $default != null:
return $default(_that.id,_that.localId,_that.title,_that.description,_that.categoryId,_that.priority,_that.deleted,_that.status,_that.reminderAt,_that.dueDate,_that.hasTime,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TasksSyncReqEntry implements TasksSyncReqEntry {
  const _TasksSyncReqEntry({this.id, required this.localId, required this.title, required this.description, required this.categoryId, required this.priority, required this.deleted, required this.status, this.reminderAt, this.dueDate, required this.hasTime, this.completedAt, required this.createdAt, required this.updatedAt});
  factory _TasksSyncReqEntry.fromJson(Map<String, dynamic> json) => _$TasksSyncReqEntryFromJson(json);

@override final  String? id;
@override final  int localId;
@override final  String title;
@override final  String description;
@override final  String categoryId;
@override final  String priority;
@override final  bool deleted;
@override final  String status;
@override final  DateTime? reminderAt;
@override final  DateTime? dueDate;
@override final  bool hasTime;
@override final  DateTime? completedAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TasksSyncReqEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasksSyncReqEntryCopyWith<_TasksSyncReqEntry> get copyWith => __$TasksSyncReqEntryCopyWithImpl<_TasksSyncReqEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TasksSyncReqEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksSyncReqEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.status, status) || other.status == status)&&(identical(other.reminderAt, reminderAt) || other.reminderAt == reminderAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,localId,title,description,categoryId,priority,deleted,status,reminderAt,dueDate,hasTime,completedAt,createdAt,updatedAt);

@override
String toString() {
  return 'TasksSyncReqEntry(id: $id, localId: $localId, title: $title, description: $description, categoryId: $categoryId, priority: $priority, deleted: $deleted, status: $status, reminderAt: $reminderAt, dueDate: $dueDate, hasTime: $hasTime, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TasksSyncReqEntryCopyWith<$Res> implements $TasksSyncReqEntryCopyWith<$Res> {
  factory _$TasksSyncReqEntryCopyWith(_TasksSyncReqEntry value, $Res Function(_TasksSyncReqEntry) _then) = __$TasksSyncReqEntryCopyWithImpl;
@override @useResult
$Res call({
 String? id, int localId, String title, String description, String categoryId, String priority, bool deleted, String status, DateTime? reminderAt, DateTime? dueDate, bool hasTime, DateTime? completedAt, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TasksSyncReqEntryCopyWithImpl<$Res>
    implements _$TasksSyncReqEntryCopyWith<$Res> {
  __$TasksSyncReqEntryCopyWithImpl(this._self, this._then);

  final _TasksSyncReqEntry _self;
  final $Res Function(_TasksSyncReqEntry) _then;

/// Create a copy of TasksSyncReqEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? localId = null,Object? title = null,Object? description = null,Object? categoryId = null,Object? priority = null,Object? deleted = null,Object? status = null,Object? reminderAt = freezed,Object? dueDate = freezed,Object? hasTime = null,Object? completedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TasksSyncReqEntry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reminderAt: freezed == reminderAt ? _self.reminderAt : reminderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

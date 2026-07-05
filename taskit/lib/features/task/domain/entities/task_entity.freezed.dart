// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskEntity {

 int get localId; String? get remoteId; String get title; String get description; CategoryEntity get category; TaskPriority get priority; int get userLocalId; bool get synced; bool get deleted; DateTime? get reminderAt; int? get reminderOffset; TaskReminderType get reminderType; ReminderRepeatType get repeatType; DateTime? get completedAt; TaskStatus get status; DateTime? get dueDate; bool get hasTime; List<SubtaskEntity> get subtasks; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<TaskEntity> get copyWith => _$TaskEntityCopyWithImpl<TaskEntity>(this as TaskEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEntity&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.userLocalId, userLocalId) || other.userLocalId == userLocalId)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.reminderAt, reminderAt) || other.reminderAt == reminderAt)&&(identical(other.reminderOffset, reminderOffset) || other.reminderOffset == reminderOffset)&&(identical(other.reminderType, reminderType) || other.reminderType == reminderType)&&(identical(other.repeatType, repeatType) || other.repeatType == repeatType)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&const DeepCollectionEquality().equals(other.subtasks, subtasks)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,localId,remoteId,title,description,category,priority,userLocalId,synced,deleted,reminderAt,reminderOffset,reminderType,repeatType,completedAt,status,dueDate,hasTime,const DeepCollectionEquality().hash(subtasks),createdAt,updatedAt]);

@override
String toString() {
  return 'TaskEntity(localId: $localId, remoteId: $remoteId, title: $title, description: $description, category: $category, priority: $priority, userLocalId: $userLocalId, synced: $synced, deleted: $deleted, reminderAt: $reminderAt, reminderOffset: $reminderOffset, reminderType: $reminderType, repeatType: $repeatType, completedAt: $completedAt, status: $status, dueDate: $dueDate, hasTime: $hasTime, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TaskEntityCopyWith<$Res>  {
  factory $TaskEntityCopyWith(TaskEntity value, $Res Function(TaskEntity) _then) = _$TaskEntityCopyWithImpl;
@useResult
$Res call({
 int localId, String? remoteId, String title, String description, CategoryEntity category, TaskPriority priority, int userLocalId, bool synced, bool deleted, DateTime? reminderAt, int? reminderOffset, TaskReminderType reminderType, ReminderRepeatType repeatType, DateTime? completedAt, TaskStatus status, DateTime? dueDate, bool hasTime, List<SubtaskEntity> subtasks, DateTime createdAt, DateTime updatedAt
});


$CategoryEntityCopyWith<$Res> get category;

}
/// @nodoc
class _$TaskEntityCopyWithImpl<$Res>
    implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._self, this._then);

  final TaskEntity _self;
  final $Res Function(TaskEntity) _then;

/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? remoteId = freezed,Object? title = null,Object? description = null,Object? category = null,Object? priority = null,Object? userLocalId = null,Object? synced = null,Object? deleted = null,Object? reminderAt = freezed,Object? reminderOffset = freezed,Object? reminderType = null,Object? repeatType = null,Object? completedAt = freezed,Object? status = null,Object? dueDate = freezed,Object? hasTime = null,Object? subtasks = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryEntity,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,userLocalId: null == userLocalId ? _self.userLocalId : userLocalId // ignore: cast_nullable_to_non_nullable
as int,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,reminderAt: freezed == reminderAt ? _self.reminderAt : reminderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reminderOffset: freezed == reminderOffset ? _self.reminderOffset : reminderOffset // ignore: cast_nullable_to_non_nullable
as int?,reminderType: null == reminderType ? _self.reminderType : reminderType // ignore: cast_nullable_to_non_nullable
as TaskReminderType,repeatType: null == repeatType ? _self.repeatType : repeatType // ignore: cast_nullable_to_non_nullable
as ReminderRepeatType,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,subtasks: null == subtasks ? _self.subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<SubtaskEntity>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryEntityCopyWith<$Res> get category {
  
  return $CategoryEntityCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [TaskEntity].
extension TaskEntityPatterns on TaskEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskEntity value)  $default,){
final _that = this;
switch (_that) {
case _TaskEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int localId,  String? remoteId,  String title,  String description,  CategoryEntity category,  TaskPriority priority,  int userLocalId,  bool synced,  bool deleted,  DateTime? reminderAt,  int? reminderOffset,  TaskReminderType reminderType,  ReminderRepeatType repeatType,  DateTime? completedAt,  TaskStatus status,  DateTime? dueDate,  bool hasTime,  List<SubtaskEntity> subtasks,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
return $default(_that.localId,_that.remoteId,_that.title,_that.description,_that.category,_that.priority,_that.userLocalId,_that.synced,_that.deleted,_that.reminderAt,_that.reminderOffset,_that.reminderType,_that.repeatType,_that.completedAt,_that.status,_that.dueDate,_that.hasTime,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int localId,  String? remoteId,  String title,  String description,  CategoryEntity category,  TaskPriority priority,  int userLocalId,  bool synced,  bool deleted,  DateTime? reminderAt,  int? reminderOffset,  TaskReminderType reminderType,  ReminderRepeatType repeatType,  DateTime? completedAt,  TaskStatus status,  DateTime? dueDate,  bool hasTime,  List<SubtaskEntity> subtasks,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskEntity():
return $default(_that.localId,_that.remoteId,_that.title,_that.description,_that.category,_that.priority,_that.userLocalId,_that.synced,_that.deleted,_that.reminderAt,_that.reminderOffset,_that.reminderType,_that.repeatType,_that.completedAt,_that.status,_that.dueDate,_that.hasTime,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int localId,  String? remoteId,  String title,  String description,  CategoryEntity category,  TaskPriority priority,  int userLocalId,  bool synced,  bool deleted,  DateTime? reminderAt,  int? reminderOffset,  TaskReminderType reminderType,  ReminderRepeatType repeatType,  DateTime? completedAt,  TaskStatus status,  DateTime? dueDate,  bool hasTime,  List<SubtaskEntity> subtasks,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
return $default(_that.localId,_that.remoteId,_that.title,_that.description,_that.category,_that.priority,_that.userLocalId,_that.synced,_that.deleted,_that.reminderAt,_that.reminderOffset,_that.reminderType,_that.repeatType,_that.completedAt,_that.status,_that.dueDate,_that.hasTime,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TaskEntity extends TaskEntity {
  const _TaskEntity({required this.localId, this.remoteId, required this.title, required this.description, required this.category, required this.priority, required this.userLocalId, required this.synced, required this.deleted, this.reminderAt, this.reminderOffset, this.reminderType = TaskReminderType.none, this.repeatType = ReminderRepeatType.none, this.completedAt, required this.status, this.dueDate, required this.hasTime, required final  List<SubtaskEntity> subtasks, required this.createdAt, required this.updatedAt}): _subtasks = subtasks,super._();
  

@override final  int localId;
@override final  String? remoteId;
@override final  String title;
@override final  String description;
@override final  CategoryEntity category;
@override final  TaskPriority priority;
@override final  int userLocalId;
@override final  bool synced;
@override final  bool deleted;
@override final  DateTime? reminderAt;
@override final  int? reminderOffset;
@override@JsonKey() final  TaskReminderType reminderType;
@override@JsonKey() final  ReminderRepeatType repeatType;
@override final  DateTime? completedAt;
@override final  TaskStatus status;
@override final  DateTime? dueDate;
@override final  bool hasTime;
 final  List<SubtaskEntity> _subtasks;
@override List<SubtaskEntity> get subtasks {
  if (_subtasks is EqualUnmodifiableListView) return _subtasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtasks);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskEntityCopyWith<_TaskEntity> get copyWith => __$TaskEntityCopyWithImpl<_TaskEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskEntity&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.userLocalId, userLocalId) || other.userLocalId == userLocalId)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.reminderAt, reminderAt) || other.reminderAt == reminderAt)&&(identical(other.reminderOffset, reminderOffset) || other.reminderOffset == reminderOffset)&&(identical(other.reminderType, reminderType) || other.reminderType == reminderType)&&(identical(other.repeatType, repeatType) || other.repeatType == repeatType)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&const DeepCollectionEquality().equals(other._subtasks, _subtasks)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,localId,remoteId,title,description,category,priority,userLocalId,synced,deleted,reminderAt,reminderOffset,reminderType,repeatType,completedAt,status,dueDate,hasTime,const DeepCollectionEquality().hash(_subtasks),createdAt,updatedAt]);

@override
String toString() {
  return 'TaskEntity(localId: $localId, remoteId: $remoteId, title: $title, description: $description, category: $category, priority: $priority, userLocalId: $userLocalId, synced: $synced, deleted: $deleted, reminderAt: $reminderAt, reminderOffset: $reminderOffset, reminderType: $reminderType, repeatType: $repeatType, completedAt: $completedAt, status: $status, dueDate: $dueDate, hasTime: $hasTime, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskEntityCopyWith<$Res> implements $TaskEntityCopyWith<$Res> {
  factory _$TaskEntityCopyWith(_TaskEntity value, $Res Function(_TaskEntity) _then) = __$TaskEntityCopyWithImpl;
@override @useResult
$Res call({
 int localId, String? remoteId, String title, String description, CategoryEntity category, TaskPriority priority, int userLocalId, bool synced, bool deleted, DateTime? reminderAt, int? reminderOffset, TaskReminderType reminderType, ReminderRepeatType repeatType, DateTime? completedAt, TaskStatus status, DateTime? dueDate, bool hasTime, List<SubtaskEntity> subtasks, DateTime createdAt, DateTime updatedAt
});


@override $CategoryEntityCopyWith<$Res> get category;

}
/// @nodoc
class __$TaskEntityCopyWithImpl<$Res>
    implements _$TaskEntityCopyWith<$Res> {
  __$TaskEntityCopyWithImpl(this._self, this._then);

  final _TaskEntity _self;
  final $Res Function(_TaskEntity) _then;

/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? remoteId = freezed,Object? title = null,Object? description = null,Object? category = null,Object? priority = null,Object? userLocalId = null,Object? synced = null,Object? deleted = null,Object? reminderAt = freezed,Object? reminderOffset = freezed,Object? reminderType = null,Object? repeatType = null,Object? completedAt = freezed,Object? status = null,Object? dueDate = freezed,Object? hasTime = null,Object? subtasks = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TaskEntity(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryEntity,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,userLocalId: null == userLocalId ? _self.userLocalId : userLocalId // ignore: cast_nullable_to_non_nullable
as int,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,reminderAt: freezed == reminderAt ? _self.reminderAt : reminderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reminderOffset: freezed == reminderOffset ? _self.reminderOffset : reminderOffset // ignore: cast_nullable_to_non_nullable
as int?,reminderType: null == reminderType ? _self.reminderType : reminderType // ignore: cast_nullable_to_non_nullable
as TaskReminderType,repeatType: null == repeatType ? _self.repeatType : repeatType // ignore: cast_nullable_to_non_nullable
as ReminderRepeatType,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,subtasks: null == subtasks ? _self._subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<SubtaskEntity>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryEntityCopyWith<$Res> get category {
  
  return $CategoryEntityCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on

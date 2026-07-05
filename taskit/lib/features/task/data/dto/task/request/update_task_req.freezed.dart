// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_task_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UpdateTaskReq _$UpdateTaskReqFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'title':
          return _UpdateTaskTitleReq.fromJson(
            json
          );
                case 'status':
          return _UpdateTaskStatusReq.fromJson(
            json
          );
                case 'priority':
          return _UpdateTaskPriorityReq.fromJson(
            json
          );
                case 'dueDate':
          return _UpdateTaskDueDateReq.fromJson(
            json
          );
                case 'reminder':
          return _UpdateTaskReminderReq.fromJson(
            json
          );
                case 'description':
          return _UpdateTaskDescriptionReq.fromJson(
            json
          );
                case 'categoryId':
          return _UpdateTaskCategoryIdReq.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'UpdateTaskReq',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$UpdateTaskReq {

 int get localId;
/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTaskReqCopyWith<UpdateTaskReq> get copyWith => _$UpdateTaskReqCopyWithImpl<UpdateTaskReq>(this as UpdateTaskReq, _$identity);

  /// Serializes this UpdateTaskReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTaskReq&&(identical(other.localId, localId) || other.localId == localId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId);

@override
String toString() {
  return 'UpdateTaskReq(localId: $localId)';
}


}

/// @nodoc
abstract mixin class $UpdateTaskReqCopyWith<$Res>  {
  factory $UpdateTaskReqCopyWith(UpdateTaskReq value, $Res Function(UpdateTaskReq) _then) = _$UpdateTaskReqCopyWithImpl;
@useResult
$Res call({
 int localId
});




}
/// @nodoc
class _$UpdateTaskReqCopyWithImpl<$Res>
    implements $UpdateTaskReqCopyWith<$Res> {
  _$UpdateTaskReqCopyWithImpl(this._self, this._then);

  final UpdateTaskReq _self;
  final $Res Function(UpdateTaskReq) _then;

/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateTaskReq].
extension UpdateTaskReqPatterns on UpdateTaskReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UpdateTaskTitleReq value)?  title,TResult Function( _UpdateTaskStatusReq value)?  status,TResult Function( _UpdateTaskPriorityReq value)?  priority,TResult Function( _UpdateTaskDueDateReq value)?  dueDate,TResult Function( _UpdateTaskReminderReq value)?  reminder,TResult Function( _UpdateTaskDescriptionReq value)?  description,TResult Function( _UpdateTaskCategoryIdReq value)?  categoryId,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateTaskTitleReq() when title != null:
return title(_that);case _UpdateTaskStatusReq() when status != null:
return status(_that);case _UpdateTaskPriorityReq() when priority != null:
return priority(_that);case _UpdateTaskDueDateReq() when dueDate != null:
return dueDate(_that);case _UpdateTaskReminderReq() when reminder != null:
return reminder(_that);case _UpdateTaskDescriptionReq() when description != null:
return description(_that);case _UpdateTaskCategoryIdReq() when categoryId != null:
return categoryId(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UpdateTaskTitleReq value)  title,required TResult Function( _UpdateTaskStatusReq value)  status,required TResult Function( _UpdateTaskPriorityReq value)  priority,required TResult Function( _UpdateTaskDueDateReq value)  dueDate,required TResult Function( _UpdateTaskReminderReq value)  reminder,required TResult Function( _UpdateTaskDescriptionReq value)  description,required TResult Function( _UpdateTaskCategoryIdReq value)  categoryId,}){
final _that = this;
switch (_that) {
case _UpdateTaskTitleReq():
return title(_that);case _UpdateTaskStatusReq():
return status(_that);case _UpdateTaskPriorityReq():
return priority(_that);case _UpdateTaskDueDateReq():
return dueDate(_that);case _UpdateTaskReminderReq():
return reminder(_that);case _UpdateTaskDescriptionReq():
return description(_that);case _UpdateTaskCategoryIdReq():
return categoryId(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UpdateTaskTitleReq value)?  title,TResult? Function( _UpdateTaskStatusReq value)?  status,TResult? Function( _UpdateTaskPriorityReq value)?  priority,TResult? Function( _UpdateTaskDueDateReq value)?  dueDate,TResult? Function( _UpdateTaskReminderReq value)?  reminder,TResult? Function( _UpdateTaskDescriptionReq value)?  description,TResult? Function( _UpdateTaskCategoryIdReq value)?  categoryId,}){
final _that = this;
switch (_that) {
case _UpdateTaskTitleReq() when title != null:
return title(_that);case _UpdateTaskStatusReq() when status != null:
return status(_that);case _UpdateTaskPriorityReq() when priority != null:
return priority(_that);case _UpdateTaskDueDateReq() when dueDate != null:
return dueDate(_that);case _UpdateTaskReminderReq() when reminder != null:
return reminder(_that);case _UpdateTaskDescriptionReq() when description != null:
return description(_that);case _UpdateTaskCategoryIdReq() when categoryId != null:
return categoryId(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int localId,  String title)?  title,TResult Function( int localId,  String status,  DateTime? completedAt)?  status,TResult Function( int localId,  String priority)?  priority,TResult Function( int localId,  DateTime? dueDate,  String status,  bool hasTime,  DateTime? completedAt)?  dueDate,TResult Function( int localId,  DateTime? reminderAt,  int? reminderOffset,  String reminderType,  String repeatType)?  reminder,TResult Function( int localId,  String description)?  description,TResult Function( int localId,  String categoryId)?  categoryId,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateTaskTitleReq() when title != null:
return title(_that.localId,_that.title);case _UpdateTaskStatusReq() when status != null:
return status(_that.localId,_that.status,_that.completedAt);case _UpdateTaskPriorityReq() when priority != null:
return priority(_that.localId,_that.priority);case _UpdateTaskDueDateReq() when dueDate != null:
return dueDate(_that.localId,_that.dueDate,_that.status,_that.hasTime,_that.completedAt);case _UpdateTaskReminderReq() when reminder != null:
return reminder(_that.localId,_that.reminderAt,_that.reminderOffset,_that.reminderType,_that.repeatType);case _UpdateTaskDescriptionReq() when description != null:
return description(_that.localId,_that.description);case _UpdateTaskCategoryIdReq() when categoryId != null:
return categoryId(_that.localId,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int localId,  String title)  title,required TResult Function( int localId,  String status,  DateTime? completedAt)  status,required TResult Function( int localId,  String priority)  priority,required TResult Function( int localId,  DateTime? dueDate,  String status,  bool hasTime,  DateTime? completedAt)  dueDate,required TResult Function( int localId,  DateTime? reminderAt,  int? reminderOffset,  String reminderType,  String repeatType)  reminder,required TResult Function( int localId,  String description)  description,required TResult Function( int localId,  String categoryId)  categoryId,}) {final _that = this;
switch (_that) {
case _UpdateTaskTitleReq():
return title(_that.localId,_that.title);case _UpdateTaskStatusReq():
return status(_that.localId,_that.status,_that.completedAt);case _UpdateTaskPriorityReq():
return priority(_that.localId,_that.priority);case _UpdateTaskDueDateReq():
return dueDate(_that.localId,_that.dueDate,_that.status,_that.hasTime,_that.completedAt);case _UpdateTaskReminderReq():
return reminder(_that.localId,_that.reminderAt,_that.reminderOffset,_that.reminderType,_that.repeatType);case _UpdateTaskDescriptionReq():
return description(_that.localId,_that.description);case _UpdateTaskCategoryIdReq():
return categoryId(_that.localId,_that.categoryId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int localId,  String title)?  title,TResult? Function( int localId,  String status,  DateTime? completedAt)?  status,TResult? Function( int localId,  String priority)?  priority,TResult? Function( int localId,  DateTime? dueDate,  String status,  bool hasTime,  DateTime? completedAt)?  dueDate,TResult? Function( int localId,  DateTime? reminderAt,  int? reminderOffset,  String reminderType,  String repeatType)?  reminder,TResult? Function( int localId,  String description)?  description,TResult? Function( int localId,  String categoryId)?  categoryId,}) {final _that = this;
switch (_that) {
case _UpdateTaskTitleReq() when title != null:
return title(_that.localId,_that.title);case _UpdateTaskStatusReq() when status != null:
return status(_that.localId,_that.status,_that.completedAt);case _UpdateTaskPriorityReq() when priority != null:
return priority(_that.localId,_that.priority);case _UpdateTaskDueDateReq() when dueDate != null:
return dueDate(_that.localId,_that.dueDate,_that.status,_that.hasTime,_that.completedAt);case _UpdateTaskReminderReq() when reminder != null:
return reminder(_that.localId,_that.reminderAt,_that.reminderOffset,_that.reminderType,_that.repeatType);case _UpdateTaskDescriptionReq() when description != null:
return description(_that.localId,_that.description);case _UpdateTaskCategoryIdReq() when categoryId != null:
return categoryId(_that.localId,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateTaskTitleReq implements UpdateTaskReq {
  const _UpdateTaskTitleReq({required this.localId, required this.title, final  String? $type}): $type = $type ?? 'title';
  factory _UpdateTaskTitleReq.fromJson(Map<String, dynamic> json) => _$UpdateTaskTitleReqFromJson(json);

@override final  int localId;
 final  String title;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskTitleReqCopyWith<_UpdateTaskTitleReq> get copyWith => __$UpdateTaskTitleReqCopyWithImpl<_UpdateTaskTitleReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTaskTitleReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskTitleReq&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,title);

@override
String toString() {
  return 'UpdateTaskReq.title(localId: $localId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskTitleReqCopyWith<$Res> implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskTitleReqCopyWith(_UpdateTaskTitleReq value, $Res Function(_UpdateTaskTitleReq) _then) = __$UpdateTaskTitleReqCopyWithImpl;
@override @useResult
$Res call({
 int localId, String title
});




}
/// @nodoc
class __$UpdateTaskTitleReqCopyWithImpl<$Res>
    implements _$UpdateTaskTitleReqCopyWith<$Res> {
  __$UpdateTaskTitleReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskTitleReq _self;
  final $Res Function(_UpdateTaskTitleReq) _then;

/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? title = null,}) {
  return _then(_UpdateTaskTitleReq(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _UpdateTaskStatusReq implements UpdateTaskReq {
  const _UpdateTaskStatusReq({required this.localId, required this.status, this.completedAt, final  String? $type}): $type = $type ?? 'status';
  factory _UpdateTaskStatusReq.fromJson(Map<String, dynamic> json) => _$UpdateTaskStatusReqFromJson(json);

@override final  int localId;
 final  String status;
 final  DateTime? completedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskStatusReqCopyWith<_UpdateTaskStatusReq> get copyWith => __$UpdateTaskStatusReqCopyWithImpl<_UpdateTaskStatusReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTaskStatusReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskStatusReq&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.status, status) || other.status == status)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,status,completedAt);

@override
String toString() {
  return 'UpdateTaskReq.status(localId: $localId, status: $status, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskStatusReqCopyWith<$Res> implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskStatusReqCopyWith(_UpdateTaskStatusReq value, $Res Function(_UpdateTaskStatusReq) _then) = __$UpdateTaskStatusReqCopyWithImpl;
@override @useResult
$Res call({
 int localId, String status, DateTime? completedAt
});




}
/// @nodoc
class __$UpdateTaskStatusReqCopyWithImpl<$Res>
    implements _$UpdateTaskStatusReqCopyWith<$Res> {
  __$UpdateTaskStatusReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskStatusReq _self;
  final $Res Function(_UpdateTaskStatusReq) _then;

/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? status = null,Object? completedAt = freezed,}) {
  return _then(_UpdateTaskStatusReq(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _UpdateTaskPriorityReq implements UpdateTaskReq {
  const _UpdateTaskPriorityReq({required this.localId, required this.priority, final  String? $type}): $type = $type ?? 'priority';
  factory _UpdateTaskPriorityReq.fromJson(Map<String, dynamic> json) => _$UpdateTaskPriorityReqFromJson(json);

@override final  int localId;
 final  String priority;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskPriorityReqCopyWith<_UpdateTaskPriorityReq> get copyWith => __$UpdateTaskPriorityReqCopyWithImpl<_UpdateTaskPriorityReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTaskPriorityReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskPriorityReq&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.priority, priority) || other.priority == priority));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,priority);

@override
String toString() {
  return 'UpdateTaskReq.priority(localId: $localId, priority: $priority)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskPriorityReqCopyWith<$Res> implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskPriorityReqCopyWith(_UpdateTaskPriorityReq value, $Res Function(_UpdateTaskPriorityReq) _then) = __$UpdateTaskPriorityReqCopyWithImpl;
@override @useResult
$Res call({
 int localId, String priority
});




}
/// @nodoc
class __$UpdateTaskPriorityReqCopyWithImpl<$Res>
    implements _$UpdateTaskPriorityReqCopyWith<$Res> {
  __$UpdateTaskPriorityReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskPriorityReq _self;
  final $Res Function(_UpdateTaskPriorityReq) _then;

/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? priority = null,}) {
  return _then(_UpdateTaskPriorityReq(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _UpdateTaskDueDateReq implements UpdateTaskReq {
  const _UpdateTaskDueDateReq({required this.localId, this.dueDate, required this.status, required this.hasTime, this.completedAt, final  String? $type}): $type = $type ?? 'dueDate';
  factory _UpdateTaskDueDateReq.fromJson(Map<String, dynamic> json) => _$UpdateTaskDueDateReqFromJson(json);

@override final  int localId;
 final  DateTime? dueDate;
 final  String status;
 final  bool hasTime;
 final  DateTime? completedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskDueDateReqCopyWith<_UpdateTaskDueDateReq> get copyWith => __$UpdateTaskDueDateReqCopyWithImpl<_UpdateTaskDueDateReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTaskDueDateReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskDueDateReq&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,dueDate,status,hasTime,completedAt);

@override
String toString() {
  return 'UpdateTaskReq.dueDate(localId: $localId, dueDate: $dueDate, status: $status, hasTime: $hasTime, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskDueDateReqCopyWith<$Res> implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskDueDateReqCopyWith(_UpdateTaskDueDateReq value, $Res Function(_UpdateTaskDueDateReq) _then) = __$UpdateTaskDueDateReqCopyWithImpl;
@override @useResult
$Res call({
 int localId, DateTime? dueDate, String status, bool hasTime, DateTime? completedAt
});




}
/// @nodoc
class __$UpdateTaskDueDateReqCopyWithImpl<$Res>
    implements _$UpdateTaskDueDateReqCopyWith<$Res> {
  __$UpdateTaskDueDateReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskDueDateReq _self;
  final $Res Function(_UpdateTaskDueDateReq) _then;

/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? dueDate = freezed,Object? status = null,Object? hasTime = null,Object? completedAt = freezed,}) {
  return _then(_UpdateTaskDueDateReq(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _UpdateTaskReminderReq implements UpdateTaskReq {
  const _UpdateTaskReminderReq({required this.localId, this.reminderAt, this.reminderOffset, required this.reminderType, required this.repeatType, final  String? $type}): $type = $type ?? 'reminder';
  factory _UpdateTaskReminderReq.fromJson(Map<String, dynamic> json) => _$UpdateTaskReminderReqFromJson(json);

@override final  int localId;
 final  DateTime? reminderAt;
 final  int? reminderOffset;
 final  String reminderType;
 final  String repeatType;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskReminderReqCopyWith<_UpdateTaskReminderReq> get copyWith => __$UpdateTaskReminderReqCopyWithImpl<_UpdateTaskReminderReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTaskReminderReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskReminderReq&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.reminderAt, reminderAt) || other.reminderAt == reminderAt)&&(identical(other.reminderOffset, reminderOffset) || other.reminderOffset == reminderOffset)&&(identical(other.reminderType, reminderType) || other.reminderType == reminderType)&&(identical(other.repeatType, repeatType) || other.repeatType == repeatType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,reminderAt,reminderOffset,reminderType,repeatType);

@override
String toString() {
  return 'UpdateTaskReq.reminder(localId: $localId, reminderAt: $reminderAt, reminderOffset: $reminderOffset, reminderType: $reminderType, repeatType: $repeatType)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskReminderReqCopyWith<$Res> implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskReminderReqCopyWith(_UpdateTaskReminderReq value, $Res Function(_UpdateTaskReminderReq) _then) = __$UpdateTaskReminderReqCopyWithImpl;
@override @useResult
$Res call({
 int localId, DateTime? reminderAt, int? reminderOffset, String reminderType, String repeatType
});




}
/// @nodoc
class __$UpdateTaskReminderReqCopyWithImpl<$Res>
    implements _$UpdateTaskReminderReqCopyWith<$Res> {
  __$UpdateTaskReminderReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskReminderReq _self;
  final $Res Function(_UpdateTaskReminderReq) _then;

/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? reminderAt = freezed,Object? reminderOffset = freezed,Object? reminderType = null,Object? repeatType = null,}) {
  return _then(_UpdateTaskReminderReq(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,reminderAt: freezed == reminderAt ? _self.reminderAt : reminderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reminderOffset: freezed == reminderOffset ? _self.reminderOffset : reminderOffset // ignore: cast_nullable_to_non_nullable
as int?,reminderType: null == reminderType ? _self.reminderType : reminderType // ignore: cast_nullable_to_non_nullable
as String,repeatType: null == repeatType ? _self.repeatType : repeatType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _UpdateTaskDescriptionReq implements UpdateTaskReq {
  const _UpdateTaskDescriptionReq({required this.localId, required this.description, final  String? $type}): $type = $type ?? 'description';
  factory _UpdateTaskDescriptionReq.fromJson(Map<String, dynamic> json) => _$UpdateTaskDescriptionReqFromJson(json);

@override final  int localId;
 final  String description;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskDescriptionReqCopyWith<_UpdateTaskDescriptionReq> get copyWith => __$UpdateTaskDescriptionReqCopyWithImpl<_UpdateTaskDescriptionReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTaskDescriptionReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskDescriptionReq&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,description);

@override
String toString() {
  return 'UpdateTaskReq.description(localId: $localId, description: $description)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskDescriptionReqCopyWith<$Res> implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskDescriptionReqCopyWith(_UpdateTaskDescriptionReq value, $Res Function(_UpdateTaskDescriptionReq) _then) = __$UpdateTaskDescriptionReqCopyWithImpl;
@override @useResult
$Res call({
 int localId, String description
});




}
/// @nodoc
class __$UpdateTaskDescriptionReqCopyWithImpl<$Res>
    implements _$UpdateTaskDescriptionReqCopyWith<$Res> {
  __$UpdateTaskDescriptionReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskDescriptionReq _self;
  final $Res Function(_UpdateTaskDescriptionReq) _then;

/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? description = null,}) {
  return _then(_UpdateTaskDescriptionReq(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _UpdateTaskCategoryIdReq implements UpdateTaskReq {
  const _UpdateTaskCategoryIdReq({required this.localId, required this.categoryId, final  String? $type}): $type = $type ?? 'categoryId';
  factory _UpdateTaskCategoryIdReq.fromJson(Map<String, dynamic> json) => _$UpdateTaskCategoryIdReqFromJson(json);

@override final  int localId;
 final  String categoryId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskCategoryIdReqCopyWith<_UpdateTaskCategoryIdReq> get copyWith => __$UpdateTaskCategoryIdReqCopyWithImpl<_UpdateTaskCategoryIdReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTaskCategoryIdReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskCategoryIdReq&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,categoryId);

@override
String toString() {
  return 'UpdateTaskReq.categoryId(localId: $localId, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskCategoryIdReqCopyWith<$Res> implements $UpdateTaskReqCopyWith<$Res> {
  factory _$UpdateTaskCategoryIdReqCopyWith(_UpdateTaskCategoryIdReq value, $Res Function(_UpdateTaskCategoryIdReq) _then) = __$UpdateTaskCategoryIdReqCopyWithImpl;
@override @useResult
$Res call({
 int localId, String categoryId
});




}
/// @nodoc
class __$UpdateTaskCategoryIdReqCopyWithImpl<$Res>
    implements _$UpdateTaskCategoryIdReqCopyWith<$Res> {
  __$UpdateTaskCategoryIdReqCopyWithImpl(this._self, this._then);

  final _UpdateTaskCategoryIdReq _self;
  final $Res Function(_UpdateTaskCategoryIdReq) _then;

/// Create a copy of UpdateTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? categoryId = null,}) {
  return _then(_UpdateTaskCategoryIdReq(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

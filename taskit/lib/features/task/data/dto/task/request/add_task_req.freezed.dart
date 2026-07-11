// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddTaskReq {

 String get title; int get localId; String get description; String? get categoryId; String get reminderType; int? get reminderOffset; String get repeatType; DateTime? get reminderAt; String get priority; DateTime? get dueDate; bool get hasTime; String get status; List<AddSubtaskReq> get subtasks;
/// Create a copy of AddTaskReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTaskReqCopyWith<AddTaskReq> get copyWith => _$AddTaskReqCopyWithImpl<AddTaskReq>(this as AddTaskReq, _$identity);

  /// Serializes this AddTaskReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTaskReq&&(identical(other.title, title) || other.title == title)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.reminderType, reminderType) || other.reminderType == reminderType)&&(identical(other.reminderOffset, reminderOffset) || other.reminderOffset == reminderOffset)&&(identical(other.repeatType, repeatType) || other.repeatType == repeatType)&&(identical(other.reminderAt, reminderAt) || other.reminderAt == reminderAt)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.subtasks, subtasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,localId,description,categoryId,reminderType,reminderOffset,repeatType,reminderAt,priority,dueDate,hasTime,status,const DeepCollectionEquality().hash(subtasks));

@override
String toString() {
  return 'AddTaskReq(title: $title, localId: $localId, description: $description, categoryId: $categoryId, reminderType: $reminderType, reminderOffset: $reminderOffset, repeatType: $repeatType, reminderAt: $reminderAt, priority: $priority, dueDate: $dueDate, hasTime: $hasTime, status: $status, subtasks: $subtasks)';
}


}

/// @nodoc
abstract mixin class $AddTaskReqCopyWith<$Res>  {
  factory $AddTaskReqCopyWith(AddTaskReq value, $Res Function(AddTaskReq) _then) = _$AddTaskReqCopyWithImpl;
@useResult
$Res call({
 String title, int localId, String description, String? categoryId, String reminderType, int? reminderOffset, String repeatType, DateTime? reminderAt, String priority, DateTime? dueDate, bool hasTime, String status, List<AddSubtaskReq> subtasks
});




}
/// @nodoc
class _$AddTaskReqCopyWithImpl<$Res>
    implements $AddTaskReqCopyWith<$Res> {
  _$AddTaskReqCopyWithImpl(this._self, this._then);

  final AddTaskReq _self;
  final $Res Function(AddTaskReq) _then;

/// Create a copy of AddTaskReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? localId = null,Object? description = null,Object? categoryId = freezed,Object? reminderType = null,Object? reminderOffset = freezed,Object? repeatType = null,Object? reminderAt = freezed,Object? priority = null,Object? dueDate = freezed,Object? hasTime = null,Object? status = null,Object? subtasks = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,reminderType: null == reminderType ? _self.reminderType : reminderType // ignore: cast_nullable_to_non_nullable
as String,reminderOffset: freezed == reminderOffset ? _self.reminderOffset : reminderOffset // ignore: cast_nullable_to_non_nullable
as int?,repeatType: null == repeatType ? _self.repeatType : repeatType // ignore: cast_nullable_to_non_nullable
as String,reminderAt: freezed == reminderAt ? _self.reminderAt : reminderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtasks: null == subtasks ? _self.subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<AddSubtaskReq>,
  ));
}

}


/// Adds pattern-matching-related methods to [AddTaskReq].
extension AddTaskReqPatterns on AddTaskReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddTaskReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddTaskReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddTaskReq value)  $default,){
final _that = this;
switch (_that) {
case _AddTaskReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddTaskReq value)?  $default,){
final _that = this;
switch (_that) {
case _AddTaskReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  int localId,  String description,  String? categoryId,  String reminderType,  int? reminderOffset,  String repeatType,  DateTime? reminderAt,  String priority,  DateTime? dueDate,  bool hasTime,  String status,  List<AddSubtaskReq> subtasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddTaskReq() when $default != null:
return $default(_that.title,_that.localId,_that.description,_that.categoryId,_that.reminderType,_that.reminderOffset,_that.repeatType,_that.reminderAt,_that.priority,_that.dueDate,_that.hasTime,_that.status,_that.subtasks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  int localId,  String description,  String? categoryId,  String reminderType,  int? reminderOffset,  String repeatType,  DateTime? reminderAt,  String priority,  DateTime? dueDate,  bool hasTime,  String status,  List<AddSubtaskReq> subtasks)  $default,) {final _that = this;
switch (_that) {
case _AddTaskReq():
return $default(_that.title,_that.localId,_that.description,_that.categoryId,_that.reminderType,_that.reminderOffset,_that.repeatType,_that.reminderAt,_that.priority,_that.dueDate,_that.hasTime,_that.status,_that.subtasks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  int localId,  String description,  String? categoryId,  String reminderType,  int? reminderOffset,  String repeatType,  DateTime? reminderAt,  String priority,  DateTime? dueDate,  bool hasTime,  String status,  List<AddSubtaskReq> subtasks)?  $default,) {final _that = this;
switch (_that) {
case _AddTaskReq() when $default != null:
return $default(_that.title,_that.localId,_that.description,_that.categoryId,_that.reminderType,_that.reminderOffset,_that.repeatType,_that.reminderAt,_that.priority,_that.dueDate,_that.hasTime,_that.status,_that.subtasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddTaskReq implements AddTaskReq {
  const _AddTaskReq({required this.title, required this.localId, required this.description, this.categoryId, required this.reminderType, this.reminderOffset, required this.repeatType, this.reminderAt, required this.priority, this.dueDate, required this.hasTime, required this.status, required final  List<AddSubtaskReq> subtasks}): _subtasks = subtasks;
  factory _AddTaskReq.fromJson(Map<String, dynamic> json) => _$AddTaskReqFromJson(json);

@override final  String title;
@override final  int localId;
@override final  String description;
@override final  String? categoryId;
@override final  String reminderType;
@override final  int? reminderOffset;
@override final  String repeatType;
@override final  DateTime? reminderAt;
@override final  String priority;
@override final  DateTime? dueDate;
@override final  bool hasTime;
@override final  String status;
 final  List<AddSubtaskReq> _subtasks;
@override List<AddSubtaskReq> get subtasks {
  if (_subtasks is EqualUnmodifiableListView) return _subtasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtasks);
}


/// Create a copy of AddTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTaskReqCopyWith<_AddTaskReq> get copyWith => __$AddTaskReqCopyWithImpl<_AddTaskReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddTaskReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTaskReq&&(identical(other.title, title) || other.title == title)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.reminderType, reminderType) || other.reminderType == reminderType)&&(identical(other.reminderOffset, reminderOffset) || other.reminderOffset == reminderOffset)&&(identical(other.repeatType, repeatType) || other.repeatType == repeatType)&&(identical(other.reminderAt, reminderAt) || other.reminderAt == reminderAt)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._subtasks, _subtasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,localId,description,categoryId,reminderType,reminderOffset,repeatType,reminderAt,priority,dueDate,hasTime,status,const DeepCollectionEquality().hash(_subtasks));

@override
String toString() {
  return 'AddTaskReq(title: $title, localId: $localId, description: $description, categoryId: $categoryId, reminderType: $reminderType, reminderOffset: $reminderOffset, repeatType: $repeatType, reminderAt: $reminderAt, priority: $priority, dueDate: $dueDate, hasTime: $hasTime, status: $status, subtasks: $subtasks)';
}


}

/// @nodoc
abstract mixin class _$AddTaskReqCopyWith<$Res> implements $AddTaskReqCopyWith<$Res> {
  factory _$AddTaskReqCopyWith(_AddTaskReq value, $Res Function(_AddTaskReq) _then) = __$AddTaskReqCopyWithImpl;
@override @useResult
$Res call({
 String title, int localId, String description, String? categoryId, String reminderType, int? reminderOffset, String repeatType, DateTime? reminderAt, String priority, DateTime? dueDate, bool hasTime, String status, List<AddSubtaskReq> subtasks
});




}
/// @nodoc
class __$AddTaskReqCopyWithImpl<$Res>
    implements _$AddTaskReqCopyWith<$Res> {
  __$AddTaskReqCopyWithImpl(this._self, this._then);

  final _AddTaskReq _self;
  final $Res Function(_AddTaskReq) _then;

/// Create a copy of AddTaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? localId = null,Object? description = null,Object? categoryId = freezed,Object? reminderType = null,Object? reminderOffset = freezed,Object? repeatType = null,Object? reminderAt = freezed,Object? priority = null,Object? dueDate = freezed,Object? hasTime = null,Object? status = null,Object? subtasks = null,}) {
  return _then(_AddTaskReq(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,reminderType: null == reminderType ? _self.reminderType : reminderType // ignore: cast_nullable_to_non_nullable
as String,reminderOffset: freezed == reminderOffset ? _self.reminderOffset : reminderOffset // ignore: cast_nullable_to_non_nullable
as int?,repeatType: null == repeatType ? _self.repeatType : repeatType // ignore: cast_nullable_to_non_nullable
as String,reminderAt: freezed == reminderAt ? _self.reminderAt : reminderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtasks: null == subtasks ? _self._subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<AddSubtaskReq>,
  ));
}


}

// dart format on

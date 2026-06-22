// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_task_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateTaskRes {

 int get localId; String get id; String get userId; String get categoryId; String get title; String get description; String get priority; bool get deleted; String get status; DateTime? get dueDate; DateTime? get completedAt; bool get hasTime; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of UpdateTaskRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTaskResCopyWith<UpdateTaskRes> get copyWith => _$UpdateTaskResCopyWithImpl<UpdateTaskRes>(this as UpdateTaskRes, _$identity);

  /// Serializes this UpdateTaskRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTaskRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,userId,categoryId,title,description,priority,deleted,status,dueDate,completedAt,hasTime,createdAt,updatedAt);

@override
String toString() {
  return 'UpdateTaskRes(localId: $localId, id: $id, userId: $userId, categoryId: $categoryId, title: $title, description: $description, priority: $priority, deleted: $deleted, status: $status, dueDate: $dueDate, completedAt: $completedAt, hasTime: $hasTime, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UpdateTaskResCopyWith<$Res>  {
  factory $UpdateTaskResCopyWith(UpdateTaskRes value, $Res Function(UpdateTaskRes) _then) = _$UpdateTaskResCopyWithImpl;
@useResult
$Res call({
 int localId, String id, String userId, String categoryId, String title, String description, String priority, bool deleted, String status, DateTime? dueDate, DateTime? completedAt, bool hasTime, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$UpdateTaskResCopyWithImpl<$Res>
    implements $UpdateTaskResCopyWith<$Res> {
  _$UpdateTaskResCopyWithImpl(this._self, this._then);

  final UpdateTaskRes _self;
  final $Res Function(UpdateTaskRes) _then;

/// Create a copy of UpdateTaskRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? id = null,Object? userId = null,Object? categoryId = null,Object? title = null,Object? description = null,Object? priority = null,Object? deleted = null,Object? status = null,Object? dueDate = freezed,Object? completedAt = freezed,Object? hasTime = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateTaskRes].
extension UpdateTaskResPatterns on UpdateTaskRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateTaskRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateTaskRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateTaskRes value)  $default,){
final _that = this;
switch (_that) {
case _UpdateTaskRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateTaskRes value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateTaskRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int localId,  String id,  String userId,  String categoryId,  String title,  String description,  String priority,  bool deleted,  String status,  DateTime? dueDate,  DateTime? completedAt,  bool hasTime,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateTaskRes() when $default != null:
return $default(_that.localId,_that.id,_that.userId,_that.categoryId,_that.title,_that.description,_that.priority,_that.deleted,_that.status,_that.dueDate,_that.completedAt,_that.hasTime,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int localId,  String id,  String userId,  String categoryId,  String title,  String description,  String priority,  bool deleted,  String status,  DateTime? dueDate,  DateTime? completedAt,  bool hasTime,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UpdateTaskRes():
return $default(_that.localId,_that.id,_that.userId,_that.categoryId,_that.title,_that.description,_that.priority,_that.deleted,_that.status,_that.dueDate,_that.completedAt,_that.hasTime,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int localId,  String id,  String userId,  String categoryId,  String title,  String description,  String priority,  bool deleted,  String status,  DateTime? dueDate,  DateTime? completedAt,  bool hasTime,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UpdateTaskRes() when $default != null:
return $default(_that.localId,_that.id,_that.userId,_that.categoryId,_that.title,_that.description,_that.priority,_that.deleted,_that.status,_that.dueDate,_that.completedAt,_that.hasTime,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateTaskRes implements UpdateTaskRes {
  const _UpdateTaskRes({required this.localId, required this.id, required this.userId, required this.categoryId, required this.title, required this.description, required this.priority, required this.deleted, required this.status, this.dueDate, this.completedAt, required this.hasTime, required this.createdAt, required this.updatedAt});
  factory _UpdateTaskRes.fromJson(Map<String, dynamic> json) => _$UpdateTaskResFromJson(json);

@override final  int localId;
@override final  String id;
@override final  String userId;
@override final  String categoryId;
@override final  String title;
@override final  String description;
@override final  String priority;
@override final  bool deleted;
@override final  String status;
@override final  DateTime? dueDate;
@override final  DateTime? completedAt;
@override final  bool hasTime;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of UpdateTaskRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskResCopyWith<_UpdateTaskRes> get copyWith => __$UpdateTaskResCopyWithImpl<_UpdateTaskRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTaskResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskRes&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,userId,categoryId,title,description,priority,deleted,status,dueDate,completedAt,hasTime,createdAt,updatedAt);

@override
String toString() {
  return 'UpdateTaskRes(localId: $localId, id: $id, userId: $userId, categoryId: $categoryId, title: $title, description: $description, priority: $priority, deleted: $deleted, status: $status, dueDate: $dueDate, completedAt: $completedAt, hasTime: $hasTime, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskResCopyWith<$Res> implements $UpdateTaskResCopyWith<$Res> {
  factory _$UpdateTaskResCopyWith(_UpdateTaskRes value, $Res Function(_UpdateTaskRes) _then) = __$UpdateTaskResCopyWithImpl;
@override @useResult
$Res call({
 int localId, String id, String userId, String categoryId, String title, String description, String priority, bool deleted, String status, DateTime? dueDate, DateTime? completedAt, bool hasTime, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$UpdateTaskResCopyWithImpl<$Res>
    implements _$UpdateTaskResCopyWith<$Res> {
  __$UpdateTaskResCopyWithImpl(this._self, this._then);

  final _UpdateTaskRes _self;
  final $Res Function(_UpdateTaskRes) _then;

/// Create a copy of UpdateTaskRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? id = null,Object? userId = null,Object? categoryId = null,Object? title = null,Object? description = null,Object? priority = null,Object? deleted = null,Object? status = null,Object? dueDate = freezed,Object? completedAt = freezed,Object? hasTime = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UpdateTaskRes(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

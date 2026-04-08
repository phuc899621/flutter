// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiTaskEntity {

 String get title; String get description; DateTime? get userUtcDueDate; bool get hasTime; String get categoryId; String get priority; String get status;
/// Create a copy of AiTaskEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiTaskEntityCopyWith<AiTaskEntity> get copyWith => _$AiTaskEntityCopyWithImpl<AiTaskEntity>(this as AiTaskEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiTaskEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.userUtcDueDate, userUtcDueDate) || other.userUtcDueDate == userUtcDueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,userUtcDueDate,hasTime,categoryId,priority,status);

@override
String toString() {
  return 'AiTaskEntity(title: $title, description: $description, userUtcDueDate: $userUtcDueDate, hasTime: $hasTime, categoryId: $categoryId, priority: $priority, status: $status)';
}


}

/// @nodoc
abstract mixin class $AiTaskEntityCopyWith<$Res>  {
  factory $AiTaskEntityCopyWith(AiTaskEntity value, $Res Function(AiTaskEntity) _then) = _$AiTaskEntityCopyWithImpl;
@useResult
$Res call({
 String title, String description, DateTime? userUtcDueDate, bool hasTime, String categoryId, String priority, String status
});




}
/// @nodoc
class _$AiTaskEntityCopyWithImpl<$Res>
    implements $AiTaskEntityCopyWith<$Res> {
  _$AiTaskEntityCopyWithImpl(this._self, this._then);

  final AiTaskEntity _self;
  final $Res Function(AiTaskEntity) _then;

/// Create a copy of AiTaskEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? userUtcDueDate = freezed,Object? hasTime = null,Object? categoryId = null,Object? priority = null,Object? status = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,userUtcDueDate: freezed == userUtcDueDate ? _self.userUtcDueDate : userUtcDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AiTaskEntity].
extension AiTaskEntityPatterns on AiTaskEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiTaskEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiTaskEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiTaskEntity value)  $default,){
final _that = this;
switch (_that) {
case _AiTaskEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiTaskEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AiTaskEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  DateTime? userUtcDueDate,  bool hasTime,  String categoryId,  String priority,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiTaskEntity() when $default != null:
return $default(_that.title,_that.description,_that.userUtcDueDate,_that.hasTime,_that.categoryId,_that.priority,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  DateTime? userUtcDueDate,  bool hasTime,  String categoryId,  String priority,  String status)  $default,) {final _that = this;
switch (_that) {
case _AiTaskEntity():
return $default(_that.title,_that.description,_that.userUtcDueDate,_that.hasTime,_that.categoryId,_that.priority,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  DateTime? userUtcDueDate,  bool hasTime,  String categoryId,  String priority,  String status)?  $default,) {final _that = this;
switch (_that) {
case _AiTaskEntity() when $default != null:
return $default(_that.title,_that.description,_that.userUtcDueDate,_that.hasTime,_that.categoryId,_that.priority,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _AiTaskEntity implements AiTaskEntity {
  const _AiTaskEntity({required this.title, required this.description, this.userUtcDueDate, required this.hasTime, required this.categoryId, required this.priority, required this.status});
  

@override final  String title;
@override final  String description;
@override final  DateTime? userUtcDueDate;
@override final  bool hasTime;
@override final  String categoryId;
@override final  String priority;
@override final  String status;

/// Create a copy of AiTaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiTaskEntityCopyWith<_AiTaskEntity> get copyWith => __$AiTaskEntityCopyWithImpl<_AiTaskEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiTaskEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.userUtcDueDate, userUtcDueDate) || other.userUtcDueDate == userUtcDueDate)&&(identical(other.hasTime, hasTime) || other.hasTime == hasTime)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,userUtcDueDate,hasTime,categoryId,priority,status);

@override
String toString() {
  return 'AiTaskEntity(title: $title, description: $description, userUtcDueDate: $userUtcDueDate, hasTime: $hasTime, categoryId: $categoryId, priority: $priority, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AiTaskEntityCopyWith<$Res> implements $AiTaskEntityCopyWith<$Res> {
  factory _$AiTaskEntityCopyWith(_AiTaskEntity value, $Res Function(_AiTaskEntity) _then) = __$AiTaskEntityCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, DateTime? userUtcDueDate, bool hasTime, String categoryId, String priority, String status
});




}
/// @nodoc
class __$AiTaskEntityCopyWithImpl<$Res>
    implements _$AiTaskEntityCopyWith<$Res> {
  __$AiTaskEntityCopyWithImpl(this._self, this._then);

  final _AiTaskEntity _self;
  final $Res Function(_AiTaskEntity) _then;

/// Create a copy of AiTaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? userUtcDueDate = freezed,Object? hasTime = null,Object? categoryId = null,Object? priority = null,Object? status = null,}) {
  return _then(_AiTaskEntity(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,userUtcDueDate: freezed == userUtcDueDate ? _self.userUtcDueDate : userUtcDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasTime: null == hasTime ? _self.hasTime : hasTime // ignore: cast_nullable_to_non_nullable
as bool,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

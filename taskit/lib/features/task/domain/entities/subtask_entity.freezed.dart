// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtask_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubtaskEntity {

 int get localId; String get title; bool get isCompleted; DateTime? get completedAt; int get taskLocalId;
/// Create a copy of SubtaskEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubtaskEntityCopyWith<SubtaskEntity> get copyWith => _$SubtaskEntityCopyWithImpl<SubtaskEntity>(this as SubtaskEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubtaskEntity&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.taskLocalId, taskLocalId) || other.taskLocalId == taskLocalId));
}


@override
int get hashCode => Object.hash(runtimeType,localId,title,isCompleted,completedAt,taskLocalId);

@override
String toString() {
  return 'SubtaskEntity(localId: $localId, title: $title, isCompleted: $isCompleted, completedAt: $completedAt, taskLocalId: $taskLocalId)';
}


}

/// @nodoc
abstract mixin class $SubtaskEntityCopyWith<$Res>  {
  factory $SubtaskEntityCopyWith(SubtaskEntity value, $Res Function(SubtaskEntity) _then) = _$SubtaskEntityCopyWithImpl;
@useResult
$Res call({
 int localId, String title, bool isCompleted, DateTime? completedAt, int taskLocalId
});




}
/// @nodoc
class _$SubtaskEntityCopyWithImpl<$Res>
    implements $SubtaskEntityCopyWith<$Res> {
  _$SubtaskEntityCopyWithImpl(this._self, this._then);

  final SubtaskEntity _self;
  final $Res Function(SubtaskEntity) _then;

/// Create a copy of SubtaskEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? title = null,Object? isCompleted = null,Object? completedAt = freezed,Object? taskLocalId = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,taskLocalId: null == taskLocalId ? _self.taskLocalId : taskLocalId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SubtaskEntity].
extension SubtaskEntityPatterns on SubtaskEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubtaskEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubtaskEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubtaskEntity value)  $default,){
final _that = this;
switch (_that) {
case _SubtaskEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubtaskEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SubtaskEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int localId,  String title,  bool isCompleted,  DateTime? completedAt,  int taskLocalId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubtaskEntity() when $default != null:
return $default(_that.localId,_that.title,_that.isCompleted,_that.completedAt,_that.taskLocalId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int localId,  String title,  bool isCompleted,  DateTime? completedAt,  int taskLocalId)  $default,) {final _that = this;
switch (_that) {
case _SubtaskEntity():
return $default(_that.localId,_that.title,_that.isCompleted,_that.completedAt,_that.taskLocalId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int localId,  String title,  bool isCompleted,  DateTime? completedAt,  int taskLocalId)?  $default,) {final _that = this;
switch (_that) {
case _SubtaskEntity() when $default != null:
return $default(_that.localId,_that.title,_that.isCompleted,_that.completedAt,_that.taskLocalId);case _:
  return null;

}
}

}

/// @nodoc


class _SubtaskEntity implements SubtaskEntity {
   _SubtaskEntity({required this.localId, required this.title, required this.isCompleted, this.completedAt, required this.taskLocalId});
  

@override final  int localId;
@override final  String title;
@override final  bool isCompleted;
@override final  DateTime? completedAt;
@override final  int taskLocalId;

/// Create a copy of SubtaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubtaskEntityCopyWith<_SubtaskEntity> get copyWith => __$SubtaskEntityCopyWithImpl<_SubtaskEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubtaskEntity&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.taskLocalId, taskLocalId) || other.taskLocalId == taskLocalId));
}


@override
int get hashCode => Object.hash(runtimeType,localId,title,isCompleted,completedAt,taskLocalId);

@override
String toString() {
  return 'SubtaskEntity(localId: $localId, title: $title, isCompleted: $isCompleted, completedAt: $completedAt, taskLocalId: $taskLocalId)';
}


}

/// @nodoc
abstract mixin class _$SubtaskEntityCopyWith<$Res> implements $SubtaskEntityCopyWith<$Res> {
  factory _$SubtaskEntityCopyWith(_SubtaskEntity value, $Res Function(_SubtaskEntity) _then) = __$SubtaskEntityCopyWithImpl;
@override @useResult
$Res call({
 int localId, String title, bool isCompleted, DateTime? completedAt, int taskLocalId
});




}
/// @nodoc
class __$SubtaskEntityCopyWithImpl<$Res>
    implements _$SubtaskEntityCopyWith<$Res> {
  __$SubtaskEntityCopyWithImpl(this._self, this._then);

  final _SubtaskEntity _self;
  final $Res Function(_SubtaskEntity) _then;

/// Create a copy of SubtaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? title = null,Object? isCompleted = null,Object? completedAt = freezed,Object? taskLocalId = null,}) {
  return _then(_SubtaskEntity(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,taskLocalId: null == taskLocalId ? _self.taskLocalId : taskLocalId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

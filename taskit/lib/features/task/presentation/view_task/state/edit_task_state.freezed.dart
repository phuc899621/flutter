// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewTaskState {

 TaskEntity? get task; List<CategoryEntity> get categories;
/// Create a copy of ViewTaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewTaskStateCopyWith<ViewTaskState> get copyWith => _$ViewTaskStateCopyWithImpl<ViewTaskState>(this as ViewTaskState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewTaskState&&(identical(other.task, task) || other.task == task)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,task,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ViewTaskState(task: $task, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ViewTaskStateCopyWith<$Res>  {
  factory $ViewTaskStateCopyWith(ViewTaskState value, $Res Function(ViewTaskState) _then) = _$ViewTaskStateCopyWithImpl;
@useResult
$Res call({
 TaskEntity? task, List<CategoryEntity> categories
});


$TaskEntityCopyWith<$Res>? get task;

}
/// @nodoc
class _$ViewTaskStateCopyWithImpl<$Res>
    implements $ViewTaskStateCopyWith<$Res> {
  _$ViewTaskStateCopyWithImpl(this._self, this._then);

  final ViewTaskState _self;
  final $Res Function(ViewTaskState) _then;

/// Create a copy of ViewTaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? task = freezed,Object? categories = null,}) {
  return _then(_self.copyWith(
task: freezed == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,
  ));
}
/// Create a copy of ViewTaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<$Res>? get task {
    if (_self.task == null) {
    return null;
  }

  return $TaskEntityCopyWith<$Res>(_self.task!, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}


/// Adds pattern-matching-related methods to [ViewTaskState].
extension ViewTaskStatePatterns on ViewTaskState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditTaskState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditTaskState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditTaskState value)  $default,){
final _that = this;
switch (_that) {
case _EditTaskState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditTaskState value)?  $default,){
final _that = this;
switch (_that) {
case _EditTaskState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TaskEntity? task,  List<CategoryEntity> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditTaskState() when $default != null:
return $default(_that.task,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TaskEntity? task,  List<CategoryEntity> categories)  $default,) {final _that = this;
switch (_that) {
case _EditTaskState():
return $default(_that.task,_that.categories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TaskEntity? task,  List<CategoryEntity> categories)?  $default,) {final _that = this;
switch (_that) {
case _EditTaskState() when $default != null:
return $default(_that.task,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _EditTaskState implements ViewTaskState {
   _EditTaskState({this.task, final  List<CategoryEntity> categories = const []}): _categories = categories;
  

@override final  TaskEntity? task;
 final  List<CategoryEntity> _categories;
@override@JsonKey() List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of ViewTaskState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditTaskStateCopyWith<_EditTaskState> get copyWith => __$EditTaskStateCopyWithImpl<_EditTaskState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditTaskState&&(identical(other.task, task) || other.task == task)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,task,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'ViewTaskState(task: $task, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$EditTaskStateCopyWith<$Res> implements $ViewTaskStateCopyWith<$Res> {
  factory _$EditTaskStateCopyWith(_EditTaskState value, $Res Function(_EditTaskState) _then) = __$EditTaskStateCopyWithImpl;
@override @useResult
$Res call({
 TaskEntity? task, List<CategoryEntity> categories
});


@override $TaskEntityCopyWith<$Res>? get task;

}
/// @nodoc
class __$EditTaskStateCopyWithImpl<$Res>
    implements _$EditTaskStateCopyWith<$Res> {
  __$EditTaskStateCopyWithImpl(this._self, this._then);

  final _EditTaskState _self;
  final $Res Function(_EditTaskState) _then;

/// Create a copy of ViewTaskState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? task = freezed,Object? categories = null,}) {
  return _then(_EditTaskState(
task: freezed == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,
  ));
}

/// Create a copy of ViewTaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<$Res>? get task {
    if (_self.task == null) {
    return null;
  }

  return $TaskEntityCopyWith<$Res>(_self.task!, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

// dart format on

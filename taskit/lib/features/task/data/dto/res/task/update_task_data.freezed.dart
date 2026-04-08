// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_task_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateTaskData {

 int get localId; List<int> get subtasks;
/// Create a copy of UpdateTaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTaskDataCopyWith<UpdateTaskData> get copyWith => _$UpdateTaskDataCopyWithImpl<UpdateTaskData>(this as UpdateTaskData, _$identity);

  /// Serializes this UpdateTaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTaskData&&(identical(other.localId, localId) || other.localId == localId)&&const DeepCollectionEquality().equals(other.subtasks, subtasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,const DeepCollectionEquality().hash(subtasks));

@override
String toString() {
  return 'UpdateTaskData(localId: $localId, subtasks: $subtasks)';
}


}

/// @nodoc
abstract mixin class $UpdateTaskDataCopyWith<$Res>  {
  factory $UpdateTaskDataCopyWith(UpdateTaskData value, $Res Function(UpdateTaskData) _then) = _$UpdateTaskDataCopyWithImpl;
@useResult
$Res call({
 int localId, List<int> subtasks
});




}
/// @nodoc
class _$UpdateTaskDataCopyWithImpl<$Res>
    implements $UpdateTaskDataCopyWith<$Res> {
  _$UpdateTaskDataCopyWithImpl(this._self, this._then);

  final UpdateTaskData _self;
  final $Res Function(UpdateTaskData) _then;

/// Create a copy of UpdateTaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? subtasks = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,subtasks: null == subtasks ? _self.subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateTaskData].
extension UpdateTaskDataPatterns on UpdateTaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateTaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateTaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateTaskData value)  $default,){
final _that = this;
switch (_that) {
case _UpdateTaskData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateTaskData value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateTaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int localId,  List<int> subtasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateTaskData() when $default != null:
return $default(_that.localId,_that.subtasks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int localId,  List<int> subtasks)  $default,) {final _that = this;
switch (_that) {
case _UpdateTaskData():
return $default(_that.localId,_that.subtasks);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int localId,  List<int> subtasks)?  $default,) {final _that = this;
switch (_that) {
case _UpdateTaskData() when $default != null:
return $default(_that.localId,_that.subtasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateTaskData implements UpdateTaskData {
  const _UpdateTaskData({required this.localId, required final  List<int> subtasks}): _subtasks = subtasks;
  factory _UpdateTaskData.fromJson(Map<String, dynamic> json) => _$UpdateTaskDataFromJson(json);

@override final  int localId;
 final  List<int> _subtasks;
@override List<int> get subtasks {
  if (_subtasks is EqualUnmodifiableListView) return _subtasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtasks);
}


/// Create a copy of UpdateTaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskDataCopyWith<_UpdateTaskData> get copyWith => __$UpdateTaskDataCopyWithImpl<_UpdateTaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskData&&(identical(other.localId, localId) || other.localId == localId)&&const DeepCollectionEquality().equals(other._subtasks, _subtasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,const DeepCollectionEquality().hash(_subtasks));

@override
String toString() {
  return 'UpdateTaskData(localId: $localId, subtasks: $subtasks)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskDataCopyWith<$Res> implements $UpdateTaskDataCopyWith<$Res> {
  factory _$UpdateTaskDataCopyWith(_UpdateTaskData value, $Res Function(_UpdateTaskData) _then) = __$UpdateTaskDataCopyWithImpl;
@override @useResult
$Res call({
 int localId, List<int> subtasks
});




}
/// @nodoc
class __$UpdateTaskDataCopyWithImpl<$Res>
    implements _$UpdateTaskDataCopyWith<$Res> {
  __$UpdateTaskDataCopyWithImpl(this._self, this._then);

  final _UpdateTaskData _self;
  final $Res Function(_UpdateTaskData) _then;

/// Create a copy of UpdateTaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? subtasks = null,}) {
  return _then(_UpdateTaskData(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,subtasks: null == subtasks ? _self._subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on

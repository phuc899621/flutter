// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_subtask_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateSubtaskData {

 List<int> get subtasks;
/// Create a copy of UpdateSubtaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSubtaskDataCopyWith<UpdateSubtaskData> get copyWith => _$UpdateSubtaskDataCopyWithImpl<UpdateSubtaskData>(this as UpdateSubtaskData, _$identity);

  /// Serializes this UpdateSubtaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSubtaskData&&const DeepCollectionEquality().equals(other.subtasks, subtasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(subtasks));

@override
String toString() {
  return 'UpdateSubtaskData(subtasks: $subtasks)';
}


}

/// @nodoc
abstract mixin class $UpdateSubtaskDataCopyWith<$Res>  {
  factory $UpdateSubtaskDataCopyWith(UpdateSubtaskData value, $Res Function(UpdateSubtaskData) _then) = _$UpdateSubtaskDataCopyWithImpl;
@useResult
$Res call({
 List<int> subtasks
});




}
/// @nodoc
class _$UpdateSubtaskDataCopyWithImpl<$Res>
    implements $UpdateSubtaskDataCopyWith<$Res> {
  _$UpdateSubtaskDataCopyWithImpl(this._self, this._then);

  final UpdateSubtaskData _self;
  final $Res Function(UpdateSubtaskData) _then;

/// Create a copy of UpdateSubtaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtasks = null,}) {
  return _then(_self.copyWith(
subtasks: null == subtasks ? _self.subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateSubtaskData].
extension UpdateSubtaskDataPatterns on UpdateSubtaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateSubtaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateSubtaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateSubtaskData value)  $default,){
final _that = this;
switch (_that) {
case _UpdateSubtaskData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateSubtaskData value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateSubtaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> subtasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateSubtaskData() when $default != null:
return $default(_that.subtasks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> subtasks)  $default,) {final _that = this;
switch (_that) {
case _UpdateSubtaskData():
return $default(_that.subtasks);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> subtasks)?  $default,) {final _that = this;
switch (_that) {
case _UpdateSubtaskData() when $default != null:
return $default(_that.subtasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateSubtaskData implements UpdateSubtaskData {
  const _UpdateSubtaskData({required final  List<int> subtasks}): _subtasks = subtasks;
  factory _UpdateSubtaskData.fromJson(Map<String, dynamic> json) => _$UpdateSubtaskDataFromJson(json);

 final  List<int> _subtasks;
@override List<int> get subtasks {
  if (_subtasks is EqualUnmodifiableListView) return _subtasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtasks);
}


/// Create a copy of UpdateSubtaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSubtaskDataCopyWith<_UpdateSubtaskData> get copyWith => __$UpdateSubtaskDataCopyWithImpl<_UpdateSubtaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSubtaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSubtaskData&&const DeepCollectionEquality().equals(other._subtasks, _subtasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_subtasks));

@override
String toString() {
  return 'UpdateSubtaskData(subtasks: $subtasks)';
}


}

/// @nodoc
abstract mixin class _$UpdateSubtaskDataCopyWith<$Res> implements $UpdateSubtaskDataCopyWith<$Res> {
  factory _$UpdateSubtaskDataCopyWith(_UpdateSubtaskData value, $Res Function(_UpdateSubtaskData) _then) = __$UpdateSubtaskDataCopyWithImpl;
@override @useResult
$Res call({
 List<int> subtasks
});




}
/// @nodoc
class __$UpdateSubtaskDataCopyWithImpl<$Res>
    implements _$UpdateSubtaskDataCopyWith<$Res> {
  __$UpdateSubtaskDataCopyWithImpl(this._self, this._then);

  final _UpdateSubtaskData _self;
  final $Res Function(_UpdateSubtaskData) _then;

/// Create a copy of UpdateSubtaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtasks = null,}) {
  return _then(_UpdateSubtaskData(
subtasks: null == subtasks ? _self._subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on

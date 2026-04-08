// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_subtask_list_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateSubtaskListReq {

 List<UpdateSubtaskReq> get subtasks;
/// Create a copy of UpdateSubtaskListReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSubtaskListReqCopyWith<UpdateSubtaskListReq> get copyWith => _$UpdateSubtaskListReqCopyWithImpl<UpdateSubtaskListReq>(this as UpdateSubtaskListReq, _$identity);

  /// Serializes this UpdateSubtaskListReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSubtaskListReq&&const DeepCollectionEquality().equals(other.subtasks, subtasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(subtasks));

@override
String toString() {
  return 'UpdateSubtaskListReq(subtasks: $subtasks)';
}


}

/// @nodoc
abstract mixin class $UpdateSubtaskListReqCopyWith<$Res>  {
  factory $UpdateSubtaskListReqCopyWith(UpdateSubtaskListReq value, $Res Function(UpdateSubtaskListReq) _then) = _$UpdateSubtaskListReqCopyWithImpl;
@useResult
$Res call({
 List<UpdateSubtaskReq> subtasks
});




}
/// @nodoc
class _$UpdateSubtaskListReqCopyWithImpl<$Res>
    implements $UpdateSubtaskListReqCopyWith<$Res> {
  _$UpdateSubtaskListReqCopyWithImpl(this._self, this._then);

  final UpdateSubtaskListReq _self;
  final $Res Function(UpdateSubtaskListReq) _then;

/// Create a copy of UpdateSubtaskListReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtasks = null,}) {
  return _then(_self.copyWith(
subtasks: null == subtasks ? _self.subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<UpdateSubtaskReq>,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateSubtaskListReq].
extension UpdateSubtaskListReqPatterns on UpdateSubtaskListReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateSubtaskListReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateSubtaskListReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateSubtaskListReq value)  $default,){
final _that = this;
switch (_that) {
case _UpdateSubtaskListReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateSubtaskListReq value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateSubtaskListReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UpdateSubtaskReq> subtasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateSubtaskListReq() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UpdateSubtaskReq> subtasks)  $default,) {final _that = this;
switch (_that) {
case _UpdateSubtaskListReq():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UpdateSubtaskReq> subtasks)?  $default,) {final _that = this;
switch (_that) {
case _UpdateSubtaskListReq() when $default != null:
return $default(_that.subtasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateSubtaskListReq implements UpdateSubtaskListReq {
  const _UpdateSubtaskListReq({required final  List<UpdateSubtaskReq> subtasks}): _subtasks = subtasks;
  factory _UpdateSubtaskListReq.fromJson(Map<String, dynamic> json) => _$UpdateSubtaskListReqFromJson(json);

 final  List<UpdateSubtaskReq> _subtasks;
@override List<UpdateSubtaskReq> get subtasks {
  if (_subtasks is EqualUnmodifiableListView) return _subtasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtasks);
}


/// Create a copy of UpdateSubtaskListReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSubtaskListReqCopyWith<_UpdateSubtaskListReq> get copyWith => __$UpdateSubtaskListReqCopyWithImpl<_UpdateSubtaskListReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSubtaskListReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSubtaskListReq&&const DeepCollectionEquality().equals(other._subtasks, _subtasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_subtasks));

@override
String toString() {
  return 'UpdateSubtaskListReq(subtasks: $subtasks)';
}


}

/// @nodoc
abstract mixin class _$UpdateSubtaskListReqCopyWith<$Res> implements $UpdateSubtaskListReqCopyWith<$Res> {
  factory _$UpdateSubtaskListReqCopyWith(_UpdateSubtaskListReq value, $Res Function(_UpdateSubtaskListReq) _then) = __$UpdateSubtaskListReqCopyWithImpl;
@override @useResult
$Res call({
 List<UpdateSubtaskReq> subtasks
});




}
/// @nodoc
class __$UpdateSubtaskListReqCopyWithImpl<$Res>
    implements _$UpdateSubtaskListReqCopyWith<$Res> {
  __$UpdateSubtaskListReqCopyWithImpl(this._self, this._then);

  final _UpdateSubtaskListReq _self;
  final $Res Function(_UpdateSubtaskListReq) _then;

/// Create a copy of UpdateSubtaskListReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtasks = null,}) {
  return _then(_UpdateSubtaskListReq(
subtasks: null == subtasks ? _self._subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<UpdateSubtaskReq>,
  ));
}


}

// dart format on

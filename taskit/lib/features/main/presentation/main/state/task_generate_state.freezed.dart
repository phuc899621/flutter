// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_generate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskGenerateState {

 bool get isListening; bool get isGenerating; String get text; bool? get isGenerateSuccess; String? get error; bool get isEditing;
/// Create a copy of TaskGenerateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskGenerateStateCopyWith<TaskGenerateState> get copyWith => _$TaskGenerateStateCopyWithImpl<TaskGenerateState>(this as TaskGenerateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskGenerateState&&(identical(other.isListening, isListening) || other.isListening == isListening)&&(identical(other.isGenerating, isGenerating) || other.isGenerating == isGenerating)&&(identical(other.text, text) || other.text == text)&&(identical(other.isGenerateSuccess, isGenerateSuccess) || other.isGenerateSuccess == isGenerateSuccess)&&(identical(other.error, error) || other.error == error)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,isListening,isGenerating,text,isGenerateSuccess,error,isEditing);

@override
String toString() {
  return 'TaskGenerateState(isListening: $isListening, isGenerating: $isGenerating, text: $text, isGenerateSuccess: $isGenerateSuccess, error: $error, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class $TaskGenerateStateCopyWith<$Res>  {
  factory $TaskGenerateStateCopyWith(TaskGenerateState value, $Res Function(TaskGenerateState) _then) = _$TaskGenerateStateCopyWithImpl;
@useResult
$Res call({
 bool isListening, bool isGenerating, String text, bool? isGenerateSuccess, String? error, bool isEditing
});




}
/// @nodoc
class _$TaskGenerateStateCopyWithImpl<$Res>
    implements $TaskGenerateStateCopyWith<$Res> {
  _$TaskGenerateStateCopyWithImpl(this._self, this._then);

  final TaskGenerateState _self;
  final $Res Function(TaskGenerateState) _then;

/// Create a copy of TaskGenerateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isListening = null,Object? isGenerating = null,Object? text = null,Object? isGenerateSuccess = freezed,Object? error = freezed,Object? isEditing = null,}) {
  return _then(_self.copyWith(
isListening: null == isListening ? _self.isListening : isListening // ignore: cast_nullable_to_non_nullable
as bool,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isGenerateSuccess: freezed == isGenerateSuccess ? _self.isGenerateSuccess : isGenerateSuccess // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskGenerateState].
extension TaskGenerateStatePatterns on TaskGenerateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskGenerateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskGenerateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskGenerateState value)  $default,){
final _that = this;
switch (_that) {
case _TaskGenerateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskGenerateState value)?  $default,){
final _that = this;
switch (_that) {
case _TaskGenerateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isListening,  bool isGenerating,  String text,  bool? isGenerateSuccess,  String? error,  bool isEditing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskGenerateState() when $default != null:
return $default(_that.isListening,_that.isGenerating,_that.text,_that.isGenerateSuccess,_that.error,_that.isEditing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isListening,  bool isGenerating,  String text,  bool? isGenerateSuccess,  String? error,  bool isEditing)  $default,) {final _that = this;
switch (_that) {
case _TaskGenerateState():
return $default(_that.isListening,_that.isGenerating,_that.text,_that.isGenerateSuccess,_that.error,_that.isEditing);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isListening,  bool isGenerating,  String text,  bool? isGenerateSuccess,  String? error,  bool isEditing)?  $default,) {final _that = this;
switch (_that) {
case _TaskGenerateState() when $default != null:
return $default(_that.isListening,_that.isGenerating,_that.text,_that.isGenerateSuccess,_that.error,_that.isEditing);case _:
  return null;

}
}

}

/// @nodoc


class _TaskGenerateState implements TaskGenerateState {
  const _TaskGenerateState({this.isListening = false, this.isGenerating = false, this.text = '', this.isGenerateSuccess, this.error, this.isEditing = false});
  

@override@JsonKey() final  bool isListening;
@override@JsonKey() final  bool isGenerating;
@override@JsonKey() final  String text;
@override final  bool? isGenerateSuccess;
@override final  String? error;
@override@JsonKey() final  bool isEditing;

/// Create a copy of TaskGenerateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskGenerateStateCopyWith<_TaskGenerateState> get copyWith => __$TaskGenerateStateCopyWithImpl<_TaskGenerateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskGenerateState&&(identical(other.isListening, isListening) || other.isListening == isListening)&&(identical(other.isGenerating, isGenerating) || other.isGenerating == isGenerating)&&(identical(other.text, text) || other.text == text)&&(identical(other.isGenerateSuccess, isGenerateSuccess) || other.isGenerateSuccess == isGenerateSuccess)&&(identical(other.error, error) || other.error == error)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,isListening,isGenerating,text,isGenerateSuccess,error,isEditing);

@override
String toString() {
  return 'TaskGenerateState(isListening: $isListening, isGenerating: $isGenerating, text: $text, isGenerateSuccess: $isGenerateSuccess, error: $error, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class _$TaskGenerateStateCopyWith<$Res> implements $TaskGenerateStateCopyWith<$Res> {
  factory _$TaskGenerateStateCopyWith(_TaskGenerateState value, $Res Function(_TaskGenerateState) _then) = __$TaskGenerateStateCopyWithImpl;
@override @useResult
$Res call({
 bool isListening, bool isGenerating, String text, bool? isGenerateSuccess, String? error, bool isEditing
});




}
/// @nodoc
class __$TaskGenerateStateCopyWithImpl<$Res>
    implements _$TaskGenerateStateCopyWith<$Res> {
  __$TaskGenerateStateCopyWithImpl(this._self, this._then);

  final _TaskGenerateState _self;
  final $Res Function(_TaskGenerateState) _then;

/// Create a copy of TaskGenerateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isListening = null,Object? isGenerating = null,Object? text = null,Object? isGenerateSuccess = freezed,Object? error = freezed,Object? isEditing = null,}) {
  return _then(_TaskGenerateState(
isListening: null == isListening ? _self.isListening : isListening // ignore: cast_nullable_to_non_nullable
as bool,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isGenerateSuccess: freezed == isGenerateSuccess ? _self.isGenerateSuccess : isGenerateSuccess // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

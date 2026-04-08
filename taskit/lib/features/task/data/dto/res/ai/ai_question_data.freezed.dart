// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_question_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiQuestionData {

 String get answer;
/// Create a copy of AiQuestionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiQuestionDataCopyWith<AiQuestionData> get copyWith => _$AiQuestionDataCopyWithImpl<AiQuestionData>(this as AiQuestionData, _$identity);

  /// Serializes this AiQuestionData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiQuestionData&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answer);

@override
String toString() {
  return 'AiQuestionData(answer: $answer)';
}


}

/// @nodoc
abstract mixin class $AiQuestionDataCopyWith<$Res>  {
  factory $AiQuestionDataCopyWith(AiQuestionData value, $Res Function(AiQuestionData) _then) = _$AiQuestionDataCopyWithImpl;
@useResult
$Res call({
 String answer
});




}
/// @nodoc
class _$AiQuestionDataCopyWithImpl<$Res>
    implements $AiQuestionDataCopyWith<$Res> {
  _$AiQuestionDataCopyWithImpl(this._self, this._then);

  final AiQuestionData _self;
  final $Res Function(AiQuestionData) _then;

/// Create a copy of AiQuestionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? answer = null,}) {
  return _then(_self.copyWith(
answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AiQuestionData].
extension AiQuestionDataPatterns on AiQuestionData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiQuestionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiQuestionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiQuestionData value)  $default,){
final _that = this;
switch (_that) {
case _AiQuestionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiQuestionData value)?  $default,){
final _that = this;
switch (_that) {
case _AiQuestionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiQuestionData() when $default != null:
return $default(_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String answer)  $default,) {final _that = this;
switch (_that) {
case _AiQuestionData():
return $default(_that.answer);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String answer)?  $default,) {final _that = this;
switch (_that) {
case _AiQuestionData() when $default != null:
return $default(_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiQuestionData implements AiQuestionData {
  const _AiQuestionData({required this.answer});
  factory _AiQuestionData.fromJson(Map<String, dynamic> json) => _$AiQuestionDataFromJson(json);

@override final  String answer;

/// Create a copy of AiQuestionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiQuestionDataCopyWith<_AiQuestionData> get copyWith => __$AiQuestionDataCopyWithImpl<_AiQuestionData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiQuestionDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiQuestionData&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answer);

@override
String toString() {
  return 'AiQuestionData(answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$AiQuestionDataCopyWith<$Res> implements $AiQuestionDataCopyWith<$Res> {
  factory _$AiQuestionDataCopyWith(_AiQuestionData value, $Res Function(_AiQuestionData) _then) = __$AiQuestionDataCopyWithImpl;
@override @useResult
$Res call({
 String answer
});




}
/// @nodoc
class __$AiQuestionDataCopyWithImpl<$Res>
    implements _$AiQuestionDataCopyWith<$Res> {
  __$AiQuestionDataCopyWithImpl(this._self, this._then);

  final _AiQuestionData _self;
  final $Res Function(_AiQuestionData) _then;

/// Create a copy of AiQuestionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? answer = null,}) {
  return _then(_AiQuestionData(
answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

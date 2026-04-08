// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiCategoryReq {

 String get title; List<String> get excludedCategories;
/// Create a copy of AiCategoryReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiCategoryReqCopyWith<AiCategoryReq> get copyWith => _$AiCategoryReqCopyWithImpl<AiCategoryReq>(this as AiCategoryReq, _$identity);

  /// Serializes this AiCategoryReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiCategoryReq&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.excludedCategories, excludedCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(excludedCategories));

@override
String toString() {
  return 'AiCategoryReq(title: $title, excludedCategories: $excludedCategories)';
}


}

/// @nodoc
abstract mixin class $AiCategoryReqCopyWith<$Res>  {
  factory $AiCategoryReqCopyWith(AiCategoryReq value, $Res Function(AiCategoryReq) _then) = _$AiCategoryReqCopyWithImpl;
@useResult
$Res call({
 String title, List<String> excludedCategories
});




}
/// @nodoc
class _$AiCategoryReqCopyWithImpl<$Res>
    implements $AiCategoryReqCopyWith<$Res> {
  _$AiCategoryReqCopyWithImpl(this._self, this._then);

  final AiCategoryReq _self;
  final $Res Function(AiCategoryReq) _then;

/// Create a copy of AiCategoryReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? excludedCategories = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,excludedCategories: null == excludedCategories ? _self.excludedCategories : excludedCategories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiCategoryReq].
extension AiCategoryReqPatterns on AiCategoryReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiCategoryReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiCategoryReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiCategoryReq value)  $default,){
final _that = this;
switch (_that) {
case _AiCategoryReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiCategoryReq value)?  $default,){
final _that = this;
switch (_that) {
case _AiCategoryReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<String> excludedCategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiCategoryReq() when $default != null:
return $default(_that.title,_that.excludedCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<String> excludedCategories)  $default,) {final _that = this;
switch (_that) {
case _AiCategoryReq():
return $default(_that.title,_that.excludedCategories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<String> excludedCategories)?  $default,) {final _that = this;
switch (_that) {
case _AiCategoryReq() when $default != null:
return $default(_that.title,_that.excludedCategories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiCategoryReq implements AiCategoryReq {
  const _AiCategoryReq({required this.title, required final  List<String> excludedCategories}): _excludedCategories = excludedCategories;
  factory _AiCategoryReq.fromJson(Map<String, dynamic> json) => _$AiCategoryReqFromJson(json);

@override final  String title;
 final  List<String> _excludedCategories;
@override List<String> get excludedCategories {
  if (_excludedCategories is EqualUnmodifiableListView) return _excludedCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_excludedCategories);
}


/// Create a copy of AiCategoryReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiCategoryReqCopyWith<_AiCategoryReq> get copyWith => __$AiCategoryReqCopyWithImpl<_AiCategoryReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiCategoryReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiCategoryReq&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._excludedCategories, _excludedCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_excludedCategories));

@override
String toString() {
  return 'AiCategoryReq(title: $title, excludedCategories: $excludedCategories)';
}


}

/// @nodoc
abstract mixin class _$AiCategoryReqCopyWith<$Res> implements $AiCategoryReqCopyWith<$Res> {
  factory _$AiCategoryReqCopyWith(_AiCategoryReq value, $Res Function(_AiCategoryReq) _then) = __$AiCategoryReqCopyWithImpl;
@override @useResult
$Res call({
 String title, List<String> excludedCategories
});




}
/// @nodoc
class __$AiCategoryReqCopyWithImpl<$Res>
    implements _$AiCategoryReqCopyWith<$Res> {
  __$AiCategoryReqCopyWithImpl(this._self, this._then);

  final _AiCategoryReq _self;
  final $Res Function(_AiCategoryReq) _then;

/// Create a copy of AiCategoryReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? excludedCategories = null,}) {
  return _then(_AiCategoryReq(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,excludedCategories: null == excludedCategories ? _self._excludedCategories : excludedCategories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

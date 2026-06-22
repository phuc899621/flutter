// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_subtask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UpdateSubtaskReq _$UpdateSubtaskReqFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'all':
          return _UpdateSubtaskAllReq.fromJson(
            json
          );
                case 'status':
          return _UpdateSubtaskStatusReq.fromJson(
            json
          );
                case 'title':
          return _UpdateSubtaskTitleReq.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'UpdateSubtaskReq',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$UpdateSubtaskReq {

 int get localId;
/// Create a copy of UpdateSubtaskReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSubtaskReqCopyWith<UpdateSubtaskReq> get copyWith => _$UpdateSubtaskReqCopyWithImpl<UpdateSubtaskReq>(this as UpdateSubtaskReq, _$identity);

  /// Serializes this UpdateSubtaskReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSubtaskReq&&(identical(other.localId, localId) || other.localId == localId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId);

@override
String toString() {
  return 'UpdateSubtaskReq(localId: $localId)';
}


}

/// @nodoc
abstract mixin class $UpdateSubtaskReqCopyWith<$Res>  {
  factory $UpdateSubtaskReqCopyWith(UpdateSubtaskReq value, $Res Function(UpdateSubtaskReq) _then) = _$UpdateSubtaskReqCopyWithImpl;
@useResult
$Res call({
 int localId
});




}
/// @nodoc
class _$UpdateSubtaskReqCopyWithImpl<$Res>
    implements $UpdateSubtaskReqCopyWith<$Res> {
  _$UpdateSubtaskReqCopyWithImpl(this._self, this._then);

  final UpdateSubtaskReq _self;
  final $Res Function(UpdateSubtaskReq) _then;

/// Create a copy of UpdateSubtaskReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateSubtaskReq].
extension UpdateSubtaskReqPatterns on UpdateSubtaskReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UpdateSubtaskAllReq value)?  all,TResult Function( _UpdateSubtaskStatusReq value)?  status,TResult Function( _UpdateSubtaskTitleReq value)?  title,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateSubtaskAllReq() when all != null:
return all(_that);case _UpdateSubtaskStatusReq() when status != null:
return status(_that);case _UpdateSubtaskTitleReq() when title != null:
return title(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UpdateSubtaskAllReq value)  all,required TResult Function( _UpdateSubtaskStatusReq value)  status,required TResult Function( _UpdateSubtaskTitleReq value)  title,}){
final _that = this;
switch (_that) {
case _UpdateSubtaskAllReq():
return all(_that);case _UpdateSubtaskStatusReq():
return status(_that);case _UpdateSubtaskTitleReq():
return title(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UpdateSubtaskAllReq value)?  all,TResult? Function( _UpdateSubtaskStatusReq value)?  status,TResult? Function( _UpdateSubtaskTitleReq value)?  title,}){
final _that = this;
switch (_that) {
case _UpdateSubtaskAllReq() when all != null:
return all(_that);case _UpdateSubtaskStatusReq() when status != null:
return status(_that);case _UpdateSubtaskTitleReq() when title != null:
return title(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isCompleted,  DateTime? completedAt,  int localId,  String title)?  all,TResult Function( bool isCompleted,  DateTime? completedAt,  int localId)?  status,TResult Function( int localId,  String title)?  title,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateSubtaskAllReq() when all != null:
return all(_that.isCompleted,_that.completedAt,_that.localId,_that.title);case _UpdateSubtaskStatusReq() when status != null:
return status(_that.isCompleted,_that.completedAt,_that.localId);case _UpdateSubtaskTitleReq() when title != null:
return title(_that.localId,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isCompleted,  DateTime? completedAt,  int localId,  String title)  all,required TResult Function( bool isCompleted,  DateTime? completedAt,  int localId)  status,required TResult Function( int localId,  String title)  title,}) {final _that = this;
switch (_that) {
case _UpdateSubtaskAllReq():
return all(_that.isCompleted,_that.completedAt,_that.localId,_that.title);case _UpdateSubtaskStatusReq():
return status(_that.isCompleted,_that.completedAt,_that.localId);case _UpdateSubtaskTitleReq():
return title(_that.localId,_that.title);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isCompleted,  DateTime? completedAt,  int localId,  String title)?  all,TResult? Function( bool isCompleted,  DateTime? completedAt,  int localId)?  status,TResult? Function( int localId,  String title)?  title,}) {final _that = this;
switch (_that) {
case _UpdateSubtaskAllReq() when all != null:
return all(_that.isCompleted,_that.completedAt,_that.localId,_that.title);case _UpdateSubtaskStatusReq() when status != null:
return status(_that.isCompleted,_that.completedAt,_that.localId);case _UpdateSubtaskTitleReq() when title != null:
return title(_that.localId,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateSubtaskAllReq implements UpdateSubtaskReq {
  const _UpdateSubtaskAllReq({required this.isCompleted, this.completedAt, required this.localId, required this.title, final  String? $type}): $type = $type ?? 'all';
  factory _UpdateSubtaskAllReq.fromJson(Map<String, dynamic> json) => _$UpdateSubtaskAllReqFromJson(json);

 final  bool isCompleted;
 final  DateTime? completedAt;
@override final  int localId;
 final  String title;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateSubtaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSubtaskAllReqCopyWith<_UpdateSubtaskAllReq> get copyWith => __$UpdateSubtaskAllReqCopyWithImpl<_UpdateSubtaskAllReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSubtaskAllReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSubtaskAllReq&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isCompleted,completedAt,localId,title);

@override
String toString() {
  return 'UpdateSubtaskReq.all(isCompleted: $isCompleted, completedAt: $completedAt, localId: $localId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$UpdateSubtaskAllReqCopyWith<$Res> implements $UpdateSubtaskReqCopyWith<$Res> {
  factory _$UpdateSubtaskAllReqCopyWith(_UpdateSubtaskAllReq value, $Res Function(_UpdateSubtaskAllReq) _then) = __$UpdateSubtaskAllReqCopyWithImpl;
@override @useResult
$Res call({
 bool isCompleted, DateTime? completedAt, int localId, String title
});




}
/// @nodoc
class __$UpdateSubtaskAllReqCopyWithImpl<$Res>
    implements _$UpdateSubtaskAllReqCopyWith<$Res> {
  __$UpdateSubtaskAllReqCopyWithImpl(this._self, this._then);

  final _UpdateSubtaskAllReq _self;
  final $Res Function(_UpdateSubtaskAllReq) _then;

/// Create a copy of UpdateSubtaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCompleted = null,Object? completedAt = freezed,Object? localId = null,Object? title = null,}) {
  return _then(_UpdateSubtaskAllReq(
isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _UpdateSubtaskStatusReq implements UpdateSubtaskReq {
  const _UpdateSubtaskStatusReq({required this.isCompleted, this.completedAt, required this.localId, final  String? $type}): $type = $type ?? 'status';
  factory _UpdateSubtaskStatusReq.fromJson(Map<String, dynamic> json) => _$UpdateSubtaskStatusReqFromJson(json);

 final  bool isCompleted;
 final  DateTime? completedAt;
@override final  int localId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateSubtaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSubtaskStatusReqCopyWith<_UpdateSubtaskStatusReq> get copyWith => __$UpdateSubtaskStatusReqCopyWithImpl<_UpdateSubtaskStatusReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSubtaskStatusReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSubtaskStatusReq&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.localId, localId) || other.localId == localId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isCompleted,completedAt,localId);

@override
String toString() {
  return 'UpdateSubtaskReq.status(isCompleted: $isCompleted, completedAt: $completedAt, localId: $localId)';
}


}

/// @nodoc
abstract mixin class _$UpdateSubtaskStatusReqCopyWith<$Res> implements $UpdateSubtaskReqCopyWith<$Res> {
  factory _$UpdateSubtaskStatusReqCopyWith(_UpdateSubtaskStatusReq value, $Res Function(_UpdateSubtaskStatusReq) _then) = __$UpdateSubtaskStatusReqCopyWithImpl;
@override @useResult
$Res call({
 bool isCompleted, DateTime? completedAt, int localId
});




}
/// @nodoc
class __$UpdateSubtaskStatusReqCopyWithImpl<$Res>
    implements _$UpdateSubtaskStatusReqCopyWith<$Res> {
  __$UpdateSubtaskStatusReqCopyWithImpl(this._self, this._then);

  final _UpdateSubtaskStatusReq _self;
  final $Res Function(_UpdateSubtaskStatusReq) _then;

/// Create a copy of UpdateSubtaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCompleted = null,Object? completedAt = freezed,Object? localId = null,}) {
  return _then(_UpdateSubtaskStatusReq(
isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _UpdateSubtaskTitleReq implements UpdateSubtaskReq {
  const _UpdateSubtaskTitleReq({required this.localId, required this.title, final  String? $type}): $type = $type ?? 'title';
  factory _UpdateSubtaskTitleReq.fromJson(Map<String, dynamic> json) => _$UpdateSubtaskTitleReqFromJson(json);

@override final  int localId;
 final  String title;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateSubtaskReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSubtaskTitleReqCopyWith<_UpdateSubtaskTitleReq> get copyWith => __$UpdateSubtaskTitleReqCopyWithImpl<_UpdateSubtaskTitleReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSubtaskTitleReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSubtaskTitleReq&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,title);

@override
String toString() {
  return 'UpdateSubtaskReq.title(localId: $localId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$UpdateSubtaskTitleReqCopyWith<$Res> implements $UpdateSubtaskReqCopyWith<$Res> {
  factory _$UpdateSubtaskTitleReqCopyWith(_UpdateSubtaskTitleReq value, $Res Function(_UpdateSubtaskTitleReq) _then) = __$UpdateSubtaskTitleReqCopyWithImpl;
@override @useResult
$Res call({
 int localId, String title
});




}
/// @nodoc
class __$UpdateSubtaskTitleReqCopyWithImpl<$Res>
    implements _$UpdateSubtaskTitleReqCopyWith<$Res> {
  __$UpdateSubtaskTitleReqCopyWithImpl(this._self, this._then);

  final _UpdateSubtaskTitleReq _self;
  final $Res Function(_UpdateSubtaskTitleReq) _then;

/// Create a copy of UpdateSubtaskReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? title = null,}) {
  return _then(_UpdateSubtaskTitleReq(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

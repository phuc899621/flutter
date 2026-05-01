// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reconcile_user_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReconcileUserParam {

 UserEntity get newUser; UserEntity? get oldUser;
/// Create a copy of ReconcileUserParam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReconcileUserParamCopyWith<ReconcileUserParam> get copyWith => _$ReconcileUserParamCopyWithImpl<ReconcileUserParam>(this as ReconcileUserParam, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReconcileUserParam&&(identical(other.newUser, newUser) || other.newUser == newUser)&&(identical(other.oldUser, oldUser) || other.oldUser == oldUser));
}


@override
int get hashCode => Object.hash(runtimeType,newUser,oldUser);

@override
String toString() {
  return 'ReconcileUserParam(newUser: $newUser, oldUser: $oldUser)';
}


}

/// @nodoc
abstract mixin class $ReconcileUserParamCopyWith<$Res>  {
  factory $ReconcileUserParamCopyWith(ReconcileUserParam value, $Res Function(ReconcileUserParam) _then) = _$ReconcileUserParamCopyWithImpl;
@useResult
$Res call({
 UserEntity newUser, UserEntity? oldUser
});


$UserEntityCopyWith<$Res> get newUser;$UserEntityCopyWith<$Res>? get oldUser;

}
/// @nodoc
class _$ReconcileUserParamCopyWithImpl<$Res>
    implements $ReconcileUserParamCopyWith<$Res> {
  _$ReconcileUserParamCopyWithImpl(this._self, this._then);

  final ReconcileUserParam _self;
  final $Res Function(ReconcileUserParam) _then;

/// Create a copy of ReconcileUserParam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newUser = null,Object? oldUser = freezed,}) {
  return _then(_self.copyWith(
newUser: null == newUser ? _self.newUser : newUser // ignore: cast_nullable_to_non_nullable
as UserEntity,oldUser: freezed == oldUser ? _self.oldUser : oldUser // ignore: cast_nullable_to_non_nullable
as UserEntity?,
  ));
}
/// Create a copy of ReconcileUserParam
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get newUser {
  
  return $UserEntityCopyWith<$Res>(_self.newUser, (value) {
    return _then(_self.copyWith(newUser: value));
  });
}/// Create a copy of ReconcileUserParam
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get oldUser {
    if (_self.oldUser == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.oldUser!, (value) {
    return _then(_self.copyWith(oldUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReconcileUserParam].
extension ReconcileUserParamPatterns on ReconcileUserParam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReconcileUserParam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReconcileUserParam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReconcileUserParam value)  $default,){
final _that = this;
switch (_that) {
case _ReconcileUserParam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReconcileUserParam value)?  $default,){
final _that = this;
switch (_that) {
case _ReconcileUserParam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserEntity newUser,  UserEntity? oldUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReconcileUserParam() when $default != null:
return $default(_that.newUser,_that.oldUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserEntity newUser,  UserEntity? oldUser)  $default,) {final _that = this;
switch (_that) {
case _ReconcileUserParam():
return $default(_that.newUser,_that.oldUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserEntity newUser,  UserEntity? oldUser)?  $default,) {final _that = this;
switch (_that) {
case _ReconcileUserParam() when $default != null:
return $default(_that.newUser,_that.oldUser);case _:
  return null;

}
}

}

/// @nodoc


class _ReconcileUserParam implements ReconcileUserParam {
  const _ReconcileUserParam({required this.newUser, required this.oldUser});
  

@override final  UserEntity newUser;
@override final  UserEntity? oldUser;

/// Create a copy of ReconcileUserParam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReconcileUserParamCopyWith<_ReconcileUserParam> get copyWith => __$ReconcileUserParamCopyWithImpl<_ReconcileUserParam>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReconcileUserParam&&(identical(other.newUser, newUser) || other.newUser == newUser)&&(identical(other.oldUser, oldUser) || other.oldUser == oldUser));
}


@override
int get hashCode => Object.hash(runtimeType,newUser,oldUser);

@override
String toString() {
  return 'ReconcileUserParam(newUser: $newUser, oldUser: $oldUser)';
}


}

/// @nodoc
abstract mixin class _$ReconcileUserParamCopyWith<$Res> implements $ReconcileUserParamCopyWith<$Res> {
  factory _$ReconcileUserParamCopyWith(_ReconcileUserParam value, $Res Function(_ReconcileUserParam) _then) = __$ReconcileUserParamCopyWithImpl;
@override @useResult
$Res call({
 UserEntity newUser, UserEntity? oldUser
});


@override $UserEntityCopyWith<$Res> get newUser;@override $UserEntityCopyWith<$Res>? get oldUser;

}
/// @nodoc
class __$ReconcileUserParamCopyWithImpl<$Res>
    implements _$ReconcileUserParamCopyWith<$Res> {
  __$ReconcileUserParamCopyWithImpl(this._self, this._then);

  final _ReconcileUserParam _self;
  final $Res Function(_ReconcileUserParam) _then;

/// Create a copy of ReconcileUserParam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newUser = null,Object? oldUser = freezed,}) {
  return _then(_ReconcileUserParam(
newUser: null == newUser ? _self.newUser : newUser // ignore: cast_nullable_to_non_nullable
as UserEntity,oldUser: freezed == oldUser ? _self.oldUser : oldUser // ignore: cast_nullable_to_non_nullable
as UserEntity?,
  ));
}

/// Create a copy of ReconcileUserParam
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get newUser {
  
  return $UserEntityCopyWith<$Res>(_self.newUser, (value) {
    return _then(_self.copyWith(newUser: value));
  });
}/// Create a copy of ReconcileUserParam
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get oldUser {
    if (_self.oldUser == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.oldUser!, (value) {
    return _then(_self.copyWith(oldUser: value));
  });
}
}

// dart format on

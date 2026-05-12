// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryManagementState {

 String? get apiError; CategoryManagementStatus get status; List<CategoryEntity> get categories;
/// Create a copy of CategoryManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryManagementStateCopyWith<CategoryManagementState> get copyWith => _$CategoryManagementStateCopyWithImpl<CategoryManagementState>(this as CategoryManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryManagementState&&(identical(other.apiError, apiError) || other.apiError == apiError)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,apiError,status,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'CategoryManagementState(apiError: $apiError, status: $status, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $CategoryManagementStateCopyWith<$Res>  {
  factory $CategoryManagementStateCopyWith(CategoryManagementState value, $Res Function(CategoryManagementState) _then) = _$CategoryManagementStateCopyWithImpl;
@useResult
$Res call({
 String? apiError, CategoryManagementStatus status, List<CategoryEntity> categories
});




}
/// @nodoc
class _$CategoryManagementStateCopyWithImpl<$Res>
    implements $CategoryManagementStateCopyWith<$Res> {
  _$CategoryManagementStateCopyWithImpl(this._self, this._then);

  final CategoryManagementState _self;
  final $Res Function(CategoryManagementState) _then;

/// Create a copy of CategoryManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apiError = freezed,Object? status = null,Object? categories = null,}) {
  return _then(_self.copyWith(
apiError: freezed == apiError ? _self.apiError : apiError // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CategoryManagementStatus,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryManagementState].
extension CategoryManagementStatePatterns on CategoryManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryManagementState value)  $default,){
final _that = this;
switch (_that) {
case _CategoryManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? apiError,  CategoryManagementStatus status,  List<CategoryEntity> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryManagementState() when $default != null:
return $default(_that.apiError,_that.status,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? apiError,  CategoryManagementStatus status,  List<CategoryEntity> categories)  $default,) {final _that = this;
switch (_that) {
case _CategoryManagementState():
return $default(_that.apiError,_that.status,_that.categories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? apiError,  CategoryManagementStatus status,  List<CategoryEntity> categories)?  $default,) {final _that = this;
switch (_that) {
case _CategoryManagementState() when $default != null:
return $default(_that.apiError,_that.status,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryManagementState implements CategoryManagementState {
   _CategoryManagementState({this.apiError, this.status = CategoryManagementStatus.initial, final  List<CategoryEntity> categories = const []}): _categories = categories;
  

@override final  String? apiError;
@override@JsonKey() final  CategoryManagementStatus status;
 final  List<CategoryEntity> _categories;
@override@JsonKey() List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CategoryManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryManagementStateCopyWith<_CategoryManagementState> get copyWith => __$CategoryManagementStateCopyWithImpl<_CategoryManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryManagementState&&(identical(other.apiError, apiError) || other.apiError == apiError)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,apiError,status,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoryManagementState(apiError: $apiError, status: $status, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$CategoryManagementStateCopyWith<$Res> implements $CategoryManagementStateCopyWith<$Res> {
  factory _$CategoryManagementStateCopyWith(_CategoryManagementState value, $Res Function(_CategoryManagementState) _then) = __$CategoryManagementStateCopyWithImpl;
@override @useResult
$Res call({
 String? apiError, CategoryManagementStatus status, List<CategoryEntity> categories
});




}
/// @nodoc
class __$CategoryManagementStateCopyWithImpl<$Res>
    implements _$CategoryManagementStateCopyWith<$Res> {
  __$CategoryManagementStateCopyWithImpl(this._self, this._then);

  final _CategoryManagementState _self;
  final $Res Function(_CategoryManagementState) _then;

/// Create a copy of CategoryManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apiError = freezed,Object? status = null,Object? categories = null,}) {
  return _then(_CategoryManagementState(
apiError: freezed == apiError ? _self.apiError : apiError // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CategoryManagementStatus,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,
  ));
}


}

// dart format on

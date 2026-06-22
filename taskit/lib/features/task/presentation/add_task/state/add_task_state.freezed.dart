// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddTaskState {

 AddTaskStatus get status; String? get apiError; List<CategoryEntity> get categories; List<CategoryEntity> get aiCategories; List<TextEditingController> get subtasks; TaskPriority get selectedPriority; TaskReminderType get reminderType; DateTime? get reminderAt; int? get reminderOffset; CategoryEntity? get selectedCategory; DateTime? get selectedDate; Map<String, dynamic> get addTaskForm; bool get isTimeSelected;
/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTaskStateCopyWith<AddTaskState> get copyWith => _$AddTaskStateCopyWithImpl<AddTaskState>(this as AddTaskState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTaskState&&(identical(other.status, status) || other.status == status)&&(identical(other.apiError, apiError) || other.apiError == apiError)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.aiCategories, aiCategories)&&const DeepCollectionEquality().equals(other.subtasks, subtasks)&&(identical(other.selectedPriority, selectedPriority) || other.selectedPriority == selectedPriority)&&(identical(other.reminderType, reminderType) || other.reminderType == reminderType)&&(identical(other.reminderAt, reminderAt) || other.reminderAt == reminderAt)&&(identical(other.reminderOffset, reminderOffset) || other.reminderOffset == reminderOffset)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&const DeepCollectionEquality().equals(other.addTaskForm, addTaskForm)&&(identical(other.isTimeSelected, isTimeSelected) || other.isTimeSelected == isTimeSelected));
}


@override
int get hashCode => Object.hash(runtimeType,status,apiError,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(aiCategories),const DeepCollectionEquality().hash(subtasks),selectedPriority,reminderType,reminderAt,reminderOffset,selectedCategory,selectedDate,const DeepCollectionEquality().hash(addTaskForm),isTimeSelected);

@override
String toString() {
  return 'AddTaskState(status: $status, apiError: $apiError, categories: $categories, aiCategories: $aiCategories, subtasks: $subtasks, selectedPriority: $selectedPriority, reminderType: $reminderType, reminderAt: $reminderAt, reminderOffset: $reminderOffset, selectedCategory: $selectedCategory, selectedDate: $selectedDate, addTaskForm: $addTaskForm, isTimeSelected: $isTimeSelected)';
}


}

/// @nodoc
abstract mixin class $AddTaskStateCopyWith<$Res>  {
  factory $AddTaskStateCopyWith(AddTaskState value, $Res Function(AddTaskState) _then) = _$AddTaskStateCopyWithImpl;
@useResult
$Res call({
 AddTaskStatus status, String? apiError, List<CategoryEntity> categories, List<CategoryEntity> aiCategories, List<TextEditingController> subtasks, TaskPriority selectedPriority, TaskReminderType reminderType, DateTime? reminderAt, int? reminderOffset, CategoryEntity? selectedCategory, DateTime? selectedDate, Map<String, dynamic> addTaskForm, bool isTimeSelected
});


$CategoryEntityCopyWith<$Res>? get selectedCategory;

}
/// @nodoc
class _$AddTaskStateCopyWithImpl<$Res>
    implements $AddTaskStateCopyWith<$Res> {
  _$AddTaskStateCopyWithImpl(this._self, this._then);

  final AddTaskState _self;
  final $Res Function(AddTaskState) _then;

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? apiError = freezed,Object? categories = null,Object? aiCategories = null,Object? subtasks = null,Object? selectedPriority = null,Object? reminderType = null,Object? reminderAt = freezed,Object? reminderOffset = freezed,Object? selectedCategory = freezed,Object? selectedDate = freezed,Object? addTaskForm = null,Object? isTimeSelected = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AddTaskStatus,apiError: freezed == apiError ? _self.apiError : apiError // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,aiCategories: null == aiCategories ? _self.aiCategories : aiCategories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,subtasks: null == subtasks ? _self.subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<TextEditingController>,selectedPriority: null == selectedPriority ? _self.selectedPriority : selectedPriority // ignore: cast_nullable_to_non_nullable
as TaskPriority,reminderType: null == reminderType ? _self.reminderType : reminderType // ignore: cast_nullable_to_non_nullable
as TaskReminderType,reminderAt: freezed == reminderAt ? _self.reminderAt : reminderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reminderOffset: freezed == reminderOffset ? _self.reminderOffset : reminderOffset // ignore: cast_nullable_to_non_nullable
as int?,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as CategoryEntity?,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,addTaskForm: null == addTaskForm ? _self.addTaskForm : addTaskForm // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isTimeSelected: null == isTimeSelected ? _self.isTimeSelected : isTimeSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryEntityCopyWith<$Res>? get selectedCategory {
    if (_self.selectedCategory == null) {
    return null;
  }

  return $CategoryEntityCopyWith<$Res>(_self.selectedCategory!, (value) {
    return _then(_self.copyWith(selectedCategory: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddTaskState].
extension AddTaskStatePatterns on AddTaskState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddTaskState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddTaskState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddTaskState value)  $default,){
final _that = this;
switch (_that) {
case _AddTaskState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddTaskState value)?  $default,){
final _that = this;
switch (_that) {
case _AddTaskState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AddTaskStatus status,  String? apiError,  List<CategoryEntity> categories,  List<CategoryEntity> aiCategories,  List<TextEditingController> subtasks,  TaskPriority selectedPriority,  TaskReminderType reminderType,  DateTime? reminderAt,  int? reminderOffset,  CategoryEntity? selectedCategory,  DateTime? selectedDate,  Map<String, dynamic> addTaskForm,  bool isTimeSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddTaskState() when $default != null:
return $default(_that.status,_that.apiError,_that.categories,_that.aiCategories,_that.subtasks,_that.selectedPriority,_that.reminderType,_that.reminderAt,_that.reminderOffset,_that.selectedCategory,_that.selectedDate,_that.addTaskForm,_that.isTimeSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AddTaskStatus status,  String? apiError,  List<CategoryEntity> categories,  List<CategoryEntity> aiCategories,  List<TextEditingController> subtasks,  TaskPriority selectedPriority,  TaskReminderType reminderType,  DateTime? reminderAt,  int? reminderOffset,  CategoryEntity? selectedCategory,  DateTime? selectedDate,  Map<String, dynamic> addTaskForm,  bool isTimeSelected)  $default,) {final _that = this;
switch (_that) {
case _AddTaskState():
return $default(_that.status,_that.apiError,_that.categories,_that.aiCategories,_that.subtasks,_that.selectedPriority,_that.reminderType,_that.reminderAt,_that.reminderOffset,_that.selectedCategory,_that.selectedDate,_that.addTaskForm,_that.isTimeSelected);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AddTaskStatus status,  String? apiError,  List<CategoryEntity> categories,  List<CategoryEntity> aiCategories,  List<TextEditingController> subtasks,  TaskPriority selectedPriority,  TaskReminderType reminderType,  DateTime? reminderAt,  int? reminderOffset,  CategoryEntity? selectedCategory,  DateTime? selectedDate,  Map<String, dynamic> addTaskForm,  bool isTimeSelected)?  $default,) {final _that = this;
switch (_that) {
case _AddTaskState() when $default != null:
return $default(_that.status,_that.apiError,_that.categories,_that.aiCategories,_that.subtasks,_that.selectedPriority,_that.reminderType,_that.reminderAt,_that.reminderOffset,_that.selectedCategory,_that.selectedDate,_that.addTaskForm,_that.isTimeSelected);case _:
  return null;

}
}

}

/// @nodoc


class _AddTaskState implements AddTaskState {
  const _AddTaskState({this.status = AddTaskStatus.initial, this.apiError, final  List<CategoryEntity> categories = const [], final  List<CategoryEntity> aiCategories = const [], final  List<TextEditingController> subtasks = const [], this.selectedPriority = TaskPriority.none, this.reminderType = TaskReminderType.none, this.reminderAt, this.reminderOffset, this.selectedCategory, this.selectedDate, final  Map<String, dynamic> addTaskForm = const {}, this.isTimeSelected = false}): _categories = categories,_aiCategories = aiCategories,_subtasks = subtasks,_addTaskForm = addTaskForm;
  

@override@JsonKey() final  AddTaskStatus status;
@override final  String? apiError;
 final  List<CategoryEntity> _categories;
@override@JsonKey() List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<CategoryEntity> _aiCategories;
@override@JsonKey() List<CategoryEntity> get aiCategories {
  if (_aiCategories is EqualUnmodifiableListView) return _aiCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aiCategories);
}

 final  List<TextEditingController> _subtasks;
@override@JsonKey() List<TextEditingController> get subtasks {
  if (_subtasks is EqualUnmodifiableListView) return _subtasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtasks);
}

@override@JsonKey() final  TaskPriority selectedPriority;
@override@JsonKey() final  TaskReminderType reminderType;
@override final  DateTime? reminderAt;
@override final  int? reminderOffset;
@override final  CategoryEntity? selectedCategory;
@override final  DateTime? selectedDate;
 final  Map<String, dynamic> _addTaskForm;
@override@JsonKey() Map<String, dynamic> get addTaskForm {
  if (_addTaskForm is EqualUnmodifiableMapView) return _addTaskForm;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_addTaskForm);
}

@override@JsonKey() final  bool isTimeSelected;

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTaskStateCopyWith<_AddTaskState> get copyWith => __$AddTaskStateCopyWithImpl<_AddTaskState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTaskState&&(identical(other.status, status) || other.status == status)&&(identical(other.apiError, apiError) || other.apiError == apiError)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._aiCategories, _aiCategories)&&const DeepCollectionEquality().equals(other._subtasks, _subtasks)&&(identical(other.selectedPriority, selectedPriority) || other.selectedPriority == selectedPriority)&&(identical(other.reminderType, reminderType) || other.reminderType == reminderType)&&(identical(other.reminderAt, reminderAt) || other.reminderAt == reminderAt)&&(identical(other.reminderOffset, reminderOffset) || other.reminderOffset == reminderOffset)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&const DeepCollectionEquality().equals(other._addTaskForm, _addTaskForm)&&(identical(other.isTimeSelected, isTimeSelected) || other.isTimeSelected == isTimeSelected));
}


@override
int get hashCode => Object.hash(runtimeType,status,apiError,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_aiCategories),const DeepCollectionEquality().hash(_subtasks),selectedPriority,reminderType,reminderAt,reminderOffset,selectedCategory,selectedDate,const DeepCollectionEquality().hash(_addTaskForm),isTimeSelected);

@override
String toString() {
  return 'AddTaskState(status: $status, apiError: $apiError, categories: $categories, aiCategories: $aiCategories, subtasks: $subtasks, selectedPriority: $selectedPriority, reminderType: $reminderType, reminderAt: $reminderAt, reminderOffset: $reminderOffset, selectedCategory: $selectedCategory, selectedDate: $selectedDate, addTaskForm: $addTaskForm, isTimeSelected: $isTimeSelected)';
}


}

/// @nodoc
abstract mixin class _$AddTaskStateCopyWith<$Res> implements $AddTaskStateCopyWith<$Res> {
  factory _$AddTaskStateCopyWith(_AddTaskState value, $Res Function(_AddTaskState) _then) = __$AddTaskStateCopyWithImpl;
@override @useResult
$Res call({
 AddTaskStatus status, String? apiError, List<CategoryEntity> categories, List<CategoryEntity> aiCategories, List<TextEditingController> subtasks, TaskPriority selectedPriority, TaskReminderType reminderType, DateTime? reminderAt, int? reminderOffset, CategoryEntity? selectedCategory, DateTime? selectedDate, Map<String, dynamic> addTaskForm, bool isTimeSelected
});


@override $CategoryEntityCopyWith<$Res>? get selectedCategory;

}
/// @nodoc
class __$AddTaskStateCopyWithImpl<$Res>
    implements _$AddTaskStateCopyWith<$Res> {
  __$AddTaskStateCopyWithImpl(this._self, this._then);

  final _AddTaskState _self;
  final $Res Function(_AddTaskState) _then;

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? apiError = freezed,Object? categories = null,Object? aiCategories = null,Object? subtasks = null,Object? selectedPriority = null,Object? reminderType = null,Object? reminderAt = freezed,Object? reminderOffset = freezed,Object? selectedCategory = freezed,Object? selectedDate = freezed,Object? addTaskForm = null,Object? isTimeSelected = null,}) {
  return _then(_AddTaskState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AddTaskStatus,apiError: freezed == apiError ? _self.apiError : apiError // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,aiCategories: null == aiCategories ? _self._aiCategories : aiCategories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,subtasks: null == subtasks ? _self._subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<TextEditingController>,selectedPriority: null == selectedPriority ? _self.selectedPriority : selectedPriority // ignore: cast_nullable_to_non_nullable
as TaskPriority,reminderType: null == reminderType ? _self.reminderType : reminderType // ignore: cast_nullable_to_non_nullable
as TaskReminderType,reminderAt: freezed == reminderAt ? _self.reminderAt : reminderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reminderOffset: freezed == reminderOffset ? _self.reminderOffset : reminderOffset // ignore: cast_nullable_to_non_nullable
as int?,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as CategoryEntity?,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,addTaskForm: null == addTaskForm ? _self._addTaskForm : addTaskForm // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isTimeSelected: null == isTimeSelected ? _self.isTimeSelected : isTimeSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryEntityCopyWith<$Res>? get selectedCategory {
    if (_self.selectedCategory == null) {
    return null;
  }

  return $CategoryEntityCopyWith<$Res>(_self.selectedCategory!, (value) {
    return _then(_self.copyWith(selectedCategory: value));
  });
}
}

// dart format on

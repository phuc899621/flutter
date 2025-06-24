// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditTaskState {
  TaskEntity? get task;
  List<CategoryEntity> get categories;

  /// Create a copy of EditTaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EditTaskStateCopyWith<EditTaskState> get copyWith =>
      _$EditTaskStateCopyWithImpl<EditTaskState>(
          this as EditTaskState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EditTaskState &&
            (identical(other.task, task) || other.task == task) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, task, const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'EditTaskState(task: $task, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $EditTaskStateCopyWith<$Res> {
  factory $EditTaskStateCopyWith(
          EditTaskState value, $Res Function(EditTaskState) _then) =
      _$EditTaskStateCopyWithImpl;
  @useResult
  $Res call({TaskEntity? task, List<CategoryEntity> categories});

  $TaskEntityCopyWith<$Res>? get task;
}

/// @nodoc
class _$EditTaskStateCopyWithImpl<$Res>
    implements $EditTaskStateCopyWith<$Res> {
  _$EditTaskStateCopyWithImpl(this._self, this._then);

  final EditTaskState _self;
  final $Res Function(EditTaskState) _then;

  /// Create a copy of EditTaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? categories = null,
  }) {
    return _then(_self.copyWith(
      task: freezed == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
    ));
  }

  /// Create a copy of EditTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<$Res>? get task {
    if (_self.task == null) {
      return null;
    }

    return $TaskEntityCopyWith<$Res>(_self.task!, (value) {
      return _then(_self.copyWith(task: value));
    });
  }
}

/// @nodoc

class _EditTaskState implements EditTaskState {
  _EditTaskState({this.task, final List<CategoryEntity> categories = const []})
      : _categories = categories;

  @override
  final TaskEntity? task;
  final List<CategoryEntity> _categories;
  @override
  @JsonKey()
  List<CategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of EditTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EditTaskStateCopyWith<_EditTaskState> get copyWith =>
      __$EditTaskStateCopyWithImpl<_EditTaskState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditTaskState &&
            (identical(other.task, task) || other.task == task) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, task, const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'EditTaskState(task: $task, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$EditTaskStateCopyWith<$Res>
    implements $EditTaskStateCopyWith<$Res> {
  factory _$EditTaskStateCopyWith(
          _EditTaskState value, $Res Function(_EditTaskState) _then) =
      __$EditTaskStateCopyWithImpl;
  @override
  @useResult
  $Res call({TaskEntity? task, List<CategoryEntity> categories});

  @override
  $TaskEntityCopyWith<$Res>? get task;
}

/// @nodoc
class __$EditTaskStateCopyWithImpl<$Res>
    implements _$EditTaskStateCopyWith<$Res> {
  __$EditTaskStateCopyWithImpl(this._self, this._then);

  final _EditTaskState _self;
  final $Res Function(_EditTaskState) _then;

  /// Create a copy of EditTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = freezed,
    Object? categories = null,
  }) {
    return _then(_EditTaskState(
      task: freezed == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
    ));
  }

  /// Create a copy of EditTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<$Res>? get task {
    if (_self.task == null) {
      return null;
    }

    return $TaskEntityCopyWith<$Res>(_self.task!, (value) {
      return _then(_self.copyWith(task: value));
    });
  }
}

// dart format on

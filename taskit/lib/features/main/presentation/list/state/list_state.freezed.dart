// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListState {
  List<TaskEntity> get filteringTask;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListStateCopyWith<ListState> get copyWith =>
      _$ListStateCopyWithImpl<ListState>(this as ListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListState &&
            const DeepCollectionEquality()
                .equals(other.filteringTask, filteringTask));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(filteringTask));

  @override
  String toString() {
    return 'ListState(filteringTask: $filteringTask)';
  }
}

/// @nodoc
abstract mixin class $ListStateCopyWith<$Res> {
  factory $ListStateCopyWith(ListState value, $Res Function(ListState) _then) =
      _$ListStateCopyWithImpl;
  @useResult
  $Res call({List<TaskEntity> filteringTask});
}

/// @nodoc
class _$ListStateCopyWithImpl<$Res> implements $ListStateCopyWith<$Res> {
  _$ListStateCopyWithImpl(this._self, this._then);

  final ListState _self;
  final $Res Function(ListState) _then;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filteringTask = null,
  }) {
    return _then(_self.copyWith(
      filteringTask: null == filteringTask
          ? _self.filteringTask
          : filteringTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
    ));
  }
}

/// @nodoc

class _ListState implements ListState {
  _ListState({required final List<TaskEntity> filteringTask})
      : _filteringTask = filteringTask;

  final List<TaskEntity> _filteringTask;
  @override
  List<TaskEntity> get filteringTask {
    if (_filteringTask is EqualUnmodifiableListView) return _filteringTask;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteringTask);
  }

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListStateCopyWith<_ListState> get copyWith =>
      __$ListStateCopyWithImpl<_ListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListState &&
            const DeepCollectionEquality()
                .equals(other._filteringTask, _filteringTask));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_filteringTask));

  @override
  String toString() {
    return 'ListState(filteringTask: $filteringTask)';
  }
}

/// @nodoc
abstract mixin class _$ListStateCopyWith<$Res>
    implements $ListStateCopyWith<$Res> {
  factory _$ListStateCopyWith(
          _ListState value, $Res Function(_ListState) _then) =
      __$ListStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<TaskEntity> filteringTask});
}

/// @nodoc
class __$ListStateCopyWithImpl<$Res> implements _$ListStateCopyWith<$Res> {
  __$ListStateCopyWithImpl(this._self, this._then);

  final _ListState _self;
  final $Res Function(_ListState) _then;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filteringTask = null,
  }) {
    return _then(_ListState(
      filteringTask: null == filteringTask
          ? _self._filteringTask
          : filteringTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
    ));
  }
}

// dart format on

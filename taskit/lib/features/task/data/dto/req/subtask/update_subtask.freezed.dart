// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_subtask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateSubtaskWithTaskReq {
  String get id;
  bool? get isCompleted;
  int get localId;
  String? get title;

  /// Create a copy of UpdateSubtaskWithTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateSubtaskWithTaskReqCopyWith<UpdateSubtaskWithTaskReq> get copyWith =>
      _$UpdateSubtaskWithTaskReqCopyWithImpl<UpdateSubtaskWithTaskReq>(
          this as UpdateSubtaskWithTaskReq, _$identity);

  /// Serializes this UpdateSubtaskWithTaskReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateSubtaskWithTaskReq &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, isCompleted, localId, title);

  @override
  String toString() {
    return 'UpdateSubtaskWithTaskReq(id: $id, isCompleted: $isCompleted, localId: $localId, title: $title)';
  }
}

/// @nodoc
abstract mixin class $UpdateSubtaskWithTaskReqCopyWith<$Res> {
  factory $UpdateSubtaskWithTaskReqCopyWith(UpdateSubtaskWithTaskReq value,
          $Res Function(UpdateSubtaskWithTaskReq) _then) =
      _$UpdateSubtaskWithTaskReqCopyWithImpl;
  @useResult
  $Res call({String id, bool? isCompleted, int localId, String? title});
}

/// @nodoc
class _$UpdateSubtaskWithTaskReqCopyWithImpl<$Res>
    implements $UpdateSubtaskWithTaskReqCopyWith<$Res> {
  _$UpdateSubtaskWithTaskReqCopyWithImpl(this._self, this._then);

  final UpdateSubtaskWithTaskReq _self;
  final $Res Function(UpdateSubtaskWithTaskReq) _then;

  /// Create a copy of UpdateSubtaskWithTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isCompleted = freezed,
    Object? localId = null,
    Object? title = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: freezed == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateSubtaskWithTaskReq implements UpdateSubtaskWithTaskReq {
  const _UpdateSubtaskWithTaskReq(
      {required this.id, this.isCompleted, required this.localId, this.title});
  factory _UpdateSubtaskWithTaskReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubtaskWithTaskReqFromJson(json);

  @override
  final String id;
  @override
  final bool? isCompleted;
  @override
  final int localId;
  @override
  final String? title;

  /// Create a copy of UpdateSubtaskWithTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateSubtaskWithTaskReqCopyWith<_UpdateSubtaskWithTaskReq> get copyWith =>
      __$UpdateSubtaskWithTaskReqCopyWithImpl<_UpdateSubtaskWithTaskReq>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateSubtaskWithTaskReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateSubtaskWithTaskReq &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, isCompleted, localId, title);

  @override
  String toString() {
    return 'UpdateSubtaskWithTaskReq(id: $id, isCompleted: $isCompleted, localId: $localId, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$UpdateSubtaskWithTaskReqCopyWith<$Res>
    implements $UpdateSubtaskWithTaskReqCopyWith<$Res> {
  factory _$UpdateSubtaskWithTaskReqCopyWith(_UpdateSubtaskWithTaskReq value,
          $Res Function(_UpdateSubtaskWithTaskReq) _then) =
      __$UpdateSubtaskWithTaskReqCopyWithImpl;
  @override
  @useResult
  $Res call({String id, bool? isCompleted, int localId, String? title});
}

/// @nodoc
class __$UpdateSubtaskWithTaskReqCopyWithImpl<$Res>
    implements _$UpdateSubtaskWithTaskReqCopyWith<$Res> {
  __$UpdateSubtaskWithTaskReqCopyWithImpl(this._self, this._then);

  final _UpdateSubtaskWithTaskReq _self;
  final $Res Function(_UpdateSubtaskWithTaskReq) _then;

  /// Create a copy of UpdateSubtaskWithTaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isCompleted = freezed,
    Object? localId = null,
    Object? title = freezed,
  }) {
    return _then(_UpdateSubtaskWithTaskReq(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: freezed == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

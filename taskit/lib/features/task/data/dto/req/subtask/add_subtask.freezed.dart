// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_subtask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AddSubtaskReq _$AddSubtaskReqFromJson(Map<String, dynamic> json) {
  return _AddSubtask.fromJson(json);
}

/// @nodoc
mixin _$AddSubtaskReq {
  String get title;
  int get localId;

  /// Create a copy of AddSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddSubtaskReqCopyWith<AddSubtaskReq> get copyWith =>
      _$AddSubtaskReqCopyWithImpl<AddSubtaskReq>(
          this as AddSubtaskReq, _$identity);

  /// Serializes this AddSubtaskReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddSubtaskReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.localId, localId) || other.localId == localId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, localId);

  @override
  String toString() {
    return 'AddSubtaskReq(title: $title, localId: $localId)';
  }
}

/// @nodoc
abstract mixin class $AddSubtaskReqCopyWith<$Res> {
  factory $AddSubtaskReqCopyWith(
          AddSubtaskReq value, $Res Function(AddSubtaskReq) _then) =
      _$AddSubtaskReqCopyWithImpl;
  @useResult
  $Res call({String title, int localId});
}

/// @nodoc
class _$AddSubtaskReqCopyWithImpl<$Res>
    implements $AddSubtaskReqCopyWith<$Res> {
  _$AddSubtaskReqCopyWithImpl(this._self, this._then);

  final AddSubtaskReq _self;
  final $Res Function(AddSubtaskReq) _then;

  /// Create a copy of AddSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? localId = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AddSubtask implements AddSubtaskReq {
  const _AddSubtask({required this.title, required this.localId});
  factory _AddSubtask.fromJson(Map<String, dynamic> json) =>
      _$AddSubtaskFromJson(json);

  @override
  final String title;
  @override
  final int localId;

  /// Create a copy of AddSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddSubtaskCopyWith<_AddSubtask> get copyWith =>
      __$AddSubtaskCopyWithImpl<_AddSubtask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddSubtaskToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddSubtask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.localId, localId) || other.localId == localId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, localId);

  @override
  String toString() {
    return 'AddSubtaskReq(title: $title, localId: $localId)';
  }
}

/// @nodoc
abstract mixin class _$AddSubtaskCopyWith<$Res>
    implements $AddSubtaskReqCopyWith<$Res> {
  factory _$AddSubtaskCopyWith(
          _AddSubtask value, $Res Function(_AddSubtask) _then) =
      __$AddSubtaskCopyWithImpl;
  @override
  @useResult
  $Res call({String title, int localId});
}

/// @nodoc
class __$AddSubtaskCopyWithImpl<$Res> implements _$AddSubtaskCopyWith<$Res> {
  __$AddSubtaskCopyWithImpl(this._self, this._then);

  final _AddSubtask _self;
  final $Res Function(_AddSubtask) _then;

  /// Create a copy of AddSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? localId = null,
  }) {
    return _then(_AddSubtask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on

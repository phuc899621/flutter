// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubtaskReq {
  String get title;

  /// Create a copy of SubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubtaskReqCopyWith<SubtaskReq> get copyWith =>
      _$SubtaskReqCopyWithImpl<SubtaskReq>(this as SubtaskReq, _$identity);

  /// Serializes this SubtaskReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubtaskReq &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @override
  String toString() {
    return 'SubtaskReq(title: $title)';
  }
}

/// @nodoc
abstract mixin class $SubtaskReqCopyWith<$Res> {
  factory $SubtaskReqCopyWith(
          SubtaskReq value, $Res Function(SubtaskReq) _then) =
      _$SubtaskReqCopyWithImpl;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$SubtaskReqCopyWithImpl<$Res> implements $SubtaskReqCopyWith<$Res> {
  _$SubtaskReqCopyWithImpl(this._self, this._then);

  final SubtaskReq _self;
  final $Res Function(SubtaskReq) _then;

  /// Create a copy of SubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SubtaskReq implements SubtaskReq {
  const _SubtaskReq({required this.title});
  factory _SubtaskReq.fromJson(Map<String, dynamic> json) =>
      _$SubtaskReqFromJson(json);

  @override
  final String title;

  /// Create a copy of SubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubtaskReqCopyWith<_SubtaskReq> get copyWith =>
      __$SubtaskReqCopyWithImpl<_SubtaskReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubtaskReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubtaskReq &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @override
  String toString() {
    return 'SubtaskReq(title: $title)';
  }
}

/// @nodoc
abstract mixin class _$SubtaskReqCopyWith<$Res>
    implements $SubtaskReqCopyWith<$Res> {
  factory _$SubtaskReqCopyWith(
          _SubtaskReq value, $Res Function(_SubtaskReq) _then) =
      __$SubtaskReqCopyWithImpl;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$SubtaskReqCopyWithImpl<$Res> implements _$SubtaskReqCopyWith<$Res> {
  __$SubtaskReqCopyWithImpl(this._self, this._then);

  final _SubtaskReq _self;
  final $Res Function(_SubtaskReq) _then;

  /// Create a copy of SubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
  }) {
    return _then(_SubtaskReq(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

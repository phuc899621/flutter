// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseData {
  String? get empty;

  /// Create a copy of BaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BaseDataCopyWith<BaseData> get copyWith =>
      _$BaseDataCopyWithImpl<BaseData>(this as BaseData, _$identity);

  /// Serializes this BaseData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BaseData &&
            (identical(other.empty, empty) || other.empty == empty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, empty);

  @override
  String toString() {
    return 'BaseData(empty: $empty)';
  }
}

/// @nodoc
abstract mixin class $BaseDataCopyWith<$Res> {
  factory $BaseDataCopyWith(BaseData value, $Res Function(BaseData) _then) =
      _$BaseDataCopyWithImpl;
  @useResult
  $Res call({String? empty});
}

/// @nodoc
class _$BaseDataCopyWithImpl<$Res> implements $BaseDataCopyWith<$Res> {
  _$BaseDataCopyWithImpl(this._self, this._then);

  final BaseData _self;
  final $Res Function(BaseData) _then;

  /// Create a copy of BaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empty = freezed,
  }) {
    return _then(_self.copyWith(
      empty: freezed == empty
          ? _self.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BaseData implements BaseData {
  const _BaseData({this.empty});
  factory _BaseData.fromJson(Map<String, dynamic> json) =>
      _$BaseDataFromJson(json);

  @override
  final String? empty;

  /// Create a copy of BaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BaseDataCopyWith<_BaseData> get copyWith =>
      __$BaseDataCopyWithImpl<_BaseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BaseDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BaseData &&
            (identical(other.empty, empty) || other.empty == empty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, empty);

  @override
  String toString() {
    return 'BaseData(empty: $empty)';
  }
}

/// @nodoc
abstract mixin class _$BaseDataCopyWith<$Res>
    implements $BaseDataCopyWith<$Res> {
  factory _$BaseDataCopyWith(_BaseData value, $Res Function(_BaseData) _then) =
      __$BaseDataCopyWithImpl;
  @override
  @useResult
  $Res call({String? empty});
}

/// @nodoc
class __$BaseDataCopyWithImpl<$Res> implements _$BaseDataCopyWith<$Res> {
  __$BaseDataCopyWithImpl(this._self, this._then);

  final _BaseData _self;
  final $Res Function(_BaseData) _then;

  /// Create a copy of BaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? empty = freezed,
  }) {
    return _then(_BaseData(
      empty: freezed == empty
          ? _self.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

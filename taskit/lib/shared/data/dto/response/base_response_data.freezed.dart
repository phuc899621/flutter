// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseData _$BaseDataFromJson(Map<String, dynamic> json) {
  return _BaseData.fromJson(json);
}

/// @nodoc
mixin _$BaseData {
  String? get empty => throw _privateConstructorUsedError;

  /// Serializes this BaseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseDataCopyWith<BaseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseDataCopyWith<$Res> {
  factory $BaseDataCopyWith(BaseData value, $Res Function(BaseData) then) =
      _$BaseDataCopyWithImpl<$Res, BaseData>;
  @useResult
  $Res call({String? empty});
}

/// @nodoc
class _$BaseDataCopyWithImpl<$Res, $Val extends BaseData>
    implements $BaseDataCopyWith<$Res> {
  _$BaseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empty = freezed,
  }) {
    return _then(_value.copyWith(
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseDataImplCopyWith<$Res>
    implements $BaseDataCopyWith<$Res> {
  factory _$$BaseDataImplCopyWith(
          _$BaseDataImpl value, $Res Function(_$BaseDataImpl) then) =
      __$$BaseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? empty});
}

/// @nodoc
class __$$BaseDataImplCopyWithImpl<$Res>
    extends _$BaseDataCopyWithImpl<$Res, _$BaseDataImpl>
    implements _$$BaseDataImplCopyWith<$Res> {
  __$$BaseDataImplCopyWithImpl(
      _$BaseDataImpl _value, $Res Function(_$BaseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empty = freezed,
  }) {
    return _then(_$BaseDataImpl(
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseDataImpl implements _BaseData {
  const _$BaseDataImpl({this.empty});

  factory _$BaseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseDataImplFromJson(json);

  @override
  final String? empty;

  @override
  String toString() {
    return 'BaseData(empty: $empty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseDataImpl &&
            (identical(other.empty, empty) || other.empty == empty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, empty);

  /// Create a copy of BaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseDataImplCopyWith<_$BaseDataImpl> get copyWith =>
      __$$BaseDataImplCopyWithImpl<_$BaseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseDataImplToJson(
      this,
    );
  }
}

abstract class _BaseData implements BaseData {
  const factory _BaseData({final String? empty}) = _$BaseDataImpl;

  factory _BaseData.fromJson(Map<String, dynamic> json) =
      _$BaseDataImpl.fromJson;

  @override
  String? get empty;

  /// Create a copy of BaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseDataImplCopyWith<_$BaseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

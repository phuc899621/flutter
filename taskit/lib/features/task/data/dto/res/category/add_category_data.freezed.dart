// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_category_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCategoryData {
  int get localId;
  String get id;

  /// Create a copy of AddCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddCategoryDataCopyWith<AddCategoryData> get copyWith =>
      _$AddCategoryDataCopyWithImpl<AddCategoryData>(
          this as AddCategoryData, _$identity);

  /// Serializes this AddCategoryData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddCategoryData &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localId, id);

  @override
  String toString() {
    return 'AddCategoryData(localId: $localId, id: $id)';
  }
}

/// @nodoc
abstract mixin class $AddCategoryDataCopyWith<$Res> {
  factory $AddCategoryDataCopyWith(
          AddCategoryData value, $Res Function(AddCategoryData) _then) =
      _$AddCategoryDataCopyWithImpl;
  @useResult
  $Res call({int localId, String id});
}

/// @nodoc
class _$AddCategoryDataCopyWithImpl<$Res>
    implements $AddCategoryDataCopyWith<$Res> {
  _$AddCategoryDataCopyWithImpl(this._self, this._then);

  final AddCategoryData _self;
  final $Res Function(AddCategoryData) _then;

  /// Create a copy of AddCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AddCategoryData implements AddCategoryData {
  const _AddCategoryData({required this.localId, required this.id});
  factory _AddCategoryData.fromJson(Map<String, dynamic> json) =>
      _$AddCategoryDataFromJson(json);

  @override
  final int localId;
  @override
  final String id;

  /// Create a copy of AddCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddCategoryDataCopyWith<_AddCategoryData> get copyWith =>
      __$AddCategoryDataCopyWithImpl<_AddCategoryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddCategoryDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddCategoryData &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localId, id);

  @override
  String toString() {
    return 'AddCategoryData(localId: $localId, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$AddCategoryDataCopyWith<$Res>
    implements $AddCategoryDataCopyWith<$Res> {
  factory _$AddCategoryDataCopyWith(
          _AddCategoryData value, $Res Function(_AddCategoryData) _then) =
      __$AddCategoryDataCopyWithImpl;
  @override
  @useResult
  $Res call({int localId, String id});
}

/// @nodoc
class __$AddCategoryDataCopyWithImpl<$Res>
    implements _$AddCategoryDataCopyWith<$Res> {
  __$AddCategoryDataCopyWithImpl(this._self, this._then);

  final _AddCategoryData _self;
  final $Res Function(_AddCategoryData) _then;

  /// Create a copy of AddCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = null,
    Object? id = null,
  }) {
    return _then(_AddCategoryData(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

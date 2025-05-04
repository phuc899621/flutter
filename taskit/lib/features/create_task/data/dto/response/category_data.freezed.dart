// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryData {
  List<String> get categories;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      _$CategoryDataCopyWithImpl<CategoryData>(
          this as CategoryData, _$identity);

  /// Serializes this CategoryData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryData &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'CategoryData(categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $CategoryDataCopyWith<$Res> {
  factory $CategoryDataCopyWith(
          CategoryData value, $Res Function(CategoryData) _then) =
      _$CategoryDataCopyWithImpl;
  @useResult
  $Res call({List<String> categories});
}

/// @nodoc
class _$CategoryDataCopyWithImpl<$Res> implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(this._self, this._then);

  final CategoryData _self;
  final $Res Function(CategoryData) _then;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_self.copyWith(
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryData implements CategoryData {
  const _CategoryData({required final List<String> categories})
      : _categories = categories;
  factory _CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryDataCopyWith<_CategoryData> get copyWith =>
      __$CategoryDataCopyWithImpl<_CategoryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryData &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'CategoryData(categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$CategoryDataCopyWith<$Res>
    implements $CategoryDataCopyWith<$Res> {
  factory _$CategoryDataCopyWith(
          _CategoryData value, $Res Function(_CategoryData) _then) =
      __$CategoryDataCopyWithImpl;
  @override
  @useResult
  $Res call({List<String> categories});
}

/// @nodoc
class __$CategoryDataCopyWithImpl<$Res>
    implements _$CategoryDataCopyWith<$Res> {
  __$CategoryDataCopyWithImpl(this._self, this._then);

  final _CategoryData _self;
  final $Res Function(_CategoryData) _then;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categories = null,
  }) {
    return _then(_CategoryData(
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on

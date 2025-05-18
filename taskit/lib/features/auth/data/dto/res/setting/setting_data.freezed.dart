// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingData {
  @JsonKey(name: '_id')
  String get id;
  String get userId;
  bool get isNotificationEnabled;
  String get language;
  String get theme;
  int get remindBefore;
  List<String> get categories;

  /// Create a copy of SettingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingDataCopyWith<SettingData> get copyWith =>
      _$SettingDataCopyWithImpl<SettingData>(this as SettingData, _$identity);

  /// Serializes this SettingData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isNotificationEnabled, isNotificationEnabled) ||
                other.isNotificationEnabled == isNotificationEnabled) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.remindBefore, remindBefore) ||
                other.remindBefore == remindBefore) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      isNotificationEnabled,
      language,
      theme,
      remindBefore,
      const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'SettingData(id: $id, userId: $userId, isNotificationEnabled: $isNotificationEnabled, language: $language, theme: $theme, remindBefore: $remindBefore, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $SettingDataCopyWith<$Res> {
  factory $SettingDataCopyWith(
          SettingData value, $Res Function(SettingData) _then) =
      _$SettingDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String userId,
      bool isNotificationEnabled,
      String language,
      String theme,
      int remindBefore,
      List<String> categories});
}

/// @nodoc
class _$SettingDataCopyWithImpl<$Res> implements $SettingDataCopyWith<$Res> {
  _$SettingDataCopyWithImpl(this._self, this._then);

  final SettingData _self;
  final $Res Function(SettingData) _then;

  /// Create a copy of SettingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? isNotificationEnabled = null,
    Object? language = null,
    Object? theme = null,
    Object? remindBefore = null,
    Object? categories = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isNotificationEnabled: null == isNotificationEnabled
          ? _self.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      remindBefore: null == remindBefore
          ? _self.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SettingData implements SettingData {
  const _SettingData(
      {@JsonKey(name: '_id') required this.id,
      required this.userId,
      required this.isNotificationEnabled,
      required this.language,
      required this.theme,
      required this.remindBefore,
      required final List<String> categories})
      : _categories = categories;
  factory _SettingData.fromJson(Map<String, dynamic> json) =>
      _$SettingDataFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String userId;
  @override
  final bool isNotificationEnabled;
  @override
  final String language;
  @override
  final String theme;
  @override
  final int remindBefore;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of SettingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingDataCopyWith<_SettingData> get copyWith =>
      __$SettingDataCopyWithImpl<_SettingData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SettingDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isNotificationEnabled, isNotificationEnabled) ||
                other.isNotificationEnabled == isNotificationEnabled) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.remindBefore, remindBefore) ||
                other.remindBefore == remindBefore) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      isNotificationEnabled,
      language,
      theme,
      remindBefore,
      const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'SettingData(id: $id, userId: $userId, isNotificationEnabled: $isNotificationEnabled, language: $language, theme: $theme, remindBefore: $remindBefore, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$SettingDataCopyWith<$Res>
    implements $SettingDataCopyWith<$Res> {
  factory _$SettingDataCopyWith(
          _SettingData value, $Res Function(_SettingData) _then) =
      __$SettingDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String userId,
      bool isNotificationEnabled,
      String language,
      String theme,
      int remindBefore,
      List<String> categories});
}

/// @nodoc
class __$SettingDataCopyWithImpl<$Res> implements _$SettingDataCopyWith<$Res> {
  __$SettingDataCopyWithImpl(this._self, this._then);

  final _SettingData _self;
  final $Res Function(_SettingData) _then;

  /// Create a copy of SettingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? isNotificationEnabled = null,
    Object? language = null,
    Object? theme = null,
    Object? remindBefore = null,
    Object? categories = null,
  }) {
    return _then(_SettingData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isNotificationEnabled: null == isNotificationEnabled
          ? _self.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      remindBefore: null == remindBefore
          ? _self.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on

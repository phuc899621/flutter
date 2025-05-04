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
  bool get isNotificationEnabled;
  String get language;
  String get theme;
  int get remindBefore;
  List<String> get category;

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
            (identical(other.isNotificationEnabled, isNotificationEnabled) ||
                other.isNotificationEnabled == isNotificationEnabled) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.remindBefore, remindBefore) ||
                other.remindBefore == remindBefore) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isNotificationEnabled, language,
      theme, remindBefore, const DeepCollectionEquality().hash(category));

  @override
  String toString() {
    return 'SettingData(isNotificationEnabled: $isNotificationEnabled, language: $language, theme: $theme, remindBefore: $remindBefore, category: $category)';
  }
}

/// @nodoc
abstract mixin class $SettingDataCopyWith<$Res> {
  factory $SettingDataCopyWith(
          SettingData value, $Res Function(SettingData) _then) =
      _$SettingDataCopyWithImpl;
  @useResult
  $Res call(
      {bool isNotificationEnabled,
      String language,
      String theme,
      int remindBefore,
      List<String> category});
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
    Object? isNotificationEnabled = null,
    Object? language = null,
    Object? theme = null,
    Object? remindBefore = null,
    Object? category = null,
  }) {
    return _then(_self.copyWith(
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
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SettingData implements SettingData {
  const _SettingData(
      {required this.isNotificationEnabled,
      required this.language,
      required this.theme,
      required this.remindBefore,
      required final List<String> category})
      : _category = category;
  factory _SettingData.fromJson(Map<String, dynamic> json) =>
      _$SettingDataFromJson(json);

  @override
  final bool isNotificationEnabled;
  @override
  final String language;
  @override
  final String theme;
  @override
  final int remindBefore;
  final List<String> _category;
  @override
  List<String> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
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
            (identical(other.isNotificationEnabled, isNotificationEnabled) ||
                other.isNotificationEnabled == isNotificationEnabled) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.remindBefore, remindBefore) ||
                other.remindBefore == remindBefore) &&
            const DeepCollectionEquality().equals(other._category, _category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isNotificationEnabled, language,
      theme, remindBefore, const DeepCollectionEquality().hash(_category));

  @override
  String toString() {
    return 'SettingData(isNotificationEnabled: $isNotificationEnabled, language: $language, theme: $theme, remindBefore: $remindBefore, category: $category)';
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
      {bool isNotificationEnabled,
      String language,
      String theme,
      int remindBefore,
      List<String> category});
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
    Object? isNotificationEnabled = null,
    Object? language = null,
    Object? theme = null,
    Object? remindBefore = null,
    Object? category = null,
  }) {
    return _then(_SettingData(
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
      category: null == category
          ? _self._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on

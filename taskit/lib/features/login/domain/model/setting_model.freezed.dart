// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingModel {
  bool get isNotificationEnabled;
  int get remindBefore;
  List<String> get categories;
  String get language;
  String get theme;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingModelCopyWith<SettingModel> get copyWith =>
      _$SettingModelCopyWithImpl<SettingModel>(
          this as SettingModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingModel &&
            (identical(other.isNotificationEnabled, isNotificationEnabled) ||
                other.isNotificationEnabled == isNotificationEnabled) &&
            (identical(other.remindBefore, remindBefore) ||
                other.remindBefore == remindBefore) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isNotificationEnabled,
      remindBefore,
      const DeepCollectionEquality().hash(categories),
      language,
      theme);

  @override
  String toString() {
    return 'SettingModel(isNotificationEnabled: $isNotificationEnabled, remindBefore: $remindBefore, categories: $categories, language: $language, theme: $theme)';
  }
}

/// @nodoc
abstract mixin class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) _then) =
      _$SettingModelCopyWithImpl;
  @useResult
  $Res call(
      {bool isNotificationEnabled,
      int remindBefore,
      List<String> categories,
      String language,
      String theme});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res> implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._self, this._then);

  final SettingModel _self;
  final $Res Function(SettingModel) _then;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNotificationEnabled = null,
    Object? remindBefore = null,
    Object? categories = null,
    Object? language = null,
    Object? theme = null,
  }) {
    return _then(_self.copyWith(
      isNotificationEnabled: null == isNotificationEnabled
          ? _self.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      remindBefore: null == remindBefore
          ? _self.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SettingModel implements SettingModel {
  const _SettingModel(
      {required this.isNotificationEnabled,
      required this.remindBefore,
      required final List<String> categories,
      required this.language,
      required this.theme})
      : _categories = categories;

  @override
  final bool isNotificationEnabled;
  @override
  final int remindBefore;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String language;
  @override
  final String theme;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingModelCopyWith<_SettingModel> get copyWith =>
      __$SettingModelCopyWithImpl<_SettingModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingModel &&
            (identical(other.isNotificationEnabled, isNotificationEnabled) ||
                other.isNotificationEnabled == isNotificationEnabled) &&
            (identical(other.remindBefore, remindBefore) ||
                other.remindBefore == remindBefore) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isNotificationEnabled,
      remindBefore,
      const DeepCollectionEquality().hash(_categories),
      language,
      theme);

  @override
  String toString() {
    return 'SettingModel(isNotificationEnabled: $isNotificationEnabled, remindBefore: $remindBefore, categories: $categories, language: $language, theme: $theme)';
  }
}

/// @nodoc
abstract mixin class _$SettingModelCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$SettingModelCopyWith(
          _SettingModel value, $Res Function(_SettingModel) _then) =
      __$SettingModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isNotificationEnabled,
      int remindBefore,
      List<String> categories,
      String language,
      String theme});
}

/// @nodoc
class __$SettingModelCopyWithImpl<$Res>
    implements _$SettingModelCopyWith<$Res> {
  __$SettingModelCopyWithImpl(this._self, this._then);

  final _SettingModel _self;
  final $Res Function(_SettingModel) _then;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isNotificationEnabled = null,
    Object? remindBefore = null,
    Object? categories = null,
    Object? language = null,
    Object? theme = null,
  }) {
    return _then(_SettingModel(
      isNotificationEnabled: null == isNotificationEnabled
          ? _self.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      remindBefore: null == remindBefore
          ? _self.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

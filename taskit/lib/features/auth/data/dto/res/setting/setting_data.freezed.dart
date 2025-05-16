// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingData _$SettingDataFromJson(Map<String, dynamic> json) {
  return _SettingData.fromJson(json);
}

/// @nodoc
mixin _$SettingData {
  bool get isNotificationEnabled => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  int get remindBefore => throw _privateConstructorUsedError;
  List<String> get category => throw _privateConstructorUsedError;

  /// Serializes this SettingData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingDataCopyWith<SettingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingDataCopyWith<$Res> {
  factory $SettingDataCopyWith(
          SettingData value, $Res Function(SettingData) then) =
      _$SettingDataCopyWithImpl<$Res, SettingData>;
  @useResult
  $Res call(
      {bool isNotificationEnabled,
      String language,
      String theme,
      int remindBefore,
      List<String> category});
}

/// @nodoc
class _$SettingDataCopyWithImpl<$Res, $Val extends SettingData>
    implements $SettingDataCopyWith<$Res> {
  _$SettingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      isNotificationEnabled: null == isNotificationEnabled
          ? _value.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      remindBefore: null == remindBefore
          ? _value.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingDataImplCopyWith<$Res>
    implements $SettingDataCopyWith<$Res> {
  factory _$$SettingDataImplCopyWith(
          _$SettingDataImpl value, $Res Function(_$SettingDataImpl) then) =
      __$$SettingDataImplCopyWithImpl<$Res>;
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
class __$$SettingDataImplCopyWithImpl<$Res>
    extends _$SettingDataCopyWithImpl<$Res, _$SettingDataImpl>
    implements _$$SettingDataImplCopyWith<$Res> {
  __$$SettingDataImplCopyWithImpl(
      _$SettingDataImpl _value, $Res Function(_$SettingDataImpl) _then)
      : super(_value, _then);

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
    return _then(_$SettingDataImpl(
      isNotificationEnabled: null == isNotificationEnabled
          ? _value.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      remindBefore: null == remindBefore
          ? _value.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingDataImpl implements _SettingData {
  const _$SettingDataImpl(
      {required this.isNotificationEnabled,
      required this.language,
      required this.theme,
      required this.remindBefore,
      required final List<String> category})
      : _category = category;

  factory _$SettingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingDataImplFromJson(json);

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

  @override
  String toString() {
    return 'SettingData(isNotificationEnabled: $isNotificationEnabled, language: $language, theme: $theme, remindBefore: $remindBefore, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingDataImpl &&
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

  /// Create a copy of SettingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingDataImplCopyWith<_$SettingDataImpl> get copyWith =>
      __$$SettingDataImplCopyWithImpl<_$SettingDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingDataImplToJson(
      this,
    );
  }
}

abstract class _SettingData implements SettingData {
  const factory _SettingData(
      {required final bool isNotificationEnabled,
      required final String language,
      required final String theme,
      required final int remindBefore,
      required final List<String> category}) = _$SettingDataImpl;

  factory _SettingData.fromJson(Map<String, dynamic> json) =
      _$SettingDataImpl.fromJson;

  @override
  bool get isNotificationEnabled;
  @override
  String get language;
  @override
  String get theme;
  @override
  int get remindBefore;
  @override
  List<String> get category;

  /// Create a copy of SettingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingDataImplCopyWith<_$SettingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

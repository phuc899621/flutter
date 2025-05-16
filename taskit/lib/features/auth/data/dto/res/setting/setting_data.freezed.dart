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
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  bool get isNotificationEnabled => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  int get remindBefore => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;

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
      {@JsonKey(name: '_id') String id,
      String userId,
      bool isNotificationEnabled,
      String language,
      String theme,
      int remindBefore,
      List<String> categories});
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
    Object? id = null,
    Object? userId = null,
    Object? isNotificationEnabled = null,
    Object? language = null,
    Object? theme = null,
    Object? remindBefore = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
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
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: '_id') String id,
      String userId,
      bool isNotificationEnabled,
      String language,
      String theme,
      int remindBefore,
      List<String> categories});
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
    Object? id = null,
    Object? userId = null,
    Object? isNotificationEnabled = null,
    Object? language = null,
    Object? theme = null,
    Object? remindBefore = null,
    Object? categories = null,
  }) {
    return _then(_$SettingDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
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
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingDataImpl implements _SettingData {
  const _$SettingDataImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.userId,
      required this.isNotificationEnabled,
      required this.language,
      required this.theme,
      required this.remindBefore,
      required final List<String> categories})
      : _categories = categories;

  factory _$SettingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingDataImplFromJson(json);

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

  @override
  String toString() {
    return 'SettingData(id: $id, userId: $userId, isNotificationEnabled: $isNotificationEnabled, language: $language, theme: $theme, remindBefore: $remindBefore, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingDataImpl &&
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
      {@JsonKey(name: '_id') required final String id,
      required final String userId,
      required final bool isNotificationEnabled,
      required final String language,
      required final String theme,
      required final int remindBefore,
      required final List<String> categories}) = _$SettingDataImpl;

  factory _SettingData.fromJson(Map<String, dynamic> json) =
      _$SettingDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get userId;
  @override
  bool get isNotificationEnabled;
  @override
  String get language;
  @override
  String get theme;
  @override
  int get remindBefore;
  @override
  List<String> get categories;

  /// Create a copy of SettingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingDataImplCopyWith<_$SettingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

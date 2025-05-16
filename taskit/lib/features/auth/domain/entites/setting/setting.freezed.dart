// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingModel {
  bool get isNotificationEnabled => throw _privateConstructorUsedError;
  int get remindBefore => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingModelCopyWith<SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res, SettingModel>;
  @useResult
  $Res call(
      {bool isNotificationEnabled,
      int remindBefore,
      List<String> categories,
      String language,
      String theme});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res, $Val extends SettingModel>
    implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      isNotificationEnabled: null == isNotificationEnabled
          ? _value.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      remindBefore: null == remindBefore
          ? _value.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingModelImplCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$$SettingModelImplCopyWith(
          _$SettingModelImpl value, $Res Function(_$SettingModelImpl) then) =
      __$$SettingModelImplCopyWithImpl<$Res>;
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
class __$$SettingModelImplCopyWithImpl<$Res>
    extends _$SettingModelCopyWithImpl<$Res, _$SettingModelImpl>
    implements _$$SettingModelImplCopyWith<$Res> {
  __$$SettingModelImplCopyWithImpl(
      _$SettingModelImpl _value, $Res Function(_$SettingModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$SettingModelImpl(
      isNotificationEnabled: null == isNotificationEnabled
          ? _value.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      remindBefore: null == remindBefore
          ? _value.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SettingModelImpl implements _SettingModel {
  const _$SettingModelImpl(
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

  @override
  String toString() {
    return 'SettingModel(isNotificationEnabled: $isNotificationEnabled, remindBefore: $remindBefore, categories: $categories, language: $language, theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingModelImpl &&
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

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingModelImplCopyWith<_$SettingModelImpl> get copyWith =>
      __$$SettingModelImplCopyWithImpl<_$SettingModelImpl>(this, _$identity);
}

abstract class _SettingModel implements SettingModel {
  const factory _SettingModel(
      {required final bool isNotificationEnabled,
      required final int remindBefore,
      required final List<String> categories,
      required final String language,
      required final String theme}) = _$SettingModelImpl;

  @override
  bool get isNotificationEnabled;
  @override
  int get remindBefore;
  @override
  List<String> get categories;
  @override
  String get language;
  @override
  String get theme;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingModelImplCopyWith<_$SettingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

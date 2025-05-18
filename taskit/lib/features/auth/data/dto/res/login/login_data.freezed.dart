// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginData {
  String get token;
  SettingData get settings;
  UserData get user;
  TaskData get tasks;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginDataCopyWith<LoginData> get copyWith =>
      _$LoginDataCopyWithImpl<LoginData>(this as LoginData, _$identity);

  /// Serializes this LoginData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginData &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.tasks, tasks) || other.tasks == tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, settings, user, tasks);

  @override
  String toString() {
    return 'LoginData(token: $token, settings: $settings, user: $user, tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) _then) =
      _$LoginDataCopyWithImpl;
  @useResult
  $Res call(
      {String token, SettingData settings, UserData user, TaskData tasks});

  $SettingDataCopyWith<$Res> get settings;
  $UserDataCopyWith<$Res> get user;
  $TaskDataCopyWith<$Res> get tasks;
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res> implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._self, this._then);

  final LoginData _self;
  final $Res Function(LoginData) _then;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? settings = null,
    Object? user = null,
    Object? tasks = null,
  }) {
    return _then(_self.copyWith(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingData,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as TaskData,
    ));
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingDataCopyWith<$Res> get settings {
    return $SettingDataCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get user {
    return $UserDataCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskDataCopyWith<$Res> get tasks {
    return $TaskDataCopyWith<$Res>(_self.tasks, (value) {
      return _then(_self.copyWith(tasks: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _LoginData implements LoginData {
  const _LoginData(
      {required this.token,
      required this.settings,
      required this.user,
      required this.tasks});
  factory _LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  @override
  final String token;
  @override
  final SettingData settings;
  @override
  final UserData user;
  @override
  final TaskData tasks;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginDataCopyWith<_LoginData> get copyWith =>
      __$LoginDataCopyWithImpl<_LoginData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginData &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.tasks, tasks) || other.tasks == tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, settings, user, tasks);

  @override
  String toString() {
    return 'LoginData(token: $token, settings: $settings, user: $user, tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class _$LoginDataCopyWith<$Res>
    implements $LoginDataCopyWith<$Res> {
  factory _$LoginDataCopyWith(
          _LoginData value, $Res Function(_LoginData) _then) =
      __$LoginDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String token, SettingData settings, UserData user, TaskData tasks});

  @override
  $SettingDataCopyWith<$Res> get settings;
  @override
  $UserDataCopyWith<$Res> get user;
  @override
  $TaskDataCopyWith<$Res> get tasks;
}

/// @nodoc
class __$LoginDataCopyWithImpl<$Res> implements _$LoginDataCopyWith<$Res> {
  __$LoginDataCopyWithImpl(this._self, this._then);

  final _LoginData _self;
  final $Res Function(_LoginData) _then;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? settings = null,
    Object? user = null,
    Object? tasks = null,
  }) {
    return _then(_LoginData(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingData,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as TaskData,
    ));
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingDataCopyWith<$Res> get settings {
    return $SettingDataCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get user {
    return $UserDataCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskDataCopyWith<$Res> get tasks {
    return $TaskDataCopyWith<$Res>(_self.tasks, (value) {
      return _then(_self.copyWith(tasks: value));
    });
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserData {
  @JsonKey(name: '_id')
  String get id;
  String get name;
  String get email;
  String get avatar;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<UserData> get copyWith =>
      _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, avatar);

  @override
  String toString() {
    return 'UserData(id: $id, name: $name, email: $email, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) =
      _$UserDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String email,
      String avatar});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res> implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._self, this._then);

  final UserData _self;
  final $Res Function(UserData) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? avatar = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserData implements UserData {
  const _UserData(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.email,
      required this.avatar});
  factory _UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String avatar;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDataCopyWith<_UserData> get copyWith =>
      __$UserDataCopyWithImpl<_UserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, avatar);

  @override
  String toString() {
    return 'UserData(id: $id, name: $name, email: $email, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class _$UserDataCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) _then) =
      __$UserDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String email,
      String avatar});
}

/// @nodoc
class __$UserDataCopyWithImpl<$Res> implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(this._self, this._then);

  final _UserData _self;
  final $Res Function(_UserData) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? avatar = null,
  }) {
    return _then(_UserData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

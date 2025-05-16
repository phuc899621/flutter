// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseModel {}

/// @nodoc
abstract class $BaseModelCopyWith<$Res> {
  factory $BaseModelCopyWith(BaseModel value, $Res Function(BaseModel) then) =
      _$BaseModelCopyWithImpl<$Res, BaseModel>;
}

/// @nodoc
class _$BaseModelCopyWithImpl<$Res, $Val extends BaseModel>
    implements $BaseModelCopyWith<$Res> {
  _$BaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BaseModelImplCopyWith<$Res> {
  factory _$$BaseModelImplCopyWith(
          _$BaseModelImpl value, $Res Function(_$BaseModelImpl) then) =
      __$$BaseModelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BaseModelImplCopyWithImpl<$Res>
    extends _$BaseModelCopyWithImpl<$Res, _$BaseModelImpl>
    implements _$$BaseModelImplCopyWith<$Res> {
  __$$BaseModelImplCopyWithImpl(
      _$BaseModelImpl _value, $Res Function(_$BaseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaseModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BaseModelImpl implements _BaseModel {
  const _$BaseModelImpl();

  @override
  String toString() {
    return 'BaseModel()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BaseModelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _BaseModel implements BaseModel {
  const factory _BaseModel() = _$BaseModelImpl;
}

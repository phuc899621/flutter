// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
DeviceRequest _$DeviceRequestFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'register':
          return DeviceRegisterRequest.fromJson(
            json
          );
                case 'update':
          return DeviceUpdateRequest.fromJson(
            json
          );
                case 'remove':
          return DeviceRemoveRequest.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'DeviceRequest',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$DeviceRequest {

 String get deviceId;
/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceRequestCopyWith<DeviceRequest> get copyWith => _$DeviceRequestCopyWithImpl<DeviceRequest>(this as DeviceRequest, _$identity);

  /// Serializes this DeviceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceRequest&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString() {
  return 'DeviceRequest(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $DeviceRequestCopyWith<$Res>  {
  factory $DeviceRequestCopyWith(DeviceRequest value, $Res Function(DeviceRequest) _then) = _$DeviceRequestCopyWithImpl;
@useResult
$Res call({
 String deviceId
});




}
/// @nodoc
class _$DeviceRequestCopyWithImpl<$Res>
    implements $DeviceRequestCopyWith<$Res> {
  _$DeviceRequestCopyWithImpl(this._self, this._then);

  final DeviceRequest _self;
  final $Res Function(DeviceRequest) _then;

/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceRequest].
extension DeviceRequestPatterns on DeviceRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeviceRegisterRequest value)?  register,TResult Function( DeviceUpdateRequest value)?  update,TResult Function( DeviceRemoveRequest value)?  remove,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeviceRegisterRequest() when register != null:
return register(_that);case DeviceUpdateRequest() when update != null:
return update(_that);case DeviceRemoveRequest() when remove != null:
return remove(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeviceRegisterRequest value)  register,required TResult Function( DeviceUpdateRequest value)  update,required TResult Function( DeviceRemoveRequest value)  remove,}){
final _that = this;
switch (_that) {
case DeviceRegisterRequest():
return register(_that);case DeviceUpdateRequest():
return update(_that);case DeviceRemoveRequest():
return remove(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeviceRegisterRequest value)?  register,TResult? Function( DeviceUpdateRequest value)?  update,TResult? Function( DeviceRemoveRequest value)?  remove,}){
final _that = this;
switch (_that) {
case DeviceRegisterRequest() when register != null:
return register(_that);case DeviceUpdateRequest() when update != null:
return update(_that);case DeviceRemoveRequest() when remove != null:
return remove(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String fcmToken,  String deviceId,  String platform)?  register,TResult Function( String fcmToken,  String deviceId,  String platform)?  update,TResult Function( String deviceId)?  remove,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeviceRegisterRequest() when register != null:
return register(_that.fcmToken,_that.deviceId,_that.platform);case DeviceUpdateRequest() when update != null:
return update(_that.fcmToken,_that.deviceId,_that.platform);case DeviceRemoveRequest() when remove != null:
return remove(_that.deviceId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String fcmToken,  String deviceId,  String platform)  register,required TResult Function( String fcmToken,  String deviceId,  String platform)  update,required TResult Function( String deviceId)  remove,}) {final _that = this;
switch (_that) {
case DeviceRegisterRequest():
return register(_that.fcmToken,_that.deviceId,_that.platform);case DeviceUpdateRequest():
return update(_that.fcmToken,_that.deviceId,_that.platform);case DeviceRemoveRequest():
return remove(_that.deviceId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String fcmToken,  String deviceId,  String platform)?  register,TResult? Function( String fcmToken,  String deviceId,  String platform)?  update,TResult? Function( String deviceId)?  remove,}) {final _that = this;
switch (_that) {
case DeviceRegisterRequest() when register != null:
return register(_that.fcmToken,_that.deviceId,_that.platform);case DeviceUpdateRequest() when update != null:
return update(_that.fcmToken,_that.deviceId,_that.platform);case DeviceRemoveRequest() when remove != null:
return remove(_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class DeviceRegisterRequest implements DeviceRequest {
  const DeviceRegisterRequest({required this.fcmToken, required this.deviceId, required this.platform, final  String? $type}): $type = $type ?? 'register';
  factory DeviceRegisterRequest.fromJson(Map<String, dynamic> json) => _$DeviceRegisterRequestFromJson(json);

 final  String fcmToken;
@override final  String deviceId;
 final  String platform;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceRegisterRequestCopyWith<DeviceRegisterRequest> get copyWith => _$DeviceRegisterRequestCopyWithImpl<DeviceRegisterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceRegisterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceRegisterRequest&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.platform, platform) || other.platform == platform));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fcmToken,deviceId,platform);

@override
String toString() {
  return 'DeviceRequest.register(fcmToken: $fcmToken, deviceId: $deviceId, platform: $platform)';
}


}

/// @nodoc
abstract mixin class $DeviceRegisterRequestCopyWith<$Res> implements $DeviceRequestCopyWith<$Res> {
  factory $DeviceRegisterRequestCopyWith(DeviceRegisterRequest value, $Res Function(DeviceRegisterRequest) _then) = _$DeviceRegisterRequestCopyWithImpl;
@override @useResult
$Res call({
 String fcmToken, String deviceId, String platform
});




}
/// @nodoc
class _$DeviceRegisterRequestCopyWithImpl<$Res>
    implements $DeviceRegisterRequestCopyWith<$Res> {
  _$DeviceRegisterRequestCopyWithImpl(this._self, this._then);

  final DeviceRegisterRequest _self;
  final $Res Function(DeviceRegisterRequest) _then;

/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fcmToken = null,Object? deviceId = null,Object? platform = null,}) {
  return _then(DeviceRegisterRequest(
fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class DeviceUpdateRequest implements DeviceRequest {
  const DeviceUpdateRequest({required this.fcmToken, required this.deviceId, required this.platform, final  String? $type}): $type = $type ?? 'update';
  factory DeviceUpdateRequest.fromJson(Map<String, dynamic> json) => _$DeviceUpdateRequestFromJson(json);

 final  String fcmToken;
@override final  String deviceId;
 final  String platform;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceUpdateRequestCopyWith<DeviceUpdateRequest> get copyWith => _$DeviceUpdateRequestCopyWithImpl<DeviceUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceUpdateRequest&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.platform, platform) || other.platform == platform));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fcmToken,deviceId,platform);

@override
String toString() {
  return 'DeviceRequest.update(fcmToken: $fcmToken, deviceId: $deviceId, platform: $platform)';
}


}

/// @nodoc
abstract mixin class $DeviceUpdateRequestCopyWith<$Res> implements $DeviceRequestCopyWith<$Res> {
  factory $DeviceUpdateRequestCopyWith(DeviceUpdateRequest value, $Res Function(DeviceUpdateRequest) _then) = _$DeviceUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
 String fcmToken, String deviceId, String platform
});




}
/// @nodoc
class _$DeviceUpdateRequestCopyWithImpl<$Res>
    implements $DeviceUpdateRequestCopyWith<$Res> {
  _$DeviceUpdateRequestCopyWithImpl(this._self, this._then);

  final DeviceUpdateRequest _self;
  final $Res Function(DeviceUpdateRequest) _then;

/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fcmToken = null,Object? deviceId = null,Object? platform = null,}) {
  return _then(DeviceUpdateRequest(
fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class DeviceRemoveRequest implements DeviceRequest {
  const DeviceRemoveRequest({required this.deviceId, final  String? $type}): $type = $type ?? 'remove';
  factory DeviceRemoveRequest.fromJson(Map<String, dynamic> json) => _$DeviceRemoveRequestFromJson(json);

@override final  String deviceId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceRemoveRequestCopyWith<DeviceRemoveRequest> get copyWith => _$DeviceRemoveRequestCopyWithImpl<DeviceRemoveRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceRemoveRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceRemoveRequest&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString() {
  return 'DeviceRequest.remove(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $DeviceRemoveRequestCopyWith<$Res> implements $DeviceRequestCopyWith<$Res> {
  factory $DeviceRemoveRequestCopyWith(DeviceRemoveRequest value, $Res Function(DeviceRemoveRequest) _then) = _$DeviceRemoveRequestCopyWithImpl;
@override @useResult
$Res call({
 String deviceId
});




}
/// @nodoc
class _$DeviceRemoveRequestCopyWithImpl<$Res>
    implements $DeviceRemoveRequestCopyWith<$Res> {
  _$DeviceRemoveRequestCopyWithImpl(this._self, this._then);

  final DeviceRemoveRequest _self;
  final $Res Function(DeviceRemoveRequest) _then;

/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,}) {
  return _then(DeviceRemoveRequest(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

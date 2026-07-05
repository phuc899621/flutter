// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceRegisterRequest _$DeviceRegisterRequestFromJson(
  Map<String, dynamic> json,
) => DeviceRegisterRequest(
  fcmToken: json['fcmToken'] as String,
  deviceId: json['deviceId'] as String,
  platform: json['platform'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$DeviceRegisterRequestToJson(
  DeviceRegisterRequest instance,
) => <String, dynamic>{
  'fcmToken': instance.fcmToken,
  'deviceId': instance.deviceId,
  'platform': instance.platform,
  'runtimeType': instance.$type,
};

DeviceUpdateRequest _$DeviceUpdateRequestFromJson(Map<String, dynamic> json) =>
    DeviceUpdateRequest(
      fcmToken: json['fcmToken'] as String,
      deviceId: json['deviceId'] as String,
      platform: json['platform'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$DeviceUpdateRequestToJson(
  DeviceUpdateRequest instance,
) => <String, dynamic>{
  'fcmToken': instance.fcmToken,
  'deviceId': instance.deviceId,
  'platform': instance.platform,
  'runtimeType': instance.$type,
};

DeviceRemoveRequest _$DeviceRemoveRequestFromJson(Map<String, dynamic> json) =>
    DeviceRemoveRequest(
      deviceId: json['deviceId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$DeviceRemoveRequestToJson(
  DeviceRemoveRequest instance,
) => <String, dynamic>{
  'deviceId': instance.deviceId,
  'runtimeType': instance.$type,
};

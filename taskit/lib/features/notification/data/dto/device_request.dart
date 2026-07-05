import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_request.freezed.dart';
part 'device_request.g.dart';

@freezed
abstract class DeviceRequest with _$DeviceRequest {
  const factory DeviceRequest.register({
    required String fcmToken,
    required String deviceId,
    required String platform,
  }) = DeviceRegisterRequest;

  const factory DeviceRequest.update({
    required String fcmToken,
    required String deviceId,
    required String platform,
  }) = DeviceUpdateRequest;

  const factory DeviceRequest.remove({required String deviceId}) =
      DeviceRemoveRequest;

  factory DeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$DeviceRequestFromJson(json);
}

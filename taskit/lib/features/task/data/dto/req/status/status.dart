import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.g.dart';
part 'status.freezed.dart';

@freezed
abstract class StatusReq with _$StatusReq {
  const factory StatusReq({
    required String status,
  }) = _StatusReq;
  factory StatusReq.fromJson(Map<String, dynamic> json) =>
      _$StatusReqFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update.g.dart';
part 'update.freezed.dart';

@Freezed(genericArgumentFactories:true)
abstract class UpdateReq<T> with _$UpdateReq<T> {
  const factory UpdateReq({
    required T updateData,
  }) = _UpdateReq<T>;
  factory UpdateReq.fromJson(Map<String, dynamic> json,T Function(Object? json) fromJsonT) =>
      _$UpdateReqFromJson(json,fromJsonT);
}



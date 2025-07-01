import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_category_req.freezed.dart';
part 'add_category_req.g.dart';

@freezed
abstract class AddCategoryReq with _$AddCategoryReq {
  const factory AddCategoryReq({required String name, required int localId}) =
      _AddCategoryReq;

  factory AddCategoryReq.fromJson(Map<String, dynamic> json) =>
      _$AddCategoryReqFromJson(json);
}

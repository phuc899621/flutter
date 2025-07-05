import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/shared/data/dto/response/base_response_data.dart';
import 'package:taskit/shared/data/source/remote/network/network_service.dart';

import '../../../../../shared/data/dto/response/base_response.dart';
import '../../dto/req/category/add_category_req.dart';
import '../../dto/res/category/add_category_data.dart';

part 'category_api.g.dart';

final categoryApiProvider = Provider.autoDispose<CategoryApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return CategoryApi(dio);
});

@RestApi()
abstract class CategoryApi {
  factory CategoryApi(Dio dio) => _CategoryApi(dio);

  @POST('/category')
  Future<BaseResponse<AddCategoryData>> add(
    @Header('Authorization') String token,
    @Body() AddCategoryReq addCategoryReq,
  );

  @DELETE('/category/{id}')
  Future<BaseResponse<BaseData>> delete(
    @Header('Authorization') String token,
    @Path('id') String id,
  );
}

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/category/data/dto/req/deleted_categories_sync_req.dart';
import 'package:taskit/features/category/data/dto/res/category_data.dart';
import 'package:taskit/shared/data/source/remote/network/network_service.dart';

import '../../../../../shared/data/dto/response/base_data.dart';
import '../../../../../shared/data/dto/response/data_response.dart';
import '../../dto/req/add_category_req.dart';
import '../../dto/req/categories_sync_req.dart';
import '../../dto/res/add_category_data.dart';
import '../../dto/res/categories_sync_data.dart';
import '../../dto/res/deleted_categories_sync_data.dart';

part 'category_api.g.dart';

final categoryApiProvider = Provider.autoDispose<CategoryApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return CategoryApi(dio);
});

@RestApi()
abstract class CategoryApi {
  factory CategoryApi(Dio dio) => _CategoryApi(dio);

  @GET('/categories')
  @Extra({'requireAuth': true})
  Future<DataResponse<List<CategoryData>>> getAll(
    @Query('lastSyncTime') String syncTime,
  );

  @POST('/categories')
  @Extra({'requireAuth': true})
  Future<DataResponse<AddCategoryData>> create(
    @Body() AddCategoryReq addCategoryReq,
  );

  @DELETE('/categories/{id}')
  @Extra({'requireAuth': true})
  Future<DataResponse<BaseData>> delete(@Path('id') String id);

  @POST('/categories/sync')
  @Extra({'requireAuth': true})
  Future<DataResponse<List<CategoriesSyncData>>> syncCategories(
    @Body() CategoriesSyncReq categories,
  );

  @DELETE('/categories/sync')
  @Extra({'requireAuth': true})
  Future<DataResponse<List<DeletedCategoriesSyncData>>> syncDeleteCategories(
    @Body() DeletedCategoriesSyncReq categories,
  );

  @GET('/categories/pull')
  @Extra({'requireAuth': true})
  Future<DataResponse<List<CategoryData>>> pullCategories(
    @Query('lastSyncTime') String? lastSyncTime,
  );
}

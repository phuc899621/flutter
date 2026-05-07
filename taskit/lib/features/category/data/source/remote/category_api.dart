import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/category/data/dto/fetch/category_res.dart';
import 'package:taskit/features/category/data/dto/sync/delete/deleted_categories_sync_req.dart';
import 'package:taskit/shared/data/source/remote/network/network_service.dart';

import '../../../../../shared/data/dto/response/base_data.dart';
import '../../../../../shared/data/dto/response/data_response.dart';
import '../../dto/add/add_category_req.dart';
import '../../dto/add/add_category_res.dart';
import '../../dto/sync/delete/deleted_categories_sync_res.dart';
import '../../dto/sync/insert_update/categories_sync_req.dart';
import '../../dto/sync/insert_update/categories_sync_res.dart';

part 'category_api.g.dart';

final categoryApiProvider = Provider<CategoryApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return CategoryApi(dio);
});

@RestApi()
abstract class CategoryApi {
  factory CategoryApi(Dio dio) => _CategoryApi(dio);

  @GET('/categories')
  @Extra({'requireAuth': true})
  Future<DataResponse<List<CategoryRes>>> fetch(
    @Query('lastSyncTime') String syncTime,
  );

  @POST('/categories')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<AddCategoryRes>> create(
    @Body() AddCategoryReq addCategoryReq,
  );

  @DELETE('/categories/{id}')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<BaseData>> delete(@Path('id') String id);

  @POST('/categories/sync')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<CategoriesSyncRes>> syncCategories(
    @Body() CategoriesSyncReq categories,
  );

  @DELETE('/categories/sync')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<List<DeletedCategoriesSyncRes>>> syncDeleteCategories(
    @Body() DeletedCategoriesSyncReq categories,
  );

  @GET('/categories/pull')
  @Extra({'requireAuth': true})
  Future<DataResponse<List<CategoryRes>>> pullCategories(
    @Query('lastSyncTime') String? lastSyncTime,
  );
}

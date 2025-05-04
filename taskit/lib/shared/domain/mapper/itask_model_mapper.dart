import 'package:taskit/shared/domain/model/task_model.dart';

import '../../../features/create_task/data/dto/response/category_data.dart';
import '../../data/dto/base_response.dart';
import '../../data/dto/response/task/task_data.dart';
import '../../../features/create_task/domain/model/category_model.dart';


abstract interface class ITaskModelMapper{
  List<TaskModel> mapToTaskModel(BaseResponse<TaskDataLst> response);
  CategoryModel mapToCategoryModel(BaseResponse<CategoryData> response);

}
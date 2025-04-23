import 'package:taskit/shared/domain/model/task_model.dart';

import '../../data/dto/base_response.dart';
import '../../data/dto/response/task/task_data.dart';


abstract interface class ITaskModelMapper{
  List<TaskModel> mapToTaskModel(BaseResponse<TaskDataLst> response);
}
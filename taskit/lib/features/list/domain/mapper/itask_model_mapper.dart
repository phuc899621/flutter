import 'package:taskit/features/list/domain/model/task_model.dart';
import 'package:taskit/shared/dto/base_response.dart';

import '../../../../shared/dto/response/task/task_data.dart';

abstract interface class ITaskModelMapper{
  List<TaskModel> mapToTaskModel(BaseResponse<TaskDataLst> response);
}
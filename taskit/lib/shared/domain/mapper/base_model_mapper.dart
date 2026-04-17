import 'package:taskit/shared/domain/model/base_model.dart';

import '../../data/dto/response/base_data.dart';
import '../../data/dto/response/data_response.dart';

abstract interface class BaseModelMapper {
  BaseModel map(DataResponse<BaseData?> data);
}

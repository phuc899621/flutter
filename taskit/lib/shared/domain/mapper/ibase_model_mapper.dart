

import 'package:taskit/shared/domain/model/base_model.dart';
import 'package:taskit/shared/dto/base_response.dart';

import '../../dto/base_response_data.dart';

abstract interface class IBaseModelMapper{
  BaseModel mapToBaseModel(BaseResponse<BaseData> data);
}
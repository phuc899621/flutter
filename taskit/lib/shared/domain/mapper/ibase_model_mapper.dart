

import 'package:taskit/shared/domain/model/base_model.dart';

import '../../data/dto/base_response.dart';
import '../../data/dto/base_response_data.dart';


abstract interface class IBaseModelMapper{
  BaseModel mapToBaseModel(BaseResponse<BaseData> data);

}
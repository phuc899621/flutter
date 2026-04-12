

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/domain/mapper/base_model_mapper.dart';
import 'package:taskit/shared/domain/model/base_model.dart';

import '../dto/response/base_data.dart';
import '../dto/response/base_response.dart';

class BaseModelMapperImpl implements BaseModelMapper {
  @override
  BaseModel map(BaseResponse<BaseData?> data) {
    return const BaseModel();
  }
}

final baseModelMapperProvider= Provider.autoDispose<BaseModelMapper>((ref)=> BaseModelMapperImpl());

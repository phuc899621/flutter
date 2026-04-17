import 'package:taskit/shared/data/dto/response/base_response.dart';
import 'package:taskit/shared/domain/entities/data_result.dart';
import 'package:taskit/shared/domain/entities/default_result.dart';

extension ResultMapper on BaseResponse {
  DefaultResult toDefault() {
    return DefaultResult(message: message);
  }

  DataResult<T> toData<T>(T data) {
    return DataResult<T>(message: message, data: data);
  }
}

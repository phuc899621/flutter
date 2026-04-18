import 'package:taskit/shared/data/dto/response/data_response.dart';
import 'package:taskit/shared/data/dto/response/message_response.dart';
import 'package:taskit/shared/domain/entities/data_result.dart';
import 'package:taskit/shared/domain/entities/message_result.dart';

extension DataResponseMapper<T> on DataResponse<T> {
  DataResult<E> toResult<E>(E entity) {
    return DataResult<E>(message: message, data: entity);
  }

  MessageResult toMessage() {
    return MessageResult(message: message);
  }
}

extension MessageResponseMapper on MessageResponse {
  MessageResult toResult() {
    return MessageResult(message: message);
  }
}

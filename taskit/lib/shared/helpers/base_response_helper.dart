import '../data/dto/response/base_response.dart';

class BaseResponseHelper {
  static T requireData<T>(BaseResponse<T> response) {
    if (response.data == null) {
      throw Exception('Expected non-null data: ${response.message}');
    }
    return response.data!;
  }

  static void checkSuccess<T>(BaseResponse<T> response) {
    if (response.success != true) {
      throw Exception('API failed: ${response.message}');
    }
  }
}
import '../data/dto/response/data_response.dart';

class BaseResponseHelper {
  static T requireData<T>(DataResponse<T> response) {
    if (response.data == null) {
      throw Exception('Expected non-null data: ${response.message}');
    }
    return response.data!;
  }
}

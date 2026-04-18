class AppConfigs {
  static const String baseUrl = 'https://taskit-api.id.vn/api/v1/';
  static const String auth = 'auth';

  static String imageUrl(String path) => '$baseUrl/uploads/$path';
}

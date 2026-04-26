class AppConfigs {
  static const String baseUrl = 'https://taskit-api.id.vn/api/v1/';
  static const String auth = 'auth';

  static String imageUrl(String path) => '$baseUrl/uploads/$path';
}

const String productionUrl = 'https://taskit-api.id.vn/api/v1/';
const String devUrl = 'http://192.168.1.5:8080/api/v1/';

import 'package:dio/dio.dart';
import 'package:painteres_clone/src/common/config/config.dart';

class NetworkDioService {
  Future<dynamic> getAllData() async {
    try {
      Response response = await Dio().get(ApplicationConfig.baseUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        return "Error response status code ${response.statusCode}";
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return "DioException connection time out";
        case DioExceptionType.connectionError:
          return "DioException connection error";
        default:
          return "Unknown error dio exception ${e.type}";
      }
    }
  }
}

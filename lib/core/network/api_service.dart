import 'package:dio/dio.dart';

class ApiServiceFunctions {
  final Dio dio;

  ApiServiceFunctions(this.dio);

  Future<Map<String, dynamic>> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    var response = await dio.post('http://192.168.1.4:8000$endpoint',
        data: data, options: Options(headers: {}));
    return response.data;
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    var response = await dio.get(
      'http://10.0.2.2:8000$endpoint',
      queryParameters: queryParams,
      options: Options(headers: {}),
    );
    return response.data;
  }
}

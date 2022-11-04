import 'package:dio/dio.dart';

class Endpoints {
  Endpoints._();
  static const String baseUrl = "https://jsonplaceholder.typicode.com/users";
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;
  static const String users = '/users';
}

class NetworkClient {
  final Dio _dio;

  NetworkClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.responseType = ResponseType.json;
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        Endpoints.baseUrl,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

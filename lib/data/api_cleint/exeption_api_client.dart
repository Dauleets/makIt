import 'package:dio/dio.dart';

class ApiExceptions implements Exception {
  late DioErrorType message;

  ApiExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = DioErrorType.cancel;
        break;
      case DioErrorType.connectTimeout:
        message = DioErrorType.connectTimeout;
        break;
      case DioErrorType.receiveTimeout:
        message = DioErrorType.receiveTimeout;
        break;
      case DioErrorType.response:
        message = DioErrorType.response;
        break;
      case DioErrorType.sendTimeout:
        message = DioErrorType.sendTimeout;
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = DioErrorType.other;
          break;
        }
        break;
    }
  }
}

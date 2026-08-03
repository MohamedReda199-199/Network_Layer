import 'package:dio/dio.dart';
import 'package:ligalife/core/network/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        throw NetworkException();

      default:
        break;
    }

    switch (err.response?.statusCode) {
      case 400:
        throw ServerException();

      case 401:
        throw UnauthorizedException();

      case 404:
        throw ServerException();

      case 500:
        throw ServerException();

      default:
        throw ServerException();
    }
  }
}

import 'package:dio/dio.dart';
import '../endpoints.dart';
import '../interceptors/app_interceptor.dart';
import '../interceptors/auth_interceptor.dart';
import '../interceptors/error_interceptor.dart';

class DioClient {
  DioClient._();

  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: EndPoints.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        )
        ..interceptors.add(AppInterceptor())
        ..interceptors.add(AuthInterceptor())
        ..interceptors.add(
          LogInterceptor(requestBody: true, responseBody: true),
        )
        ..interceptors.add(ErrorInterceptor());
}

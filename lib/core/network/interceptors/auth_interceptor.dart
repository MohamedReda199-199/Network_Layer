import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["X-SECRET-KEY"] =
        "TICKETS-NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3";
    super.onRequest(options, handler);
  }
}

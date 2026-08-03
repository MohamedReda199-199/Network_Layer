import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../network/clients/dio_client.dart';
import '../network/services/api_service.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => DioClient.dio;

  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
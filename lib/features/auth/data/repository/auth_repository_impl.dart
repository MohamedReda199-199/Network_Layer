import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ligalife/core/network/exceptions.dart';
import 'package:ligalife/core/network/failure.dart';
import 'package:ligalife/core/network/network_result.dart';
import 'package:ligalife/features/auth/data/models/login_response.dart';
import 'package:ligalife/features/auth/data/remote/auth_api_service.dart';
import 'package:ligalife/features/auth/domain/models/login_request.dart';
import 'package:ligalife/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService apiService;

  AuthRepositoryImpl(this.apiService);

  @override
  Future<NetworkResult<LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await apiService.login(request);

      return Success(LoginResponse.fromJson(response));
    } on UnauthorizedException {
      return Error(ServerFailure("Unauthorized"));
    } on NetworkException {
      return Error(NetworkFailure("No Internet Connection"));
    } on CacheException {
      return Error(CacheFailure("Cache Error"));
    } on ServerException {
      return Error(ServerFailure("Server Error"));
    } on DioException catch (e) {
      return Error(
        ServerFailure(e.response?.data["message"] ?? "Something went wrong"),
      );
    }
  }
}

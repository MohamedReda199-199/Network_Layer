import 'package:injectable/injectable.dart';
import 'package:ligalife/features/auth/data/remote/auth_api_service.dart';
import 'package:ligalife/features/auth/data/models/login_response.dart';
import 'package:ligalife/features/auth/data/models/phone_request_model.dart';
import 'package:ligalife/features/auth/domain/repositories/auth_repository.dart';
import 'package:ligalife/features/auth/domain/usecases/login_params.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService apiService;
  AuthRepositoryImpl(this.apiService);

  @override
  Future<LoginResponse> login(LoginParams params) async {
    final request = PhoneRequestModel(
      phone: params.phone,
      countryCode: params.countryCode,
    );
    final response = await apiService.login(request);
    return LoginResponse.fromJson(response);
  }
}

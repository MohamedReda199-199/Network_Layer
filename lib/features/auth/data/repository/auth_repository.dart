import 'package:injectable/injectable.dart';
import 'package:ligalife/core/network/services/api_service.dart';
import '../models/login_response.dart';

@lazySingleton
class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<LoginResponse> login({
    required String phone,
    required String countryCode,
  }) async {
    final response = await apiService.login({
      "phone": phone,
      "country_code": countryCode,
    });
    return LoginResponse.fromJson(response);
  }
}

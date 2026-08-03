import 'package:injectable/injectable.dart';
import 'package:ligalife/core/network/services/api_service.dart';
import '../../domain/models/login_request.dart';

@lazySingleton
class AuthApiService {
  final ApiService apiService;

  AuthApiService(this.apiService);

  Future<dynamic> login(LoginRequest request) async {
    return apiService.login(request.toJson());
  }
}

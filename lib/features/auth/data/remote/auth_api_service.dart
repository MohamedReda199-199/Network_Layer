import 'package:injectable/injectable.dart';
import '../../../../core/network/services/api_service.dart';
import '../models/phone_request_model.dart';

@lazySingleton
class AuthApiService {
  final ApiService apiService;
  AuthApiService(this.apiService);
  Future<dynamic> login(PhoneRequestModel request) async {
    return await apiService.login(request.toJson());
  }
}

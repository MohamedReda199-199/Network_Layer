import 'package:ligalife/core/network/network_result.dart';
import 'package:ligalife/features/auth/data/models/login_response.dart';
import '../models/login_request.dart';

abstract class AuthRepository {
  Future<NetworkResult<LoginResponse>> login(LoginRequest request);
}

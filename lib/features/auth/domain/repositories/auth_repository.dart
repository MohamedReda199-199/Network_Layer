import '../usecases/login_params.dart';
import 'package:ligalife/features/auth/data/models/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginParams params);
}

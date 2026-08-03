import 'package:injectable/injectable.dart';
import '../repositories/auth_repository.dart';
import 'login_params.dart';
import 'package:ligalife/features/auth/data/models/login_response.dart';

@lazySingleton
class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);
  Future<LoginResponse> call(LoginParams params) {
    return repository.login(params);
  }
}

import 'package:injectable/injectable.dart';
import 'package:ligalife/core/network/network_result.dart';
import 'package:ligalife/features/auth/data/models/login_response.dart';
import 'package:ligalife/features/auth/domain/models/login_request.dart';
import 'package:ligalife/features/auth/domain/repositories/auth_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class LoginUseCase
    implements UseCase<NetworkResult<LoginResponse>, LoginRequest> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<NetworkResult<LoginResponse>> call(LoginRequest request) {
    return repository.login(request);
  }
}

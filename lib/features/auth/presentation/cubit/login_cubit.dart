import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ligalife/core/network/network_result.dart';
import 'package:ligalife/features/auth/domain/models/login_request.dart';
import 'package:ligalife/features/auth/domain/usecases/login_usecase.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(const LoginInitial());

  Future<void> login({
    required String phone,
    required String countryCode,
  }) async {
    emit(const LoginLoading());

    final result = await loginUseCase(
      LoginRequest(phone: phone, countryCode: countryCode),
    );

    switch (result) {
      case Success():
        emit(LoginSuccess(result.data));

      case Error():
        emit(LoginFailure(result.failure.message));
    }
  }
}

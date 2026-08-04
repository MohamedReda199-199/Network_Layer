import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ligalife/core/enums/request_state.dart';
import 'package:ligalife/core/network/network_result.dart';
import 'package:ligalife/features/auth/domain/models/login_request.dart';
import 'package:ligalife/features/auth/domain/usecases/login_usecase.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(const LoginState());
  Future<void> login({
    required String phone,
    required String countryCode,
  }) async {
    emit(
      state.copyWith(
        requestState: RequestState.loading,
        response: null,
        errorMessage: null,
      ),
    );
    final result = await loginUseCase(
      LoginRequest(
        phone: phone,
        countryCode: countryCode,
      ),
    );
    switch (result) {
      case Success():
        emit(
          state.copyWith(
            requestState: RequestState.success,
            response: result.data,
          ),
        );
        break;
      case Error():
        emit(
          state.copyWith(
            requestState: RequestState.error,
            errorMessage: result.failure.message,
          ),
        );
        break;
    }
  }
}
import 'dart:async';
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
  Timer? _timer;

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
        startCountDown();
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
  void startCountDown() {
    _timer?.cancel();
    emit(
      state.copyWith(
        countDown: 60,
        canResend: false,
      ),
    );
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (state.countDown > 1) {
          emit(
            state.copyWith(
              countDown: state.countDown - 1,
            ),
          );
        } else {
          timer.cancel();
          emit(
            state.copyWith(
              countDown: 0,
              canResend: true,
            ),
          );
        }
      },
    );
  }

  void resendCode() {
   // if (!state.canResend) return;
    startCountDown();
  }
  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
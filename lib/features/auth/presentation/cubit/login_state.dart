import 'package:equatable/equatable.dart';
import 'package:ligalife/core/enums/request_state.dart';
import 'package:ligalife/features/auth/data/models/login_response.dart';

class LoginState extends Equatable {
  final RequestState requestState;
  final LoginResponse? response;
  final String? errorMessage;

  const LoginState({
    this.requestState = RequestState.initial,
    this.response,
    this.errorMessage,
  });

  LoginState copyWith({
    RequestState? requestState,
    LoginResponse? response,
    String? errorMessage,
  }) {
    return LoginState(
      requestState: requestState ?? this.requestState,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [requestState, response, errorMessage];
}

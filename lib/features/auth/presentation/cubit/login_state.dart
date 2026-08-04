import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ligalife/core/enums/request_state.dart';
import 'package:ligalife/features/auth/data/models/login_response.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(RequestState.initial) RequestState requestState,
    LoginResponse? response,
    String? errorMessage,
  }) = _LoginState;
}

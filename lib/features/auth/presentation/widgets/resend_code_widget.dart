import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ligalife/features/auth/presentation/cubit/login_cubit.dart';
import 'package:ligalife/features/auth/presentation/cubit/login_state.dart';

class ResendCodeWidget extends StatelessWidget {
  final VoidCallback onResend;

  const ResendCodeWidget({
    super.key,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.countDown != current.countDown ||
          previous.canResend != current.canResend,
      builder: (context, state) {
        if (state.canResend) {
          return TextButton(
            onPressed: onResend,
            child: const Text("Resend Code"),
          );
        }
        return Text(
          "Resend code in ${state.countDown}s",
        );
      },
    );
  }
}
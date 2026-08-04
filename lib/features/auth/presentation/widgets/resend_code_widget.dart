import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ligalife/features/auth/presentation/cubit/login_cubit.dart';
import 'package:ligalife/features/auth/presentation/cubit/login_state.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state.canResend) {
          return TextButton(
            onPressed: () {
              context.read<LoginCubit>().resendCode();
            },
            child: const Text(
              'Resend Code',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }
        return Text(
          'Resend code in ${state.countDown}s',
          style: const TextStyle(color: Colors.grey),
        );
      },
    );
  }
}

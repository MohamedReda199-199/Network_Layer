import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ligalife/core/enums/request_state.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import '../widgets/otp_field.dart';
import '../widgets/resend_code_widget.dart';

class OtpScreen extends StatelessWidget {
  final String phone;
  final String countryCode;

  const OtpScreen({super.key, required this.phone, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Phone"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              "Enter verification code",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "$countryCode $phone",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            const OtpField(),
            const SizedBox(height: 30),
            BlocSelector<LoginCubit, LoginState, bool>(
              selector: (state) => state.requestState == RequestState.loading,
              builder: (context, isLoading) {
                return SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : () {},
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text("Verify"),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            const ResendCodeWidget(),
          ],
        ),
      ),
    );
  }
}

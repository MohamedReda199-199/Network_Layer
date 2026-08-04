import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ligalife/core/enums/request_state.dart';
import '../cubit/login_cubit.dart';
import '../widgets/otp_field.dart';
import '../widgets/resend_code_widget.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  final String countryCode;

  const OtpScreen({super.key, required this.phone, required this.countryCode});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (_) => TextEditingController());
    focusNodes = List.generate(6, (_) => FocusNode());
  }

  void clearOtp() {
    for (final controller in controllers) {
      controller.clear();
    }
    FocusScope.of(context).requestFocus(focusNodes.first);
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<LoginCubit, bool>(
      (cubit) => cubit.state.requestState == RequestState.loading,
    );

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
              "${widget.countryCode} ${widget.phone}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            OtpField(controllers: controllers, focusNodes: focusNodes),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        final otp = controllers
                            .map((controller) => controller.text)
                            .join();
                        debugPrint("OTP: $otp");
                      },
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Verify"),
              ),
            ),
            const SizedBox(height: 30),
            ResendCodeWidget(
              onResend: () {
                clearOtp();
                context.read<LoginCubit>().resendCode();
              },
            ),
          ],
        ),
      ),
    );
  }
}

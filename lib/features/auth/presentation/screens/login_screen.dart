import 'package:flutter/material.dart';
import 'package:ligalife/core/di/injection.dart';
import 'package:ligalife/core/network/network_result.dart';
import 'package:ligalife/features/auth/data/models/login_response.dart';
import 'package:ligalife/features/auth/domain/models/login_request.dart';
import 'package:ligalife/features/auth/domain/usecases/login_usecase.dart';
import 'package:ligalife/features/auth/presentation/widgets/background_circles.dart';
import 'package:ligalife/features/auth/presentation/widgets/country_code_field.dart';
import 'package:ligalife/features/auth/presentation/widgets/login_button.dart';
import 'package:ligalife/features/auth/presentation/widgets/login_header.dart';
import 'package:ligalife/features/auth/presentation/widgets/phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController(text: "+20");

  final LoginUseCase _loginUseCase = getIt<LoginUseCase>();

  String result = "";

  Future<void> login() async {
    final response = await _loginUseCase(
      LoginRequest(
        phone: _phoneController.text.trim(),
        countryCode: _countryController.text.trim(),
      ),
    );

    switch (response) {
      case Success<LoginResponse>():
        setState(() {
          result = response.data.message;
        });
        break;

      case Error<LoginResponse>():
        setState(() {
          result = response.failure.message;
        });
        break;
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5FB),
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundCircles(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Spacer(),

                  const LoginHeader(),

                  const SizedBox(height: 55),

                  Row(
                    children: [
                      CountryCodeField(
                        controller: _countryController,
                      ),
                      const SizedBox(width: 12),
                      PhoneField(
                        controller: _phoneController,
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  LoginButton(
                    onPressed: login,
                  ),

                  const SizedBox(height: 25),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: result.isEmpty
                        ? const SizedBox.shrink()
                        : Text(
                            result,
                            key: ValueKey(result),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: result.toLowerCase().contains("success")
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),

                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
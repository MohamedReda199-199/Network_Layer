import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import '../widgets/background_circles.dart';
import '../widgets/country_code_field.dart';
import '../widgets/login_button.dart';
import '../widgets/login_header.dart';
import '../widgets/phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController(
    text: "+20",
  );

  @override
  void dispose() {
    phoneController.dispose();
    countryCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const BackgroundCircles(),
          SafeArea(
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                state.when(
                  initial: () {},
                  loading: () {},
                  success: (response) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(response.message)));
                  },
                  failure: (message) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(message)));
                  },
                );
              },
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const LoginHeader(),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: CountryCodeField(
                              controller: countryCodeController,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: PhoneField(controller: phoneController),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      LoginButton(
                        isLoading: isLoading,
                        onPressed: () {
                          context.read<LoginCubit>().login(
                            phone: phoneController.text.trim(),
                            countryCode: countryCodeController.text.trim(),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

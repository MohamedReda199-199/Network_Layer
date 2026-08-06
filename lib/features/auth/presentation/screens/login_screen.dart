import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ligalife/app_router.dart';
import 'package:ligalife/core/di/injection.dart';
import 'package:ligalife/core/enums/request_state.dart';
import 'package:ligalife/features/auth/presentation/cubit/login_cubit.dart';
import 'package:ligalife/features/auth/presentation/cubit/login_state.dart';
import 'package:ligalife/features/auth/presentation/widgets/background_circles.dart';
import 'package:ligalife/features/auth/presentation/widgets/country_code_field.dart';
import 'package:ligalife/features/auth/presentation/widgets/login_button.dart';
import 'package:ligalife/features/auth/presentation/widgets/login_header.dart';
import 'package:ligalife/features/auth/presentation/widgets/phone_field.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<LoginCubit>(), child: this);
  }

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
                if (state.requestState == RequestState.success) {
                  context.router.replace(const UploadRoute());
                }
                if (state.requestState == RequestState.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errorMessage ?? "Something went wrong",
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                final isLoading = state.requestState == RequestState.loading;
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

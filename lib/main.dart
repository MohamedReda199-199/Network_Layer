import 'package:flutter/material.dart';
import 'package:ligalife/core/di/injection.dart';
import 'package:ligalife/features/auth/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LigaLife',
      theme: ThemeData(useMaterial3: true),
      home: const LoginScreen(),
    );
  }
}

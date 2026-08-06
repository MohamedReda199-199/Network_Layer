import 'package:flutter/material.dart';
import 'package:ligalife/app_router.dart';
import 'package:ligalife/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'LigaLife',
      theme: ThemeData(useMaterial3: true),
      routerConfig: _appRouter.config(),
    );
  }
}

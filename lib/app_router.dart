import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ligalife/core/widgets/dialogs/confirmation_dialog_page.dart';
import 'package:ligalife/core/widgets/dialogs/error_dialog_page.dart';
import 'package:ligalife/core/widgets/dialogs/success_dialog_page.dart';
import 'package:ligalife/features/auth/presentation/screens/login_screen.dart';
import 'package:ligalife/features/upload/presentation/screens/upload_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: UploadRoute.page),
    AutoRoute(page: SuccessDialogRoute.page, fullscreenDialog: true),
    AutoRoute(page: ErrorDialogRoute.page, fullscreenDialog: true),
    AutoRoute(page: ConfirmationDialogRoute.page, fullscreenDialog: true),
  ];
}

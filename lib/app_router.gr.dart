// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ConfirmationDialogPage]
class ConfirmationDialogRoute
    extends PageRouteInfo<ConfirmationDialogRouteArgs> {
  ConfirmationDialogRoute({
    Key? key,
    required String title,
    required String message,
    String? primaryButtonText,
    String? secondaryButtonText,
    VoidCallback? onPrimaryAction,
    VoidCallback? onSecondaryAction,
    bool isDismissible = true,
    List<PageRouteInfo>? children,
  }) : super(
         ConfirmationDialogRoute.name,
         args: ConfirmationDialogRouteArgs(
           key: key,
           title: title,
           message: message,
           primaryButtonText: primaryButtonText,
           secondaryButtonText: secondaryButtonText,
           onPrimaryAction: onPrimaryAction,
           onSecondaryAction: onSecondaryAction,
           isDismissible: isDismissible,
         ),
         initialChildren: children,
       );

  static const String name = 'ConfirmationDialogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ConfirmationDialogRouteArgs>();
      return ConfirmationDialogPage(
        key: args.key,
        title: args.title,
        message: args.message,
        primaryButtonText: args.primaryButtonText,
        secondaryButtonText: args.secondaryButtonText,
        onPrimaryAction: args.onPrimaryAction,
        onSecondaryAction: args.onSecondaryAction,
        isDismissible: args.isDismissible,
      );
    },
  );
}

class ConfirmationDialogRouteArgs {
  const ConfirmationDialogRouteArgs({
    this.key,
    required this.title,
    required this.message,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.onPrimaryAction,
    this.onSecondaryAction,
    this.isDismissible = true,
  });

  final Key? key;

  final String title;

  final String message;

  final String? primaryButtonText;

  final String? secondaryButtonText;

  final VoidCallback? onPrimaryAction;

  final VoidCallback? onSecondaryAction;

  final bool isDismissible;

  @override
  String toString() {
    return 'ConfirmationDialogRouteArgs{key: $key, title: $title, message: $message, primaryButtonText: $primaryButtonText, secondaryButtonText: $secondaryButtonText, onPrimaryAction: $onPrimaryAction, onSecondaryAction: $onSecondaryAction, isDismissible: $isDismissible}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ConfirmationDialogRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        message == other.message &&
        primaryButtonText == other.primaryButtonText &&
        secondaryButtonText == other.secondaryButtonText &&
        onPrimaryAction == other.onPrimaryAction &&
        onSecondaryAction == other.onSecondaryAction &&
        isDismissible == other.isDismissible;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      message.hashCode ^
      primaryButtonText.hashCode ^
      secondaryButtonText.hashCode ^
      onPrimaryAction.hashCode ^
      onSecondaryAction.hashCode ^
      isDismissible.hashCode;
}

/// generated route for
/// [ErrorDialogPage]
class ErrorDialogRoute extends PageRouteInfo<ErrorDialogRouteArgs> {
  ErrorDialogRoute({
    Key? key,
    required String title,
    required String message,
    VoidCallback? onPrimaryAction,
    List<PageRouteInfo>? children,
  }) : super(
         ErrorDialogRoute.name,
         args: ErrorDialogRouteArgs(
           key: key,
           title: title,
           message: message,
           onPrimaryAction: onPrimaryAction,
         ),
         initialChildren: children,
       );

  static const String name = 'ErrorDialogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ErrorDialogRouteArgs>();
      return ErrorDialogPage(
        key: args.key,
        title: args.title,
        message: args.message,
        onPrimaryAction: args.onPrimaryAction,
      );
    },
  );
}

class ErrorDialogRouteArgs {
  const ErrorDialogRouteArgs({
    this.key,
    required this.title,
    required this.message,
    this.onPrimaryAction,
  });

  final Key? key;

  final String title;

  final String message;

  final VoidCallback? onPrimaryAction;

  @override
  String toString() {
    return 'ErrorDialogRouteArgs{key: $key, title: $title, message: $message, onPrimaryAction: $onPrimaryAction}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ErrorDialogRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        message == other.message &&
        onPrimaryAction == other.onPrimaryAction;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      message.hashCode ^
      onPrimaryAction.hashCode;
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [SuccessDialogPage]
class SuccessDialogRoute extends PageRouteInfo<SuccessDialogRouteArgs> {
  SuccessDialogRoute({
    Key? key,
    required String title,
    required String message,
    VoidCallback? onPrimaryAction,
    List<PageRouteInfo>? children,
  }) : super(
         SuccessDialogRoute.name,
         args: SuccessDialogRouteArgs(
           key: key,
           title: title,
           message: message,
           onPrimaryAction: onPrimaryAction,
         ),
         initialChildren: children,
       );

  static const String name = 'SuccessDialogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SuccessDialogRouteArgs>();
      return SuccessDialogPage(
        key: args.key,
        title: args.title,
        message: args.message,
        onPrimaryAction: args.onPrimaryAction,
      );
    },
  );
}

class SuccessDialogRouteArgs {
  const SuccessDialogRouteArgs({
    this.key,
    required this.title,
    required this.message,
    this.onPrimaryAction,
  });

  final Key? key;

  final String title;

  final String message;

  final VoidCallback? onPrimaryAction;

  @override
  String toString() {
    return 'SuccessDialogRouteArgs{key: $key, title: $title, message: $message, onPrimaryAction: $onPrimaryAction}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SuccessDialogRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        message == other.message &&
        onPrimaryAction == other.onPrimaryAction;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      message.hashCode ^
      onPrimaryAction.hashCode;
}

/// generated route for
/// [UploadScreen]
class UploadRoute extends PageRouteInfo<void> {
  const UploadRoute({List<PageRouteInfo>? children})
    : super(UploadRoute.name, initialChildren: children);

  static const String name = 'UploadRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UploadScreen();
    },
  );
}

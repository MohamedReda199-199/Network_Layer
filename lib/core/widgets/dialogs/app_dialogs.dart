import 'package:flutter/material.dart';
import 'base_dialog.dart';
import 'dialog_type.dart';

class AppDialogs {
  AppDialogs._();

  static void showSuccess(
    BuildContext context, {
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onConfirm,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => BaseDialog(
        type: DialogType.success,
        title: title,
        message: message,
        primaryButtonText: buttonText ?? 'Continue',
        onPrimaryAction: onConfirm,
        isDismissible: isDismissible,
      ),
    );
  }

  static void showError(
    BuildContext context, {
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onConfirm,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => BaseDialog(
        type: DialogType.error,
        title: title,
        message: message,
        primaryButtonText: buttonText ?? 'Dismiss',
        onPrimaryAction: onConfirm,
        isDismissible: isDismissible,
      ),
    );
  }

  static void showInfo(
    BuildContext context, {
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onConfirm,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => BaseDialog(
        type: DialogType.info,
        title: title,
        message: message,
        primaryButtonText: buttonText ?? 'OK',
        onPrimaryAction: onConfirm,
        isDismissible: isDismissible,
      ),
    );
  }

  static void showConfirmation(
    BuildContext context, {
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => BaseDialog(
        type: DialogType.confirmation,
        title: title,
        message: message,
        primaryButtonText: confirmText ?? 'Confirm',
        onPrimaryAction: onConfirm,
        secondaryButtonText: cancelText ?? 'Cancel',
        onSecondaryAction: onCancel,
        isDismissible: isDismissible,
      ),
    );
  }
}

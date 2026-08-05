import 'package:flutter/material.dart';

enum DialogType {
  success,
  error,
  info,
  confirmation;

  Color get color {
    switch (this) {
      case DialogType.success:
        return const Color(0xFF4CAF50);
      case DialogType.error:
        return const Color(0xFFE53935);
      case DialogType.info:
        return const Color(0xFF03A9F4);
      case DialogType.confirmation:
        return const Color(0xFFFFB300);
    }
  }

  IconData get icon {
    switch (this) {
      case DialogType.success:
        return Icons.check_circle_outline_rounded;
      case DialogType.error:
        return Icons.error_outline_rounded;
      case DialogType.info:
        return Icons.info_outline_rounded;
      case DialogType.confirmation:
        return Icons.help_outline_rounded;
    }
  }
}

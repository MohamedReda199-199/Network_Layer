import 'package:flutter/material.dart';
import '../dialog_type.dart';

class DialogActionButtons extends StatelessWidget {
  final DialogType type;
  final String? primaryButtonText;
  final VoidCallback? onPrimaryAction;
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryAction;
  final bool isDismissible;

  const DialogActionButtons({
    super.key,
    required this.type,
    this.primaryButtonText,
    this.onPrimaryAction,
    this.secondaryButtonText,
    this.onSecondaryAction,
    this.isDismissible = true,
  });

  @override
  Widget build(BuildContext context) {
    final hasSecondary = secondaryButtonText != null;

    return Row(
      children: [
        if (hasSecondary) ...[
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                onSecondaryAction?.call();

                if (isDismissible && Navigator.canPop(context)) {
                  Navigator.of(context).pop(false);
                }
              },
              child: Text(secondaryButtonText!),
            ),
          ),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: type.color),
            onPressed: () {
              onPrimaryAction?.call();
              if (isDismissible && Navigator.canPop(context)) {
                Navigator.of(context).pop(true);
              }
            },
            child: Text(primaryButtonText ?? 'OK'),
          ),
        ),
      ],
    );
  }
}

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (hasSecondary) ...[
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                if (isDismissible) Navigator.of(context).pop();
                onSecondaryAction?.call();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Text(
                secondaryButtonText!,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (isDismissible) Navigator.of(context).pop();
              onPrimaryAction?.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: type.color,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              primaryButtonText ?? 'OK',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

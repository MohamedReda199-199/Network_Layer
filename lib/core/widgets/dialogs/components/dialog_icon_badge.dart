import 'package:flutter/material.dart';
import '../dialog_type.dart';

class DialogIconBadge extends StatelessWidget {
  final DialogType type;

  const DialogIconBadge({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: type.color.withValues(alpha: 0.15),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: type.color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: type.color.withValues(alpha: 0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Icon(
              type.icon,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}

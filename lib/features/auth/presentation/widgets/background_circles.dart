import 'package:flutter/material.dart';

class BackgroundCircles extends StatelessWidget {
  const BackgroundCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -80,
          right: -70,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: .08),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 230,
          left: -70,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: .08),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

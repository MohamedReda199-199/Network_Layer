import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/upload_cubit.dart';
import '../cubit/upload_image_model.dart';

class UploadItem extends StatelessWidget {
  final UploadImageModel image;
  final int index;

  const UploadItem({super.key, required this.image, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: kIsWeb
                ? Image.network(
                    image.file.path,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => const ColoredBox(
                      color: Colors.grey,
                      child: Center(child: Icon(Icons.image)),
                    ),
                  )
                : Image.file(File(image.file.path), fit: BoxFit.cover),
          ),
        ),
        if (image.uploading)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: image.progress),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: value == 0 ? null : value,
                            strokeWidth: 5,
                            color: Colors.white,
                            backgroundColor: Colors.white24,
                          ),
                          Text(
                            "${(value * 100).toInt()}%",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        if (image.uploaded)
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: AnimatedScale(
              scale: image.uploaded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.elasticOut,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: Colors.white, size: 16),
                    SizedBox(width: 5),
                    Text(
                      "Uploaded",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Positioned(
          top: 6,
          right: 6,
          child: InkWell(
            onTap: () {
              context.read<UploadCubit>().removeImage(index);
            },
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 18),
            ),
          ),
        ),
      ],
    );
  }
}

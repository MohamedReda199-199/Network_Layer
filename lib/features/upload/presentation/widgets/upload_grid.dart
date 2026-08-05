import 'package:flutter/material.dart';
import '../cubit/upload_image_model.dart';
import 'upload_item.dart';

class UploadGrid extends StatelessWidget {
  final List<UploadImageModel> images;
  const UploadGrid({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const Center(
        child: Text(
          "No images selected",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, index) {
        return UploadItem(image: images[index], index: index);
      },
    );
  }
}

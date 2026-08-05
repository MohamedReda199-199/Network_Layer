import 'dart:io';

class UploadImageModel {
  final File file;
  final double progress;
  final bool uploading;
  final bool uploaded;

  const UploadImageModel({
    required this.file,
    this.progress = 0,
    this.uploading = false,
    this.uploaded = false,
  });

  UploadImageModel copyWith({
    File? file,
    double? progress,
    bool? uploading,
    bool? uploaded,
  }) {
    return UploadImageModel(
      file: file ?? this.file,
      progress: progress ?? this.progress,
      uploading: uploading ?? this.uploading,
      uploaded: uploaded ?? this.uploaded,
    );
  }
}

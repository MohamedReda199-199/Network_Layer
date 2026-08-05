import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:ligalife/core/network/network_result.dart';
import 'package:ligalife/features/upload/data/models/upload_response.dart';
import 'package:ligalife/features/upload/domain/repositories/upload_repository.dart';

@injectable
class UploadImagesUseCase {
  final UploadRepository repository;

  UploadImagesUseCase(this.repository);

  Future<NetworkResult<UploadResponse>> call(
    List<File> images, {
    void Function(int sent, int total)? onProgress,
  }) {
    return repository.uploadImages(
      images,
      onProgress: onProgress,
    );
  }
}
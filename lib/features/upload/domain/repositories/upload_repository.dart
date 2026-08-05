import 'dart:io';
import 'package:ligalife/core/network/network_result.dart';
import 'package:ligalife/features/upload/data/models/upload_response.dart';

abstract class UploadRepository {
  Future<NetworkResult<UploadResponse>> uploadImages(
    List<File> images, {
    void Function(int sent, int total)? onProgress,
  });
}
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ligalife/core/network/endpoints.dart';
import 'package:ligalife/core/network/failure.dart';
import 'package:ligalife/core/network/network_result.dart';
import 'package:ligalife/features/upload/data/models/upload_response.dart';
import 'package:ligalife/features/upload/domain/repositories/upload_repository.dart';

import 'package:ligalife/core/network/services/api_service.dart';

@LazySingleton(as: UploadRepository)
class UploadRepositoryImpl implements UploadRepository {
  final ApiService apiService;

  UploadRepositoryImpl(this.apiService);

  @override
  Future<NetworkResult<UploadResponse>> uploadImages(
    List<File> images, {
    void Function(int sent, int total)? onProgress,
  }) async {
    try {
      final formData = FormData();
      formData.fields.add(const MapEntry("path", "users"));
      for (int i = 0; i < images.length; i++) {
        final multipart = await MultipartFile.fromFile(images[i].path);
        formData.files.add(MapEntry("image[$i]", multipart));
      }
      final response = await apiService.uploadImages(
        formData,
        onSendProgress: onProgress,
      );
      return Success(UploadResponse.fromJson(response));
    } on DioException catch (e) {
      return Error(
        ServerFailure(e.response?.data?["message"] ?? "Something went wrong"),
      );
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }
}

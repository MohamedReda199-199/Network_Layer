import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:ligalife/core/enums/request_state.dart';
import 'package:ligalife/core/network/network_result.dart';
import '../../domain/usecases/upload_images_usecase.dart';
import 'upload_image_model.dart';
import 'upload_state.dart';

@injectable
class UploadCubit extends Cubit<UploadState> {
  UploadCubit(this._uploadImagesUseCase) : super(const UploadState());

  final UploadImagesUseCase _uploadImagesUseCase;
  final ImagePicker _picker = ImagePicker();

  CancelToken? _cancelToken;

  Future<void> pickImages() async {
    final images = await _picker.pickMultiImage();
    if (images.isEmpty || isClosed) return;
    final list = List<UploadImageModel>.from(state.images);
    for (final image in images) {
      list.add(UploadImageModel(file: File(image.path)));
    }
    if (!isClosed) {
      emit(state.copyWith(images: list));
    }
  }

  Future<void> pickCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null || isClosed) return;
    emit(
      state.copyWith(
        images: [
          ...state.images,
          UploadImageModel(file: File(image.path)),
        ],
      ),
    );
  }

  void removeImage(int index) {
    if (isClosed) return;
    final list = List<UploadImageModel>.from(state.images);
    list.removeAt(index);
    emit(state.copyWith(images: list));
  }

  void clearImages() {
    if (isClosed) return;
    emit(
      state.copyWith(
        images: [],
        uploadedCount: 0,
        requestState: RequestState.initial,
      ),
    );
  }

  void cancelUpload() {
    _cancelToken?.cancel();
    if (!isClosed) {
      emit(state.copyWith(requestState: RequestState.initial));
    }
  }

  Future<void> uploadImages() async {
    if (state.images.isEmpty) return;
    _cancelToken = CancelToken();
    final updated = List<UploadImageModel>.from(state.images);
    final unUploadedIndices = <int>[];
    final filesToUpload = <File>[];

    for (int i = 0; i < updated.length; i++) {
      if (!updated[i].uploaded) {
        unUploadedIndices.add(i);
        filesToUpload.add(updated[i].file);
        updated[i] = updated[i].copyWith(uploading: true, progress: 0);
      }
    }
    if (filesToUpload.isEmpty) return;
    if (!isClosed) {
      emit(
        state.copyWith(
          requestState: RequestState.loading,
          errorMessage: null,
          images: List.from(updated),
        ),
      );
    }
    final result = await _uploadImagesUseCase(
      filesToUpload,
      cancelToken: _cancelToken,
      onProgress: (sent, total) {
        if (isClosed) return;
        if (total > 0) {
          final progress = (sent / total).clamp(0.0, 0.99);
          for (final index in unUploadedIndices) {
            updated[index] = updated[index].copyWith(progress: progress);
          }
          emit(state.copyWith(images: List.from(updated)));
        }
      },
    );
    if (isClosed) return;
    switch (result) {
      case Success():
        for (final index in unUploadedIndices) {
          updated[index] = updated[index].copyWith(
            uploading: false,
            uploaded: true,
            progress: 1.0,
          );
        }
        emit(
          state.copyWith(
            requestState: RequestState.success,
            images: List.from(updated),
            uploadedCount: updated.length,
          ),
        );
      case Error():
        for (final index in unUploadedIndices) {
          updated[index] = updated[index].copyWith(
            uploading: false,
            progress: 0,
          );
        }
        emit(
          state.copyWith(
            requestState: RequestState.error,
            errorMessage: result.failure.message,
            images: List.from(updated),
          ),
        );
    }
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }
}

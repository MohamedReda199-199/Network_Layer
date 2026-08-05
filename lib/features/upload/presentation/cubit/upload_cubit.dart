import 'dart:io';

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

  Future<void> pickImages() async {
    final images = await _picker.pickMultiImage();
    if (images.isEmpty) return;
    final list = List<UploadImageModel>.from(state.images);
    for (final image in images) {
      list.add(UploadImageModel(file: File(image.path)));
    }
    emit(state.copyWith(images: list));
  }

  Future<void> pickCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
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
    final list = List<UploadImageModel>.from(state.images);
    list.removeAt(index);
    emit(state.copyWith(images: list));
  }

  void clearImages() {
    emit(state.copyWith(images: [], uploadedCount: 0));
  }

  Future<void> uploadImages() async {
    if (state.images.isEmpty) {
      return;
    }
    emit(state.copyWith(requestState: RequestState.loading));
    final updated = List<UploadImageModel>.from(state.images);
    int uploaded = 0;
    for (int i = 0; i < updated.length; i++) {
      updated[i] = updated[i].copyWith(
        uploading: true,
        uploaded: false,
        progress: 0,
      );
      emit(state.copyWith(images: List.from(updated)));
      final result = await _uploadImagesUseCase(
        [updated[i].file],
        onProgress: (sent, total) {
          updated[i] = updated[i].copyWith(
            progress: total == 0 ? 0 : sent / total,
          );
          emit(state.copyWith(images: List.from(updated)));
        },
      );
      switch (result) {
        case Success():
          uploaded++;
          updated[i] = updated[i].copyWith(
            uploading: false,
            uploaded: true,
            progress: 1,
          );
          emit(
            state.copyWith(images: List.from(updated), uploadedCount: uploaded),
          );
        case Error():
          updated[i] = updated[i].copyWith(uploading: false);

          emit(
            state.copyWith(
              requestState: RequestState.error,
              errorMessage: result.failure.message,
              images: List.from(updated),
            ),
          );

          return;
      }
    }
    emit(state.copyWith(requestState: RequestState.success));
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ligalife/core/enums/request_state.dart';
import 'upload_image_model.dart';
part 'upload_state.freezed.dart';

@freezed
abstract class UploadState with _$UploadState {
  const factory UploadState({
    @Default(RequestState.initial)
    RequestState requestState,

    @Default([])
    List<UploadImageModel> images,

    @Default(0)
    int uploadedCount,

    String? errorMessage,
  }) = _UploadState;
}
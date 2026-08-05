import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ligalife/core/enums/request_state.dart';
import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';
import '../widgets/upload_grid.dart';
import '../widgets/upload_header.dart';
import 'package:ligalife/core/widgets/dialogs/app_dialogs.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Images"),
        centerTitle: true,
      ),
      body: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {
          if (state.requestState == RequestState.success) {
            AppDialogs.showSuccess(
              context,
              title: "Success",
              message: "Images uploaded successfully",
              onConfirm: () {
                context.read<UploadCubit>().clearImages();
              },
            );
          }
          if (state.requestState == RequestState.error) {
            AppDialogs.showError(
              context,
              title: "Upload Failed",
              message: state.errorMessage ?? "An error occurred while uploading",
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              UploadHeader(state: state),
              Expanded(
                child: UploadGrid(
                  images: state.images,
                ),
              ),
              SafeArea(
                minimum: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton(
                    onPressed: state.images.isEmpty ||
                            state.requestState == RequestState.loading
                        ? null
                        : () {
                            context.read<UploadCubit>().uploadImages();
                          },
                    child: state.requestState == RequestState.loading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Upload Images",
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
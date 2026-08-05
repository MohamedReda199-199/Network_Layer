import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ligalife/app_router.dart';
import 'package:ligalife/core/enums/request_state.dart';
import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';
import '../widgets/upload_grid.dart';
import '../widgets/upload_header.dart';

@RoutePage()
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
           context.router.push(
              SuccessDialogRoute(
                title: 'Success',
                message: 'Images uploaded successfully',
                onPrimaryAction: () {
                  context.read<UploadCubit>().clearImages();
                  context.router.pop();
                },
              ),
            );
          }

          if (state.requestState == RequestState.error) {
            context.router.push(
              ErrorDialogRoute(
                title: 'Upload Failed',
                message:
                    state.errorMessage ?? 'An error occurred while uploading',
              ),
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
                        : () async {
                            final cubit = context.read<UploadCubit>();

                            final confirm = await context.router.push<bool>(
                              ConfirmationDialogRoute(
                                title: 'Start Upload?',
                                message:
                                    'Do you want to upload the selected images?',
                                primaryButtonText: 'Upload',
                                secondaryButtonText: 'Cancel',
                                isDismissible: true,
                              ),
                            );

                            if (confirm == true) {
                              cubit.uploadImages();
                            }
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
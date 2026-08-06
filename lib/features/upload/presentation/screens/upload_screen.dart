import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ligalife/core/di/injection.dart';
import 'package:ligalife/core/enums/request_state.dart';
import 'package:ligalife/core/widgets/dialogs/confirmation_dialog_page.dart';
import 'package:ligalife/core/widgets/dialogs/error_dialog_page.dart';
import 'package:ligalife/core/widgets/dialogs/success_dialog_page.dart';
import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';
import '../widgets/upload_grid.dart';
import '../widgets/upload_header.dart';

@RoutePage()
class UploadScreen extends StatelessWidget implements AutoRouteWrapper {
  const UploadScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<UploadCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Images"), centerTitle: true),
      body: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {
          if (state.requestState == RequestState.success) {
            showDialog(
              context: context,
              builder: (_) => SuccessDialogPage(
                title: 'Success',
                message: 'Images uploaded successfully',
                onPrimaryAction: () {
                  Navigator.pop(context);
                },
              ),
            );
          }
          if (state.requestState == RequestState.error) {
            showDialog(
              context: context,
              builder: (_) => ErrorDialogPage(
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
              Expanded(child: UploadGrid(images: state.images)),
              SafeArea(
                minimum: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton(
                    onPressed:
                        state.images.isEmpty ||
                            state.requestState == RequestState.loading
                        ? null
                        : () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (_) => ConfirmationDialogPage(
                                title: 'Start Upload?',
                                message:
                                    'Do you want to upload the selected images?',
                                primaryButtonText: 'Upload',
                                secondaryButtonText: 'Cancel',
                                onPrimaryAction: () {
                                  Navigator.pop(context, true);
                                },
                                onSecondaryAction: () {
                                  Navigator.pop(context, false);
                                },
                              ),
                            );
                            if (confirm == true) {
                              context.read<UploadCubit>().uploadImages();
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

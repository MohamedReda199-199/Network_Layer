import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ligalife/core/enums/request_state.dart';
import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';
import '../widgets/upload_grid.dart';
import '../widgets/upload_header.dart';

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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Images uploaded successfully"),
              ),
            );
          }
          if (state.requestState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? "Upload failed",
                ),
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
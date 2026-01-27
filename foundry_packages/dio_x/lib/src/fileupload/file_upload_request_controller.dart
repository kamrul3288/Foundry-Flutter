import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final class FileUploadRequestController
    extends Notifier<FileUploadRequestState> {
  final _picker = ImagePicker();

  @override
  FileUploadRequestState build() {
    return const FileUploadRequestState();
  }

  void pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      state = state.copyWith(imageFile: File(pickedFile.path));
    }
  }

  void uploadFile() async {
    final dio = Dio(); //it's not the best way to do it
    final formData = FormData.fromMap({
      'name': 'John Doe',
      'profile_image': await MultipartFile.fromFile(state.imageFile!.path),
    });
    try {
      state = state.copyWith(isUploading: true);
      final response = await dio.post(
        'https://example.com/upload',
        data: formData,
      );
      if (response.statusCode == 200) {
        state = state.copyWith(uploadSuccess: true, isUploading: false);
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isUploading: false);
    }
  }
}

final fileUplodControllerProvider =
    NotifierProvider.autoDispose<
      FileUploadRequestController,
      FileUploadRequestState
    >(() => FileUploadRequestController());

final class FileUploadRequestState {
  final File? imageFile;
  final bool isUploading;
  final String errorMessage;
  final bool uploadSuccess;

  const FileUploadRequestState({
    this.imageFile,
    this.isUploading = false,
    this.errorMessage = '',
    this.uploadSuccess = false,
  });

  FileUploadRequestState copyWith({
    File? imageFile,
    bool? isUploading,
    String? errorMessage,
    bool? uploadSuccess,
  }) {
    return FileUploadRequestState(
      imageFile: imageFile ?? this.imageFile,
      isUploading: isUploading ?? false,
      errorMessage: errorMessage ?? "",
      uploadSuccess: uploadSuccess ?? false,
    );
  }
}

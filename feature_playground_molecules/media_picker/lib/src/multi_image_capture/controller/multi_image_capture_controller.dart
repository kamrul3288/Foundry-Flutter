import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'capture_status.dart';
import 'multi_image_capture_state.dart';
import '../../provider/media_picker_provider.dart';
import '../../repository/image_repository.dart';

class MultiImageCaptureController extends Notifier<MultiImageCaptureState> {
  final _picker = ImagePicker();
  final maxImageCapture = 10;
  late ImageRepository imageRepository;

  @override
  MultiImageCaptureState build() {
    imageRepository = ref.read(imageRepositoryProvider);
    return MultiImageCaptureState();
  }

  Future<void> capturePhoto() async {
    if (state.photos.length >= maxImageCapture) {
      state = state.copyWith(captureStatus: CaptureFailure("You can capture a maximum of $maxImageCapture photos."));
      return;
    }
    state = state.copyWith(captureStatus: CaptureInProgress());
    try {
      final capturedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (capturedImage == null) {
        state = state.copyWith(captureStatus: CaptureFailure("Image capture cancelled."));
        return;
      }
      final capturedFile = File(capturedImage.path);
      final compressedFile = await imageRepository.compressImage(capturedFile);
      state = state.copyWith(photos: [...state.photos, compressedFile], captureStatus: CaptureSuccess());
    } catch (e) {
      state = state.copyWith(captureStatus: CaptureFailure(e.toString()));
    }
  }

  Future<void> delete(int index) async {
    final images = List<File>.from(state.photos);
    final fileToRemove = images[index];
    await imageRepository.deleteImageFile(fileToRemove);
    images.removeAt(index);
    state = state.copyWith(photos: images);
  }
}

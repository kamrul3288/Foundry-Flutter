import 'dart:io';
import 'package:file_uploader/src/file_uploader_internal.dart';
import 'package:file_uploader/src/multi_image_capture/multi_image_capture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final multiImageCaptureProvider = NotifierProvider<
    MultiImageCaptureController,
    MultiImageCaptureState
>(() => MultiImageCaptureController());

class MultiImageCaptureController extends Notifier<MultiImageCaptureState> {

  final _picker = ImagePicker();
  late final ImageRepository _imageRepository;


  @override
  MultiImageCaptureState build(){
    _imageRepository = ref.read(imageRepositoryProvider);
    return MultiImageCaptureState();
  }

  /// Captures a photo using the device camera, compresses it to be under 1MB,
  /// and adds it to the state if the maximum number of photos has not been reached.
  /// Displays toast messages for various states and errors.
  Future<void> capturePhoto() async {
    if (state.photos.length >= maxImageCapture) {
      _toast("You can capture a maximum of $maxImageCapture photos.");
      return;
    }
    state = state.copyWith(capturing: true);
    try {
      final capturedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (capturedImage == null) {
        _toast("Image capture cancelled.");
        return;
      }
      final capturedFile = File(capturedImage.path);
      final compressedFile = await _imageRepository.compressToUnder1MB(capturedFile);
      if (compressedFile == null) {
        return;
      }
      state = state.copyWith(photos: [...state.photos, compressedFile]);
    } catch(e){
      _toast(e.toString());
    }finally {
      state = state.copyWith(capturing: false);
    }
  }

  Future<void> delete(int index) async {
    final images = List<File>.from(state.photos);
    final fileToRemove = images[index];
    await _imageRepository.delete(fileToRemove);
    images.removeAt(index);
    state = state.copyWith(photos: images);
    _toast("Image removed.");
  }

  void _toast(String message) {
    final ctx = ref.read(scaffoldMessengerKeyProvider);
    ctx.currentState?.showSnackBar(SnackBar(content: Text(message)));
  }
}
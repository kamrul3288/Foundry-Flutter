part of 'multi_image_capture_screen.dart';

final _controllerProvider = NotifierProvider.autoDispose<MultiImageCaptureController, MultiImageCaptureState>(
  () => MultiImageCaptureController(),
);

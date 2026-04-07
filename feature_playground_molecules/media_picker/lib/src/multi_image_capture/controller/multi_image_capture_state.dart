import 'dart:io';
import 'package:media_picker/src/multi_image_capture/controller/capture_status.dart';
import 'package:media_picker/src/multi_image_capture/controller/upload_status.dart';

class MultiImageCaptureState {
  final List<File> photos;
  final CaptureStatus captureStatus;
  final UploadStatus uploadStatus;

  const MultiImageCaptureState({
    this.photos = const [],
    this.captureStatus = const CaptureInitial(),
    this.uploadStatus = const UploadInitial(),
  });

  MultiImageCaptureState copyWith({
    List<File>? photos,
    CaptureStatus? captureStatus,
    UploadStatus? uploadStatus,
  }) {
    return MultiImageCaptureState(
      photos: photos ?? this.photos,
      captureStatus: captureStatus ?? this.captureStatus,
      uploadStatus: uploadStatus ?? this.uploadStatus,
    );
  }
}

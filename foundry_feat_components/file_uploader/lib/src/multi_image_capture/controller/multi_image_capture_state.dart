import 'dart:io';

class MultiImageCaptureState {
  final List<File> photos;
  final bool capturing;
  final bool uploading;
  final double uploadProgress; // 0..1

  const MultiImageCaptureState({
    this.photos = const [],
    this.capturing = false,
    this.uploading = false,
    this.uploadProgress = 0.0,
  });

  MultiImageCaptureState copyWith({
    List<File>? photos,
    bool? capturing,
    bool? uploading,
    double? uploadProgress,
  }) {
    return MultiImageCaptureState(
      photos: photos ?? this.photos,
      capturing: capturing ?? this.capturing,
      uploading: uploading ?? this.uploading,
      uploadProgress: uploadProgress ?? this.uploadProgress,
    );
  }
}

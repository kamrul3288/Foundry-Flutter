sealed class UploadStatus {
  const UploadStatus();
}

class UploadInitial extends UploadStatus {
  const UploadInitial();
}

class UploadInProgress extends UploadStatus {
  const UploadInProgress();
}

class UploadSuccess extends UploadStatus {
  const UploadSuccess();
}

class UploadFailure extends UploadStatus {
  final String errorMessage;
  const UploadFailure(this.errorMessage);
}

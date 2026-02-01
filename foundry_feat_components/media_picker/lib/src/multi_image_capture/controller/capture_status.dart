sealed class CaptureStatus {
  const CaptureStatus();
}

class CaptureInitial extends CaptureStatus {
  const CaptureInitial();
}

class CaptureInProgress extends CaptureStatus {
  const CaptureInProgress();
}

class CaptureSuccess extends CaptureStatus {
  const CaptureSuccess();
}

class CaptureFailure extends CaptureStatus {
  final String errorMessage;
  const CaptureFailure(this.errorMessage);
}

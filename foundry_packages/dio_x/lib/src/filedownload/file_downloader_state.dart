class FileDownloaderState {
  final bool isDownloading;
  final String errorMessage;
  final double progress; // 0.0 to 1.0
  final String downloadedFileSize; //Actual bytes downloaded
  final String totalFileSize; //Total file size

  const FileDownloaderState({
    this.isDownloading = false,
    this.errorMessage = '',
    this.progress = 0,
    this.downloadedFileSize = '',
    this.totalFileSize = '',
  });

  FileDownloaderState copyWith({
    bool? isDownloading,
    String? errorMessage,
    double? progress,
    String? downloadedFileSize,
    String? totalFileSize,
  }) {
    return FileDownloaderState(
      isDownloading: isDownloading ?? this.isDownloading,
      errorMessage: errorMessage ?? this.errorMessage,
      progress: progress ?? this.progress,
      downloadedFileSize: downloadedFileSize ?? this.downloadedFileSize,
      totalFileSize: totalFileSize ?? this.totalFileSize,
    );
  }
}

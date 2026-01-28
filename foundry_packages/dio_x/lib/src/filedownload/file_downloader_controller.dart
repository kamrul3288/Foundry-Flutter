import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio_x/src/filedownload/file_downloader_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

// --- Providers ---
final _dioProvider = Provider((ref) => Dio());
final fileDownloaderProvider = NotifierProvider.autoDispose<FileDownloaderController, FileDownloaderState>(
  () => FileDownloaderController(),
);

class FileDownloaderController extends Notifier<FileDownloaderState> {
  CancelToken? _cancelToken;

  @override
  FileDownloaderState build() {
    ref.onDispose(() => _cancelToken?.cancel("User left screen"));
    return const FileDownloaderState();
  }

  Future<void> downloadFile() async {
    _cancelToken = CancelToken();

    // Reset state
    state = state.copyWith(isDownloading: true, progress: 0, errorMessage: '');
    final savePath = "${(await getApplicationDocumentsDirectory()).path}/100MB.bin";

    try {
      await ref
          .read(_dioProvider)
          .download(
            "https://fsn1-speed.hetzner.com/100MB.bin",
            savePath,
            cancelToken: _cancelToken,
            onReceiveProgress: (received, total) {
              if (total != -1) {
                final double newProgress = received / total;
                if ((newProgress - state.progress).abs() > 0.01 || newProgress == 1.0) {
                  state = state.copyWith(
                    isDownloading: true,
                    progress: newProgress,
                    downloadedFileSize: _formatBytes(received, 1),
                    totalFileSize: _formatBytes(total, 1),
                  );
                }
              }
            },
          );
      state = state.copyWith(isDownloading: false, progress: 1.0);
    } catch (e) {
      if (CancelToken.isCancel(e as DioException)) return;
      state = state.copyWith(errorMessage: e.toString(), isDownloading: false);
    }
  }

  String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}

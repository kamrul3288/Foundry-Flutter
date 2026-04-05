import 'file_downloader_controller.dart';
import 'widget/download_progress_view.dart';
import 'widget/no_download_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileDownloadScreen extends ConsumerWidget {
  const FileDownloadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(fileDownloaderProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Download'),
        actions: [
          IconButton(
            onPressed: () => controller.downloadFile(),
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _FileDownloadBody(),
      ),
    );
  }
}

class _FileDownloadBody extends ConsumerWidget {
  const _FileDownloadBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fileDownloaderProvider);

    if (state.errorMessage.isNotEmpty) {
      return Center(child: Text(state.errorMessage));
    }

    if (!state.isDownloading) {
      return const NoDownloadView();
    }

    return DownloadProgressView(
      progressValue: state.progress,
      progressPercentage: "${(state.progress * 100).toStringAsFixed(0)}%",
      sizeProgress: "${state.downloadedFileSize} / ${state.totalFileSize}",
    );
  }
}

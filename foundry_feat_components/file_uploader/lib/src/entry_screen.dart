import 'package:file_uploader/src/file_uploader_internal.dart';
import 'package:file_uploader/src/multi_image_capture/multi_image_capture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileUploaderEntryScreen extends StatelessWidget {
  const FileUploaderEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _App();
  }
}


class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        // Providing the root context for global access
        rootContextProvider.overrideWithValue(context),
        // Providing a ScaffoldMessengerKey for global SnackBar access
        scaffoldMessengerKeyProvider.overrideWithValue(GlobalKey<ScaffoldMessengerState>()),
      ],
      child: MaterialApp(
        home: MultiImageCaptureScreen(),
      ),
    );
  }
}

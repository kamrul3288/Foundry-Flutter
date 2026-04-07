import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_picker/src/multi_image_capture/multi_image_capture_screen.dart';
import 'package:media_picker/src/provider/media_picker_provider.dart';

class MediaPickerMainScreen extends StatelessWidget {
  const MediaPickerMainScreen({super.key});
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
        home: Scaffold(
          appBar: AppBar(title: Text('Media Picker')),
          body: _MediaPickerBody(),
        ),
      ),
    );
  }
}

class _MediaPickerBody extends StatelessWidget {
  const _MediaPickerBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _ActionButton(
          title: 'Multi Image Capture',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MultiImageCaptureScreen()),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: Text(title, style: TextStyle(color: Colors.blue)),
      onTap: onTap,
    );
  }
}

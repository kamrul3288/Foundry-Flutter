import 'package:dio_x/src/fileupload/file_upload_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class FileUploadRequestScreen extends ConsumerWidget {
  const FileUploadRequestScreen({super.key});

  void lisenImageUploaderResult(WidgetRef ref, BuildContext context) {
    ref.listen(fileUplodControllerProvider.select((state) => state.uploadSuccess), (previous, current) {
      if (current) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('File uploaded successfully')));
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(fileUplodControllerProvider.notifier);
    lisenImageUploaderResult(ref, context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Upload Request'),
        actions: [
          _ActionIcon(
            onTapPicker: () => controller.pickImage(ImageSource.gallery),
            onTapUpload: () => controller.uploadFile(),
          ),
        ],
      ),
      body: _ImageUploader(),
    );
  }
}

class _ActionIcon extends ConsumerWidget {
  final VoidCallback onTapPicker;
  final VoidCallback onTapUpload;

  const _ActionIcon({required this.onTapPicker, required this.onTapUpload});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(fileUplodControllerProvider.select((state) => state.imageFile));
    if (imageFile == null) {
      return IconButton(
        icon: const Icon(Icons.add_a_photo),
        onPressed: onTapPicker,
      );
    }
    return IconButton(icon: const Icon(Icons.check), onPressed: onTapUpload);
  }
}

class _ImageUploader extends ConsumerWidget {
  const _ImageUploader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUploading = ref.watch(fileUplodControllerProvider.select((state) => state.isUploading));
    if (!isUploading) return _ImagePreview();

    return const Center(child: CircularProgressIndicator.adaptive());
  }
}

class _ImagePreview extends ConsumerWidget {
  const _ImagePreview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(fileUplodControllerProvider.select((state) => state.imageFile));
    if (imageFile == null) {
      return const Center(
        child: Text(
          "No Image Selected, Click on the camera icon to select an image",
          textAlign: TextAlign.center,
        ),
      );
    }
    return Image.file(imageFile);
  }
}

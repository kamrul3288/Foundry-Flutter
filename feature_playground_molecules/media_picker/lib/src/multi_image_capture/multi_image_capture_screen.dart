import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_picker/src/multi_image_capture/controller/capture_status.dart';
import 'package:media_picker/src/multi_image_capture/controller/multi_image_capture_controller.dart';
import 'package:media_picker/src/multi_image_capture/controller/multi_image_capture_state.dart';
import 'package:media_picker/src/multi_image_capture/widget/captured_image_grids.dart';
part 'multi_image_capture_provider.dart';

/// Problem story of this screen goes here:
/// - Captures camera-only photos, max 10.
/// - Compresses each to ≤ 1 MB (iteratively quality+resize).
/// - Displays thumbnails in a grid (row-wise) with delete.
/// - Stores images in app temp dir (no external storage permission).
/// - Deletes file when the user removes an image and cleans up all files after upload.
/// - Uses downscaled thumbnails to avoid OOM.
class MultiImageCaptureScreen extends ConsumerWidget {
  const MultiImageCaptureScreen({super.key});

  void _handleCaptureError(WidgetRef ref, BuildContext context) {
    ref.listen(_controllerProvider, (previous, next) {
      if (next.captureStatus case CaptureFailure error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.errorMessage)));
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _handleCaptureError(ref, context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Max 10 Images'),
        centerTitle: true,
      ),
      body: _CaptureScreenBody(),
    );
  }
}

class _CaptureScreenBody extends ConsumerWidget {
  const _CaptureScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_controllerProvider.notifier);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _IconButton(
              onPressed: () => controller.capturePhoto(),
              icon: Icons.camera_alt,
              label: 'Capture Image',
            ),

            Consumer(
              builder: (_, ref, _) {
                final photos = ref.watch(_controllerProvider.select((state) => state.photos));
                final isLoading = ref.watch(
                  _controllerProvider.select((state) => state.captureStatus is CaptureInProgress),
                );
                return Expanded(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CapturedImageGrids(
                          images: photos,
                          onDelete: (index) => controller.delete(index),
                        ),
                );
              },
            ),

            _IconButton(
              onPressed: () {},
              icon: Icons.upload,
              label: 'Upload Image',
            ),
          ],
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  const _IconButton({required this.onPressed, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: TextButton.styleFrom(minimumSize: Size(double.infinity, 50)),
    );
  }
}

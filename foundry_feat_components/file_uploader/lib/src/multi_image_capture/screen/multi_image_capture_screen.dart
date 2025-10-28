import 'dart:io';
import 'package:file_uploader/src/multi_image_capture/multi_image_capture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../file_uploader_internal.dart';

/// Problem story of this screen goes here:
/// - Captures camera-only photos, max 10.
/// - Compresses each to ≤ 1 MB (iteratively quality+resize).
/// - Displays thumbnails in a grid (row-wise) with delete.
/// - Stores images in app temp dir (no external storage permission).
/// - Deletes file when the user removes an image and cleans up all files after upload.
/// - Uses downscaled thumbnails to avoid OOM.
class MultiImageCaptureScreen extends ConsumerWidget {
  const MultiImageCaptureScreen({super.key});


  // Avoid decoding huge bitmaps: ask engine for a smaller cached decode.
  // This keeps memory low even with many tiles on-screen.
  ImageProvider _thumbOf(File file) {
    return ResizeImage(
      FileImage(file),
      width: 600,
    );
  }


  void _checkCameraPermission(BuildContext context,WidgetRef ref) async {
    final imageCaptureController = ref.read(multiImageCaptureProvider.notifier);

    var status = await Permission.camera.status;

    if (status.isGranted){
      imageCaptureController.capturePhoto();
      return;
    }

    if (status.isDenied) {
      status = await Permission.camera.request();
      if (status.isGranted) {
        imageCaptureController.capturePhoto();
        return;
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted || status.isLimited) {
      if (context.mounted) {
        final go = await _askOpenSettings(context);
        if (go) {
          await openAppSettings();
          final after = await Permission.camera.status;
          if (after.isGranted) {
            imageCaptureController.capturePhoto();
          }
        }
      }
    }
  }

  Future<bool> _askOpenSettings(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Camera permission needed'),
        content: const Text(
            'We need access to the camera to capture photos. '
                'Please enable Camera permission in Settings.'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Open Settings'),
          ),
        ],
      ),
    ) ?? false;
  }

  Widget _buildImageGrid(WidgetRef ref) {
    final imageCaptureController = ref.read(multiImageCaptureProvider.notifier);
    final images = ref.watch(multiImageCaptureProvider.select((state) => state.photos));

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: images.length,
        itemBuilder: (context,index){
          return Stack(
            children: [
              Positioned.fill(
                child: Image(
                  image: _thumbOf(images[index]),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                )
              ),
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  visualDensity: VisualDensity(horizontal: -4,vertical: -4),
                  padding: EdgeInsets.zero,
                  style: IconButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  icon: const Icon(Icons.highlight_remove_outlined),
                  onPressed: ()=> imageCaptureController.delete(index),
                )
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageCaptureController = ref.read(multiImageCaptureProvider.notifier);

    return ScaffoldMessenger(
      key: ref.watch(scaffoldMessengerKeyProvider),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Capture Max 10 Images'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [


                TextButton.icon(
                  onPressed: ()=> imageCaptureController.capturePhoto(),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Capture Image'),
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 50)
                  ),
                ),

                Consumer(builder: (_,ref,_) => _buildImageGrid(ref)),

                TextButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.upload),
                  label: const Text('Upload Image'),
                  style: TextButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}

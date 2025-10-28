import 'dart:io';
import 'package:file_uploader/src/file_uploader_internal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

final class ImageRepository{
  final Ref ref;
  ImageRepository(this.ref);

  /// Compresses the given image file to ensure its size is under 1MB.
  /// Uses iterative compression by reducing quality and dimensions.
  /// Returns the compressed file if successful, or null if compression fails.
  Future<File?> compressToUnder1MB(File inputImageFile) async{
    if (await _isImageBelow1MB(inputImageFile)) {
      return inputImageFile;
    }

    final tempDir = await getTemporaryDirectory();
    final dir = Directory(path.join(tempDir.path, 'app_images'));
    if (!await dir.exists()) await dir.create(recursive: true);


    final outPath = path.join(dir.path, "c_${DateTime.now().microsecondsSinceEpoch}_${path.basename(inputImageFile.path)}");

    for (int attempt = 1; attempt < 8; attempt++) {
      final compressedXFile = await FlutterImageCompress.compressAndGetFile(
        inputImageFile.path,
        outPath,
        quality: imageQuality - attempt * 5,
        minWidth: maxImageWidth.toInt() - attempt * 100,
        minHeight: maxImageHeight.toInt() - attempt * 45,
        autoCorrectionAngle: true,
        keepExif: false,
      );

      if (compressedXFile == null) {
        _toast("Compression failed on attempt $attempt.");
        return null;
      }

      final compressedFile = File(compressedXFile.path);
      if (await _isImageBelow1MB(compressedFile)) {
        return compressedFile;
      }
    }
    _toast("Unable to compress image below 1MB. Use a different image.");
    return null;
  }

  /// Checks if the given image file is below 1MB in size.
  /// Returns true if the file size is within the limit, false otherwise.
  Future<bool> _isImageBelow1MB(File imageFile) async{
    final int bytes = await imageFile.length();
    return bytes <= 1024 * 1024;
  }

  /// Removes the photo at the specified index from the state and deletes the file.
  /// If the index is invalid or the file does not exist, no action is taken.
  Future<bool> delete(File imageFile) async {
    if(await imageFile.exists()) {
      await imageFile.delete();
      return true;
    }else {
      return false;
    }
  }

  void _toast(String message) {
    final ctx = ref.read(scaffoldMessengerKeyProvider);
    ctx.currentState?.showSnackBar(SnackBar(content: Text(message)));
  }

}
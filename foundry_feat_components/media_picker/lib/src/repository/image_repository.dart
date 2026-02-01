import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

final class ImageRepository {
  const ImageRepository();

  Future<File> compressImage(File imageFile, {int maxSizeInKb = 512}) async {
    // 1. Quick Check: Is it already small enough?
    int fileLength = await imageFile.length();
    if (fileLength < maxSizeInKb * 1024) {
      return imageFile;
    }

    // 2. Prepare Output Path
    final dir = await _appImagesDir();
    final outPath = path.join(
      dir.path,
      "compressed_${DateTime.now().microsecondsSinceEpoch}}.jpg",
    );

    // 3. Compress Image
    int quality = 90;
    int attempt = 0;
    File? bestResult;
    final imageBytes = await imageFile.readAsBytes();
    final decodedImage = await decodeImageFromList(imageBytes);
    final int originalWidth = decodedImage.width;
    final int originalHeight = decodedImage.height;

    while (attempt < 5) {
      try {
        final XFile? compressedXFile = await FlutterImageCompress.compressAndGetFile(
          imageFile.path,
          outPath,
          quality: quality,
          minWidth: originalWidth ~/ (1 + (attempt * 0.3)),
          minHeight: originalHeight ~/ (1 + (attempt * 0.3)),
        );

        if (compressedXFile == null) throw Exception("Compression returned null");

        final compressedFile = File(compressedXFile.path);
        final int newSize = await compressedFile.length();
        // Check if we hit the target
        if (newSize <= maxSizeInKb * 1024) {
          bestResult = compressedFile;
          break;
        }
        // If not, prepare for next loop
        quality -= 10;
        if (quality < 50) quality = 50;
        attempt++;
      } catch (_) {
        break;
      }
    }
    if (bestResult == null) {
      throw Exception("Image compression failed");
    }
    return bestResult;
  }

  /// Removes the photo at the specified index from the state and deletes the file.
  /// If the index is invalid or the file does not exist, no action is taken.
  Future<bool> deleteImageFile(File imageFile) async {
    if (await imageFile.exists()) {
      await imageFile.delete();
      return true;
    } else {
      return false;
    }
  }

  Future<Directory> _appImagesDir() async {
    final cache = await getTemporaryDirectory();
    final dir = Directory(path.join(cache.path, 'app_images'));
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  // Future<File> _moveOrCopy(File src, String destPath) async {
  //   try {
  //     return await src.rename(destPath); // fast path (same volume)
  //   } catch (_) {
  //     return await src.copy(destPath); // fallback across volumes
  //   }
  // }
}

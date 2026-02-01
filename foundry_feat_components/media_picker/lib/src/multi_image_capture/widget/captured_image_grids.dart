import 'dart:io';
import 'package:flutter/material.dart';

class CapturedImageGrids extends StatelessWidget {
  final List<File> images;
  final Function(int index) onDelete;
  const CapturedImageGrids({
    super.key,
    required this.images,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return _ImageItem(
          image: images[index],
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}

class _ImageItem extends StatelessWidget {
  final File image;
  final VoidCallback onDelete;
  const _ImageItem({required this.image, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image(
            image: ResizeImage(FileImage(image), width: 600),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: IconButton(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            icon: const Icon(Icons.highlight_remove_outlined),
            onPressed: onDelete,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DownloadProgressView extends StatelessWidget {
  final double progressValue; // e.g., 0.45
  final String progressPercentage; // e.g., "45%"
  final String sizeProgress; // e.g., "1.2 MB / 5.0 MB"

  const DownloadProgressView({
    super.key,
    required this.progressValue,
    required this.progressPercentage,
    required this.sizeProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          progressPercentage,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: progressValue),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            sizeProgress,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 12, // Slightly increased for readability
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

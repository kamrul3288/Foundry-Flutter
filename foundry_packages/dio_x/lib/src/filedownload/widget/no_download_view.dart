import 'package:flutter/material.dart';

class NoDownloadView extends StatelessWidget {
  const NoDownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No download in progress. Click the download button to start.',
        style: TextStyle(color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}

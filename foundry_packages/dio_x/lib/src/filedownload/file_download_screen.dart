import 'package:flutter/material.dart';

class FileDownloadScreen extends StatelessWidget {
  const FileDownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Download')),
      body: const Center(child: Text('File Download')),
    );
  }
}

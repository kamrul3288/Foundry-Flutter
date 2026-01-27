import 'package:dio_x/src/filedownload/file_download_screen.dart';
import 'package:dio_x/src/fileupload/file_upload_request_screen.dart';
import 'package:dio_x/src/get/get_request_screen.dart';
import 'package:dio_x/src/post/post_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioMainScreen extends StatelessWidget {
  const DioMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Dio Main Screen')),
          body: Builder(
            builder: (context) => ListView(
              children: [
                _ActionButton(
                  title: 'Get Request',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => GetRequestScreen()),
                  ),
                ),
                _ActionButton(
                  title: 'Post Request',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PostRequestScreen()),
                  ),
                ),
                _ActionButton(
                  title: 'File Upload Request',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FileUploadRequestScreen(),
                    ),
                  ),
                ),
                _ActionButton(
                  title: 'File Download',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FileDownloadScreen()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

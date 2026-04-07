import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkg_flutter_secure_storage/src/constant/secure_storage_key.dart';
import 'package:pkg_flutter_secure_storage/src/provider/secure_storage_provider.dart';

class ReadAndDeleteScreen extends ConsumerStatefulWidget {
  const ReadAndDeleteScreen({super.key});

  @override
  ConsumerState<ReadAndDeleteScreen> createState() => _ReadAndDeleteScreenState();
}

class _ReadAndDeleteScreenState extends ConsumerState<ReadAndDeleteScreen> {
  var allData = "";

  void _fetchAllSecureStorageData() async {
    final secureStorage = ref.read(secureStorageProvider);
    final data = await secureStorage.readAll();
    setState(() {
      allData = data.entries.map((e) => "${e.key} : ${e.value}").join("\n");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read & Delete"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              allData.isEmpty ? "No Data Found" : allData,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),

            Spacer(),
            TextButton.icon(
              onPressed: _fetchAllSecureStorageData,
              icon: Icon(Icons.refresh),
              label: const Text("Read All Secure Data"),
            ),

            TextButton.icon(
              onPressed: () async {
                final secureStorage = ref.read(secureStorageProvider);
                await secureStorage.delete(key: SecureStorageKey.email);
                _fetchAllSecureStorageData();
              },
              icon: Icon(Icons.remove_circle),
              label: const Text("Delete Secure Storage `${SecureStorageKey.email}` key"),
              style: TextButton.styleFrom(foregroundColor: Colors.red),
            ),

            TextButton.icon(
              onPressed: () async {
                final secureStorage = ref.read(secureStorageProvider);
                await secureStorage.deleteAll();
                _fetchAllSecureStorageData();
              },
              label: const Text("Delete All Secure Storage Data"),
              icon: Icon(Icons.delete_forever),
              style: TextButton.styleFrom(foregroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

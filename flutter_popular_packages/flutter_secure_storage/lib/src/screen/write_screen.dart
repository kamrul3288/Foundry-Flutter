import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkg_flutter_secure_storage/src/constant/secure_storage_key.dart';
import 'package:pkg_flutter_secure_storage/src/provider/secure_storage_provider.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Load existing data from secure storage if any
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final secureStorage = ref.read(secureStorageProvider);
      _firstNameController.text = await secureStorage.read(key: SecureStorageKey.firstName) ?? "";
      _lastNameController.text = await secureStorage.read(key: SecureStorageKey.lastName) ?? "";
      _emailController.text = await secureStorage.read(key: SecureStorageKey.email) ?? "";
      _passwordController.text = await secureStorage.read(key: SecureStorageKey.password) ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Write Secure Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: "First name"),
            ),

            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: "Last name"),
            ),

            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),

            FilledButton(
              onPressed: () async {
                final secureStorage = ref.read(secureStorageProvider);
                await secureStorage.write(key: SecureStorageKey.firstName, value: _firstNameController.text);
                await secureStorage.write(key: SecureStorageKey.lastName, value: _lastNameController.text);
                await secureStorage.write(key: SecureStorageKey.email, value: _emailController.text);
                await secureStorage.write(key: SecureStorageKey.password, value: _passwordController.text);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Data written to secure storage"),
                    ),
                  );
                }
              },
              child: const Text("Write Data"),
            ),
          ],
        ),
      ),
    );
  }
}

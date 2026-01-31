import 'package:dio_x/src/interceptor/interceptor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InterceptorScreen extends ConsumerWidget {
  const InterceptorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interceptor'),
      ),
      body: Center(
        child: posts.when(
          data: (data) => Text(data['title']),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

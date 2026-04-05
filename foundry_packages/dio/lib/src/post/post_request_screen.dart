import 'post_request_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostRequestScreen extends ConsumerWidget {
  const PostRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postRequestProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Post Request')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: state.when(
            data: (data) => Text(data.toString()),
            error: (error, stack) => Text(error.toString()),
            loading: () => CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );
  }
}

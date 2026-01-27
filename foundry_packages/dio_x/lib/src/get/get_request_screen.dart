import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio_x/src/get/get_request_provider.dart';

class GetRequestScreen extends ConsumerWidget {
  const GetRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getRequestProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Get Request')),
      body: state.when(
        data: (data) => Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(data['title']),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
    );
  }
}

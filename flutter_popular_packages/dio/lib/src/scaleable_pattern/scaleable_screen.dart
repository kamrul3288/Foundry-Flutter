import 'package:pkg_dio/src/scaleable_pattern/post_controller.dart';
import 'package:pkg_dio/src/scaleable_pattern/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScaleableScreen extends ConsumerStatefulWidget {
  const ScaleableScreen({super.key});

  @override
  ConsumerState<ScaleableScreen> createState() => _ScaleableScreenState();
}

class _ScaleableScreenState extends ConsumerState<ScaleableScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(postControllerProvider.notifier).getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Post List")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: _buildBody(state),
      ),
    );
  }

  Widget _buildBody(PostState state) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 10),
            Text(
              state.error,
              style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                ref.read(postControllerProvider.notifier).getPosts();
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Retry"),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: state.result.length,
      itemBuilder: (context, index) {
        final post = state.result[index];
        return Card(
          elevation: 0,
          child: ListTile(
            leading: CircleAvatar(
              child: Text(post.id.toString()),
            ),
            title: Text(
              post.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              post.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}

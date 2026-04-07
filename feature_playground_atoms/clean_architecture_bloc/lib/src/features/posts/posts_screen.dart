import 'package:clean_architecture_bloc/src/domain/entity/post_entity.dart';
import 'package:clean_architecture_bloc/src/features/posts/bloc/posts_cubit.dart';
import 'package:clean_architecture_bloc/src/locale/extensions/app_locale_extension.dart';
import 'package:clean_architecture_bloc/src/ui/error_handling/failure_message_resolver.dart';
import 'package:clean_architecture_bloc/src/ui/widgets/network_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostsCubit>().fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.title_posts)),
      backgroundColor: Theme.of(context).colorScheme.surface.withValues(alpha: 0.96),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          return switch (state.uiState) {
            PostsUiState.loading => const Center(child: CircularProgressIndicator()),
            PostsUiState.error => NetworkErrorScreen(
              message: state.failure?.resolveMessage(context),
              onRetry: () => context.read<PostsCubit>().fetchPosts(),
            ),
            PostsUiState.success => _PostListView(posts: state.posts),
          };
        },
      ),
    );
  }
}

class _PostListView extends StatelessWidget {
  const _PostListView({required this.posts});

  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemCount: posts.length,
      itemBuilder: (context, index) => _PostCard(post: posts[index]),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      margin: const EdgeInsets.only(bottom: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Navigate to post details
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Text(
                      '${post.id}',
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      post.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                post.body,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

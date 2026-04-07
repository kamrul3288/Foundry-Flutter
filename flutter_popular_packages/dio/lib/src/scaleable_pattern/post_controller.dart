import 'package:pkg_dio/src/scaleable_pattern/model/post.dart';
import 'package:pkg_dio/src/scaleable_pattern/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class PostController extends Notifier<PostState> {
  @override
  PostState build() {
    return PostState.loading();
  }

  Future<void> getPosts() async {
    final postRepository = ref.read(postRepositoryProvider);
    state = PostState.loading();
    final result = await postRepository.getPosts();
    result.when(
      success: (result) => state = PostState.success(result),
      failure: (error) => state = PostState.error(error.message),
    );
  }
}

final class PostState {
  final List<Post> result;
  final bool isLoading;
  final String error;

  PostState._({
    this.result = const [],
    this.isLoading = false,
    this.error = '',
  });

  PostState.loading() : this._(isLoading: true);
  PostState.success(List<Post> result) : this._(result: result);
  PostState.error(String error) : this._(error: error);
}

part of 'posts_cubit.dart';

final class PostsState extends Equatable {
  final PostsUiState uiState;
  final List<PostEntity> posts;
  final Failure? failure;

  const PostsState({
    this.uiState = PostsUiState.loading,
    this.posts = const [],
    this.failure,
  });

  PostsState copyWith({
    PostsUiState? uiState,
    List<PostEntity>? posts,
    Failure? failure,
  }) {
    return PostsState(
      uiState: uiState ?? this.uiState,
      posts: posts ?? this.posts,
      failure: failure,
    );
  }

  @override
  List<Object?> get props => [uiState, posts, failure];
}

enum PostsUiState { loading, success, error }

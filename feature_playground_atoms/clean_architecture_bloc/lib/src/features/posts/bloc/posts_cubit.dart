import '../../../common/result/failure.dart';
import '../../../domain/entity/post_entity.dart';
import '../../../domain/usecase/get_posts_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetPostsUseCase _getPostsUseCase;

  PostsCubit(this._getPostsUseCase) : super(const PostsState());

  void fetchPosts() async {
    emit(state.copyWith(uiState: PostsUiState.loading));
    final result = await _getPostsUseCase();
    result.when(
      success: (posts) => emit(state.copyWith(uiState: PostsUiState.success, posts: posts)),
      failure: (failure) => emit(state.copyWith(uiState: PostsUiState.error, failure: failure)),
    );
  }
}

import 'package:clean_architecture_bloc/src/common/result/failure.dart';
import 'package:clean_architecture_bloc/src/common/result/result.dart';
import 'package:clean_architecture_bloc/src/domain/entity/post_entity.dart';
import 'package:clean_architecture_bloc/src/domain/repository/post_repository.dart';
import 'package:clean_architecture_bloc/src/domain/usecase/base_usecase.dart';

class GetPostsUseCase extends RemoteUseCaseNoParams<List<PostEntity>> {
  final PostRepository _repository;

  GetPostsUseCase(this._repository);

  @override
  Future<Result<List<PostEntity>, Failure>> call() {
    return _repository.getPosts();
  }
}

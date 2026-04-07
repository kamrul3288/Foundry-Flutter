import '../../common/result/failure.dart';
import '../../common/result/result.dart';
import '../entity/post_entity.dart';
import '../repository/post_repository.dart';
import 'base_usecase.dart';

class GetPostsUseCase extends RemoteUseCaseNoParams<List<PostEntity>> {
  final PostRepository _repository;

  GetPostsUseCase(this._repository);

  @override
  Future<Result<List<PostEntity>, Failure>> call() {
    return _repository.getPosts();
  }
}

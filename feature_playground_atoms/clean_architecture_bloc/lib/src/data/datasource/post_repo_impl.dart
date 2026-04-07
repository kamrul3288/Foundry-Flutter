import '../../common/result/failure.dart';
import '../../common/result/result.dart';
import '../client/rest_client.dart';
import '../client/rest_client_executor.dart';
import '../dto/post_dto.dart';
import '../mapper/post_dto_mapper.dart';
import '../../domain/entity/post_entity.dart';
import '../../domain/repository/post_repository.dart';

final class PostRepoImpl extends PostRepository with RestClientExecutor {
  final RestClient _restClient;
  PostRepoImpl(this._restClient);

  @override
  Future<Result<List<PostEntity>, Failure>> getPosts() {
    return execute(() async {
      final response = await _restClient.get('/posts');
      return (response as List<dynamic>).map((e) => PostDto.fromJson(e).toPostEntity).toList();
    });
  }
}

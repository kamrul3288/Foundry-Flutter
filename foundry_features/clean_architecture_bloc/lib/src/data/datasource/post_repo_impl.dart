import 'package:clean_architecture_bloc/src/data/client/rest_client.dart';
import 'package:clean_architecture_bloc/src/data/client/rest_client_executor.dart';
import 'package:clean_architecture_bloc/src/data/dto/post_dto.dart';
import 'package:clean_architecture_bloc/src/data/mapper/post_dto_mapper.dart';
import 'package:clean_architecture_bloc/src/domain/entity/post_entity.dart';
import 'package:clean_architecture_bloc/src/domain/repository/post_repository.dart';
import 'package:clean_architecture_bloc/src/domain/utils/result.dart';

final class PostRepoImpl extends PostRepository with RestClientExecutor {
  final RestClient _restClient;
  PostRepoImpl(this._restClient);

  @override
  Future<Result<List<PostEntity>>> getPosts() {
    return execute(() async {
      final response = await _restClient.get<List<dynamic>>('/posts');
      return response.map((e) => PostDto.fromJson(e).toPostEntity).toList();
    });
  }
}

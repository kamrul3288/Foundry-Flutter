import '../client/api_safe_wrapper.dart';
import '../client/rest_client.dart';
import '../model/post.dart';
import '../model/result.dart';

final class PostRepository with ApiSafeWrapper {
  final RestClient _restClient;

  PostRepository(this._restClient);

  Future<Result<List<Post>>> getPosts() async {
    return safeApiCall<List<Post>>(() async {
      final response = await _restClient.get<List<dynamic>>('/posts');
      return response.map((e) => Post.fromJson(e)).toList();
    });
  }
}

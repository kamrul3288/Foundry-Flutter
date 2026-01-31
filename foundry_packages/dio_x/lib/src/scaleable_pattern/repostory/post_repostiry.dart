import 'package:dio_x/src/scaleable_pattern/client/api_safe_wrapper.dart';
import 'package:dio_x/src/scaleable_pattern/client/rest_client.dart';
import 'package:dio_x/src/scaleable_pattern/model/post.dart';
import 'package:dio_x/src/scaleable_pattern/model/result.dart';

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

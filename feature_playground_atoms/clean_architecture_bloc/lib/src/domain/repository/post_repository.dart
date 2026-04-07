import '../../common/result/failure.dart';
import '../../common/result/result.dart';
import '../entity/post_entity.dart';

abstract class PostRepository {
  Future<Result<List<PostEntity>, Failure>> getPosts();
}

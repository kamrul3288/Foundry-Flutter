import 'package:clean_architecture_bloc/src/domain/entity/post_entity.dart';
import 'package:clean_architecture_bloc/src/domain/utils/result.dart';

abstract class PostRepository {
  Future<Result<List<PostEntity>>> getPosts();
}

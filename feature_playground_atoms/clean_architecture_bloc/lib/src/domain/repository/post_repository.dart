import 'package:clean_architecture_bloc/src/common/result/failure.dart';
import 'package:clean_architecture_bloc/src/common/result/result.dart';
import 'package:clean_architecture_bloc/src/domain/entity/post_entity.dart';

abstract class PostRepository {
  Future<Result<List<PostEntity>, Failure>> getPosts();
}

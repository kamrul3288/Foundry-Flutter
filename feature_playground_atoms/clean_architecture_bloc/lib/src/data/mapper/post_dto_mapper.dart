import 'package:clean_architecture_bloc/src/data/dto/post_dto.dart';
import 'package:clean_architecture_bloc/src/domain/entity/post_entity.dart';

extension PostDtoMapper on PostDto {
  PostEntity get toPostEntity => PostEntity(
    id: id ?? 0,
    title: title ?? '',
    body: body ?? '',
  );
}

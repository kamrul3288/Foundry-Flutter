import '../dto/post_dto.dart';
import '../../domain/entity/post_entity.dart';

extension PostDtoMapper on PostDto {
  PostEntity get toPostEntity => PostEntity(
    id: id ?? 0,
    title: title ?? '',
    body: body ?? '',
  );
}

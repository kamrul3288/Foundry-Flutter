import 'package:json_annotation/json_annotation.dart';
part '../generated/post_dto.g.dart';

@JsonSerializable(createToJson: false)
final class PostDto {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  PostDto({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) => _$PostDtoFromJson(json);
}

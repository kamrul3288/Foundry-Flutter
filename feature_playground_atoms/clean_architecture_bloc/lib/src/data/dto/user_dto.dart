import 'package:json_annotation/json_annotation.dart';
part '../generated/user_dto.g.dart';

@JsonSerializable(createToJson: false)
final class UserDto {
  final String? phone;
  final String? name;
  final String? email;

  UserDto({
    this.phone,
    this.name,
    this.email,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}

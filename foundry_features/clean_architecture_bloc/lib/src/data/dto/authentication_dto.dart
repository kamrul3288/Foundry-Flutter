import 'package:json_annotation/json_annotation.dart';
part '../generated/authentication_dto.g.dart';

@JsonSerializable(createToJson: false)
final class AuthenticationDto {
  final String? token;
  final String? message;

  AuthenticationDto({
    this.token,
    this.message,
  });

  factory AuthenticationDto.fromJson(Map<String, dynamic> json) => _$AuthenticationDtoFromJson(json);
}

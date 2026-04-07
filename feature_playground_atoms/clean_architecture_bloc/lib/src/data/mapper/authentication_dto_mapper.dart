import '../dto/authentication_dto.dart';
import '../../domain/entity/authentication_entity.dart';

extension AuthenticationDtoMapper on AuthenticationDto {
  AuthenticationEntity get toAuthenticationEntity => AuthenticationEntity(
    message: message ?? '',
    token: token ?? '',
  );
}

import 'package:clean_architecture_bloc/src/data/dto/authentication_dto.dart';
import 'package:clean_architecture_bloc/src/domain/entity/authentication_entity.dart';

extension AuthenticationDtoMapper on AuthenticationDto {
  AuthenticationEntity get toAuthenticationEntity => AuthenticationEntity(
    message: message ?? '',
    token: token ?? '',
  );
}

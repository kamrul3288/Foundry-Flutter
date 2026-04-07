import 'package:clean_architecture_bloc/src/data/dto/user_dto.dart';
import 'package:clean_architecture_bloc/src/domain/entity/user_entity.dart';

extension UserDtoMapper on UserDto {
  UserEntity get toUserEntity => UserEntity(
    phone: phone ?? '',
    name: name ?? '',
    email: email ?? '',
  );
}

import '../dto/user_dto.dart';
import '../../domain/entity/user_entity.dart';

extension UserDtoMapper on UserDto {
  UserEntity get toUserEntity => UserEntity(
    phone: phone ?? '',
    name: name ?? '',
    email: email ?? '',
  );
}

import 'package:clean_architecture_bloc/src/domain/entity/authentication_entity.dart';
import 'package:clean_architecture_bloc/src/domain/entity/user_entity.dart';
import 'package:clean_architecture_bloc/src/domain/utils/result.dart';

abstract class AuthRepository {
  Future<Result<AuthenticationEntity>> login(String phone, String password);
  Future<Result<UserEntity>> getProfile();
}

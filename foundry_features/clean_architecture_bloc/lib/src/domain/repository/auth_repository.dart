import 'package:clean_architecture_bloc/src/common/result/failure.dart';
import 'package:clean_architecture_bloc/src/common/result/result.dart';
import 'package:clean_architecture_bloc/src/domain/entity/authentication_entity.dart';
import 'package:clean_architecture_bloc/src/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<Result<AuthenticationEntity, Failure>> login(String email, String password);
  Future<Result<UserEntity, Failure>> getProfile();
}

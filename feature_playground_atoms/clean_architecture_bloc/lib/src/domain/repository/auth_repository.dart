import '../../common/result/failure.dart';
import '../../common/result/result.dart';
import '../entity/authentication_entity.dart';
import '../entity/user_entity.dart';

abstract class AuthRepository {
  Future<Result<AuthenticationEntity, Failure>> login(String email, String password);
  Future<Result<UserEntity, Failure>> getProfile();
}

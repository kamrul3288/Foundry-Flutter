import 'package:clean_architecture_bloc/src/common/result/failure.dart';
import 'package:clean_architecture_bloc/src/common/result/result.dart';
import 'package:clean_architecture_bloc/src/domain/entity/authentication_entity.dart';
import 'package:clean_architecture_bloc/src/domain/repository/auth_repository.dart';
import 'package:clean_architecture_bloc/src/domain/usecase/base_usecase.dart';

class LoginUseCase extends RemoteUseCase<AuthenticationEntity, LoginParams> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Result<AuthenticationEntity, Failure>> call(LoginParams params) async {
    final result = await _repository.login(params.email, params.password);
    if (result.isSuccess) {}
    return result;
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}

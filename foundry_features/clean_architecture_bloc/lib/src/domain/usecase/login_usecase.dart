import 'package:clean_architecture_bloc/src/common/result/failure.dart';
import 'package:clean_architecture_bloc/src/common/result/result.dart';
import 'package:clean_architecture_bloc/src/domain/entity/authentication_entity.dart';
import 'package:clean_architecture_bloc/src/domain/repository/auth_repository.dart';
import 'package:clean_architecture_bloc/src/domain/usecase/base_usecase.dart';
import 'package:clean_architecture_bloc/src/local_storage/auth/auth_token_storage.dart';

class LoginUseCase extends RemoteUseCase<AuthenticationEntity, LoginParams> {
  final AuthRepository _repository;
  final AuthTokenStorage _authTokenStorage;

  LoginUseCase(this._repository, this._authTokenStorage);

  @override
  Future<Result<AuthenticationEntity, Failure>> call(LoginParams params) async {
    final result = await _repository.login(params.email, params.password);
    return result.when(
      success: (data) async {
        await _authTokenStorage.saveToken(accessToken: data.token, refreshToken: data.token);
        return SuccessResult(data);
      },
      failure: (failure) => FailureResult(failure),
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}

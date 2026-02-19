import 'package:clean_architecture_bloc/src/data/client/rest_client.dart';
import 'package:clean_architecture_bloc/src/data/client/rest_client_executor.dart';
import 'package:clean_architecture_bloc/src/data/dto/authentication_dto.dart';
import 'package:clean_architecture_bloc/src/data/dto/user_dto.dart';
import 'package:clean_architecture_bloc/src/data/mapper/authentication_dto_mapper.dart';
import 'package:clean_architecture_bloc/src/data/mapper/user_dto_mapper.dart';
import 'package:clean_architecture_bloc/src/domain/entity/authentication_entity.dart';
import 'package:clean_architecture_bloc/src/domain/entity/user_entity.dart';
import 'package:clean_architecture_bloc/src/domain/repository/auth_repository.dart';
import 'package:clean_architecture_bloc/src/domain/utils/result.dart';

final class AuthRepoImpl extends AuthRepository with RestClientExecutor {
  final RestClient _restClient;
  AuthRepoImpl(this._restClient);

  @override
  Future<Result<AuthenticationEntity>> login(String phone, String password) {
    return execute(() async {
      final response = await _restClient.post(
        '/login',
        data: {'phone': phone, 'password': password},
      );
      return AuthenticationDto.fromJson(response).toAuthenticationEntity;
    });
  }

  @override
  Future<Result<UserEntity>> getProfile() {
    return execute(() async {
      final response = await _restClient.get('/profile');
      return UserDto.fromJson(response).toUserEntity;
    });
  }
}

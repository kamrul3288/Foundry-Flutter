import 'dart:convert';
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
import 'package:flutter/services.dart';

final class AuthRepoImpl extends AuthRepository with RestClientExecutor {
  // ignore: unused_field
  final RestClient _restClient;
  AuthRepoImpl(this._restClient);

  @override
  Future<Result<AuthenticationEntity>> login(String phone, String password) {
    return execute(() async {
      await Future.delayed(const Duration(seconds: 3));
      final jsonString = await rootBundle.loadString('assets/mock/login.json');
      final response = jsonDecode(jsonString);
      return AuthenticationDto.fromJson(response).toAuthenticationEntity;
    });
  }

  @override
  Future<Result<UserEntity>> getProfile() {
    return execute(() async {
      await Future.delayed(const Duration(seconds: 3));
      final jsonString = await rootBundle.loadString('assets/mock/profile.json');
      final response = jsonDecode(jsonString);
      return UserDto.fromJson(response).toUserEntity;
    });
  }
}

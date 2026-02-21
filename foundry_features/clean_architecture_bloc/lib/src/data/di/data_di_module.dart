import 'package:clean_architecture_bloc/src/data/client/dio_factory.dart';
import 'package:clean_architecture_bloc/src/data/client/rest_client.dart';
import 'package:clean_architecture_bloc/src/data/datasource/auth_repo_impl.dart';
import 'package:clean_architecture_bloc/src/data/datasource/post_repo_impl.dart';
import 'package:clean_architecture_bloc/src/domain/repository/auth_repository.dart';
import 'package:clean_architecture_bloc/src/domain/repository/post_repository.dart';
import 'package:clean_architecture_bloc/src/secure_storage/auth_token_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> registerDataDiModule(GetIt locator) async {
  //Registering Dio & providing Dio
  locator.registerSingleton<Dio>(DioFactory.create(locator<AuthTokenRepository>()));

  //Registering RestClient & providing RestClient
  locator.registerSingleton<RestClient>(RestClient(locator<Dio>()));

  //Registering AuthRepository & providing AuthRepoImpl
  locator.registerSingleton<AuthRepository>(AuthRepoImpl(locator<RestClient>()));

  //Registering PostRepository & providing PostRepoImpl
  locator.registerSingleton<PostRepository>(PostRepoImpl(locator<RestClient>()));
}

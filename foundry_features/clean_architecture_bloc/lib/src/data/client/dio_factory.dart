import 'package:clean_architecture_bloc/src/data/interceptor/retry_interceptor.dart';
import 'package:clean_architecture_bloc/src/data/interceptor/token_refresh_interceptor.dart';
import 'package:clean_architecture_bloc/src/env/env.dart';
import 'package:clean_architecture_bloc/src/local_storage/auth/auth_token_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

final class DioFactory {
  static Dio create(AuthTokenStorage authTokenStorage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: Env().baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, error: true));
    }

    //adding Retry Interceptor
    dio.interceptors.add(RetryInterceptor(dio: dio));

    //adding Token Refresh Interceptor
    dio.interceptors.add(TokenRefreshInterceptor(dio: dio, authTokenStorage: authTokenStorage));
    return dio;
  }
}

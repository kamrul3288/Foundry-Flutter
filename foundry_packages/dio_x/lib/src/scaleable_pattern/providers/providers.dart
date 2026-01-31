import 'package:dio/dio.dart';
import 'package:dio_x/src/scaleable_pattern/client/api_services.dart';
import 'package:dio_x/src/scaleable_pattern/client/rest_client.dart';
import 'package:dio_x/src/scaleable_pattern/client/retry_interceptor.dart';
import 'package:dio_x/src/scaleable_pattern/client/token_refresh_interceptor.dart';
import 'package:dio_x/src/scaleable_pattern/localstorage/token_storage.dart';
import 'package:dio_x/src/scaleable_pattern/localstorage/token_storage_impl.dart';
import 'package:dio_x/src/scaleable_pattern/post_controller.dart';
import 'package:dio_x/src/scaleable_pattern/repostory/post_repostiry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// 1. Scheure Storage Provider
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) => FlutterSecureStorage());

// 2. Token Storage Provider
final tokenStorageProvider = Provider<TokenStorage>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return TokenStorageImpl(secureStorage);
});

//3. Dio Instance Provider
final dioProvider = Provider.family<Dio, ApiServices>((ref, apiService) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: apiService.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
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
  dio.interceptors.add(TokenRefreshInterceptor(dio: dio, tokenStorage: tokenStorage));

  return dio;
});

//4. Api Client Provider
final restClientProvider = Provider.family<RestClient, ApiServices>((ref, apiService) {
  final dio = ref.watch(dioProvider(apiService));
  return RestClient(dio);
});

//5. Post Repository Provider
final postRepositoryProvider = Provider<PostRepository>((ref) {
  final restClient = ref.watch(restClientProvider(ApiServices.app));
  return PostRepository(restClient);
});

//6. Post Controller Provider
final postControllerProvider = NotifierProvider.autoDispose<PostController, PostState>(() {
  return PostController();
});

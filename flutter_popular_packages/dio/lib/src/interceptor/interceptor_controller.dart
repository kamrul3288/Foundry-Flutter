// ১। টোকেন সেভ করার জন্য আমারা একটি স্টোরেজ(flutter_secure_storage) ক্লাস ব্যবহার করবো
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore: library_private_types_in_public_api
abstract class _TokenStorage {
  Future<void> saveTokens({required String accessToken, required String refreshToken});
  Future<void> deleteToken();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
}

//২। এখন আমরা একটি টকেন স্টোরেজ এর ইমপ্লিমেন্টেশন ক্লাস তৈরি করবো
class _TokenStorageImpl implements _TokenStorage {
  final FlutterSecureStorage _storage;
  _TokenStorageImpl(this._storage);
  @override
  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: 'access_token');
  }

  @override
  Future<String?> getAccessToken() async {
    final token = await _storage.read(key: 'access_token');
    return token;
  }

  @override
  Future<String?> getRefreshToken() async {
    final token = await _storage.read(key: 'refresh_token');
    return token;
  }
}

//৩। এখন আমরা flutter_secure_storage এর dependency injection করবো
final _secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return FlutterSecureStorage();
});

//৪। এখন আমরা টোকেন স্টোরেজ এর dependency injection করবো
final _tokenStorageProvider = Provider<_TokenStorage>((ref) {
  return _TokenStorageImpl(ref.watch(_secureStorageProvider));
});

//৫। এখন আমরা AuthInterceptor তৈরি করবো
class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final _TokenStorage _tokenStorage;
  AuthInterceptor(this._dio, this._tokenStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // কমন হেডার বা ল্যাঙ্গুয়েজ সেট করা
    options.headers['Accept'] = 'application/json';

    // ১. রিকোয়েস্টের আগে টোকেন অ্যাড করা
    // লগইন বা রিফ্রেশ এপিআই-তে টোকেন দরকার নেই, তাই চেক করে নিচ্ছি
    if (options.path.contains('login') || options.path.contains('refresh-token')) {
      return handler.next(options);
    }

    final token = await _tokenStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ২. রেসপন্স আসার পর
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // ৩. এরর হ্যান্ডলিং
    // রিয়েল লাইফ সিনারিও: টোকেন এক্সপায়ার (401) হলে রিফ্রেশ করা
    if (err.response?.statusCode == 401) {
      // ইনফিনিট লুপ আটকানো: যদি রিফ্রেশ টোকেন রিকোয়েস্টটাই ফেইল করে, তাহলে আর ট্রাই করব না
      if (err.requestOptions.path.contains('refresh-token')) {
        return handler.next(err);
      }

      // টোকেন রিফ্রেশ করার চেষ্টা
      try {
        final newTokens = await _refreshToken();
        if (newTokens != null) {
          //নতুন টোকেন সেভ করা
          await _tokenStorage.saveTokens(
            accessToken: newTokens['accessToken'],
            refreshToken: newTokens['refreshToken'],
          );
          //ফেইল হওয়া রিকোয়েস্টটি নতুন টোকেন দিয়ে আপডেট করা
          err.requestOptions.headers['Authorization'] = 'Bearer ${newTokens['accessToken']}';
          //রিকোয়েস্টটি আবার পাঠানো (Retry)
          final response = await _dio.fetch(err.requestOptions);
          //অরিজিনাল ফেইল হওয়া রিকোয়েস্টের বদলে এই সফল রেসপন্সটি রিটার্ন করা
          return handler.resolve(response);
        }
      } catch (e) {
        // রিফ্রেশ করতে গিয়েও যদি এরর হয়, ইউজারকে লগআউট করিয়ে দিন
        await _tokenStorage.deleteToken();
        return handler.next(err);
      }
    }
    // অন্য কোনো এরর হলে স্বাভাবিকভাবে পাস করে দেওয়া
    return handler.next(err);
  }

  // টোকেন রিফ্রেশ করার মেথড
  Future<Map<String, dynamic>?> _refreshToken() async {
    try {
      final refreshToken = await _tokenStorage.getRefreshToken();
      final tokenDio = Dio(BaseOptions(baseUrl: "http://jsonplaceholder.typicode.com"));
      final response = await tokenDio.post(
        '/auth/refresh-token',
        data: {
          'refreshToken': refreshToken,
        },
      );
      if (response.statusCode == 200) {
        // সার্ভার থেকে আসা নতুন টোকেন
        return response.data['accessToken'];
      }
    } catch (e) {
      debugPrint("Refresh Token Failed: $e");
    }
    return null;
  }
}

// ৬। এখন আমরা DioClient তৈরি করবো
class DioClient {
  final Dio _dio;
  final _TokenStorage _tokenStorage;

  DioClient(this._dio, this._tokenStorage) {
    _dio.options = BaseOptions(
      baseUrl: "http://jsonplaceholder.typicode.com",
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    // আমাদের Custom Interceptor টি এখানে অ্যাড করলাম
    // লক্ষ্য করুন: আমরা 'this._dio' পাস করছি যাতে ইন্টারসেপ্টর নিজেই রিকোয়েস্ট রি-ট্রাই করতে পারে
    _dio.interceptors.add(AuthInterceptor(_dio, _tokenStorage));

    // ডিবাগিং এর জন্য লগ
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Dio get dio => _dio;
}

// ৭। এখন আমরা Dio এর dependency injection করবো
final _dioProvider = Provider<Dio>((ref) {
  return Dio();
});

// ৮। এখন আমরা DioClient এর dependency injection করবো
final _dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(_dioProvider);
  final tokenStorage = ref.watch(_tokenStorageProvider);
  return DioClient(dio, tokenStorage);
});

//9. এখন আমরা একটি API কল করবো
final postsProvider = FutureProvider.autoDispose<dynamic>((ref) async {
  final dioClient = ref.watch(_dioClientProvider);
  final response = await dioClient.dio.get('/posts/1');
  return response.data;
});

import 'package:dio/dio.dart';
import 'package:dio_x/src/scaleable_pattern/localstorage/token_storage.dart';
import 'package:dio_x/src/scaleable_pattern/model/request_queue_item.dart';

final class TokenRefreshInterceptor extends Interceptor {
  final Dio _dio;
  final TokenStorage _tokenStorage;

  // Concurrency বা Race Condition আটকানোর জন্য ফ্ল্যাগ
  bool _isRefreshing = false;
  //Pending requests queue when token is refresh is ongoing
  final List<RequestQueueItem> _requestQueue = [];

  TokenRefreshInterceptor({
    required Dio dio,
    required TokenStorage tokenStorage,
  }) : _dio = dio,
       _tokenStorage = tokenStorage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (_isWhitelisted(options.path)) {
      return handler.next(options);
    }
    final token = await _tokenStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final options = err.requestOptions;

      //If refresh token is expired or failed then logout the user
      if (options.path.contains('refresh-token')) {
        await _tokenStorage.deleteTokens();
        _requestQueue.clear();
        return handler.next(err);
      }

      // Add the request to the queue
      _requestQueue.add(RequestQueueItem(options, handler));

      // If already refreshing, then add the request to the queue and return
      if (_isRefreshing) {
        return;
      }

      _isRefreshing = true;
      try {
        final newTokens = await _refreshToken();
        if (newTokens != null) {
          await _tokenStorage.saveToken(
            accessToken: newTokens['accessToken'],
            refreshToken: newTokens['refreshToken'],
          );
          _processQueue(newTokens['accessToken']);
        } else {
          _rejectQueue(err);
          await _tokenStorage.deleteTokens();
        }
      } catch (e) {
        _rejectQueue(err);
        await _tokenStorage.deleteTokens();
      } finally {
        _isRefreshing = false;
      }
    }
    return handler.next(err);
  }

  void _processQueue(String? newToken) {
    for (final item in _requestQueue) {
      item.options.headers['Authorization'] = 'Bearer $newToken';
      _dio
          .fetch(item.options)
          .then((response) => item.handler.resolve(response))
          .catchError((e) => item.handler.reject(e as DioException));
    }
    _requestQueue.clear();
    _isRefreshing = false;
  }

  void _rejectQueue(DioException err) {
    for (var item in _requestQueue) {
      item.handler.next(err);
    }
    _requestQueue.clear();
  }

  Future<Map<String, dynamic>?> _refreshToken() async {
    try {
      final refreshToken = await _tokenStorage.getRefreshToken();
      if (refreshToken == null) return null;

      // Separate Dio instance to avoid infinite loops
      final tokenDio = Dio(BaseOptions(baseUrl: "https://api.example.com"));

      final response = await tokenDio.post(
        '/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );
      if (response.statusCode == 200) {
        return {
          'accessToken': response.data['accessToken'],
          'refreshToken': response.data['refreshToken'] ?? refreshToken,
        };
      }
      // ignore: empty_catches
    } catch (e) {}
    return null;
  }

  bool _isWhitelisted(String path) {
    return path.contains('login') || path.contains('refresh-token') || path.contains('register');
  }
}

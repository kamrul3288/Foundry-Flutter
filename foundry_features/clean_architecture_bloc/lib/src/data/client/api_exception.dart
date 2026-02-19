import 'package:dio/dio.dart';

final class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => message;

  factory ApiException.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
        return ApiException(
          message: 'Connection timeout, please try again!',
          statusCode: dioException.response?.statusCode,
        );

      case DioExceptionType.badCertificate:
        return ApiException(
          message: 'Bad certificate, please try again!',
          statusCode: dioException.response?.statusCode,
        );

      case DioExceptionType.cancel:
        return ApiException(
          message: 'Request cancelled, please try again!',
          statusCode: dioException.response?.statusCode,
        );

      case DioExceptionType.connectionError:
        return ApiException(
          message: 'No internet connection. Please check your network.',
          statusCode: dioException.response?.statusCode,
        );

      case DioExceptionType.unknown:
        return ApiException(
          message: 'Something went wrong, please try again!',
          statusCode: dioException.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        return _handleError(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
    }
  }

  static ApiException _handleError(int? statusCode, dynamic errorData) {
    String message = "Oops! Something went wrong";

    if (errorData is Map<String, dynamic>) {
      message = errorData['message'] ?? message;
    } else if (errorData is String) {
      message = errorData;
    }
    return ApiException(message: message, statusCode: statusCode);
  }
}

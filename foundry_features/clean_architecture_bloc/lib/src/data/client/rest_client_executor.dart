import 'package:clean_architecture_bloc/src/common/enum/app_locale_key.dart';
import 'package:clean_architecture_bloc/src/common/result/failure.dart';
import 'package:clean_architecture_bloc/src/common/result/result.dart';
import 'package:dio/dio.dart';

mixin RestClientExecutor {
  Future<Result<T, Failure>> execute<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return SuccessResult(response);
    } on DioException catch (e) {
      return FailureResult(_mapDioExceptionToFailure(e));
    } on TypeError catch (e) {
      // if the json data type is not correct
      return FailureResult(ParseFailure(AppLocaleKey.unknownError, e.toString()));
    } on FormatException catch (e) {
      // if the json format is not correct
      return FailureResult(ParseFailure(AppLocaleKey.unknownError, e.toString()));
    } catch (e) {
      return FailureResult(UnknownFailure(AppLocaleKey.unknownError, null));
    }
  }

  // --- ERROR MAPPER (Generics Preserved) ---
  Failure _mapDioExceptionToFailure(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
        return NetworkFailure(AppLocaleKey.connectionTimeout, dioException.response?.statusCode);

      case DioExceptionType.connectionError:
        return NetworkFailure(AppLocaleKey.noInternet, dioException.response?.statusCode);

      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        return UnknownFailure(AppLocaleKey.unknownError, dioException.response?.statusCode);

      case DioExceptionType.badResponse:
        return _handleServerError(dioException.response?.statusCode, dioException.response?.data);
    }
  }

  Failure _handleServerError(int? statusCode, dynamic errorData) {
    String message = "Oops! Something went wrong";
    if (errorData is Map<String, dynamic>) {
      message = errorData['message'] ?? message;
    } else if (errorData is String) {
      message = errorData;
    }
    return ServerFailure(message, statusCode);
  }
}

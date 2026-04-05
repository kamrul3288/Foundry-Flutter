import 'api_exception.dart';
import '../model/result.dart';

mixin ApiSafeWrapper {
  /// This generic function takes an async API call (Function) as a parameter.
  Future<Result<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return Success(response);
    } on ApiException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(ApiException(message: "Opps! Unknown Error, Please try again later. $e"));
    }
  }
}

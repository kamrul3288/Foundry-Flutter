import 'package:clean_architecture_bloc/src/data/client/api_exception.dart';
import 'package:clean_architecture_bloc/src/domain/utils/result.dart';

mixin RestClientExecutor {
  /// This generic function takes an async API call (Function) as a parameter.
  Future<Result<T>> execute<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return Success(response);
    } on ApiException catch (e) {
      return Failure(e.message, e.statusCode);
    } catch (e) {
      return Failure("Opps! Unknown Error, Please try again later. $e", null);
    }
  }
}

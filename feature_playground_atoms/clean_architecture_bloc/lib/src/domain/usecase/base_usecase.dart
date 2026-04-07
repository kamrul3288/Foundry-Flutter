import '../../common/result/failure.dart';
import '../../common/result/result.dart';

/// Remote use case with parameters.
/// [Params] - the input parameter type.
/// [S] - the success return type.
///
/// For local database use cases, create separate base classes
/// (e.g. `LocalUseCase`, `LocalUseCaseNoParams`).
abstract class RemoteUseCase<S, Params> {
  Future<Result<S, Failure>> call(Params params);
}

/// Remote use case without parameters.
/// [S] - the success return type.
abstract class RemoteUseCaseNoParams<S> {
  Future<Result<S, Failure>> call();
}

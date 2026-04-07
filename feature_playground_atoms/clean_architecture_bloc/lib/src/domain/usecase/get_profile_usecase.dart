import '../../common/result/failure.dart';
import '../../common/result/result.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';
import 'base_usecase.dart';

class GetProfileUseCase extends RemoteUseCaseNoParams<UserEntity> {
  final AuthRepository _repository;

  GetProfileUseCase(this._repository);

  @override
  Future<Result<UserEntity, Failure>> call() {
    return _repository.getProfile();
  }
}

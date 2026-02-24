import 'package:clean_architecture_bloc/src/common/result/failure.dart';
import 'package:clean_architecture_bloc/src/common/result/result.dart';
import 'package:clean_architecture_bloc/src/domain/entity/user_entity.dart';
import 'package:clean_architecture_bloc/src/domain/repository/auth_repository.dart';
import 'package:clean_architecture_bloc/src/domain/usecase/base_usecase.dart';

class GetProfileUseCase extends RemoteUseCaseNoParams<UserEntity> {
  final AuthRepository _repository;

  GetProfileUseCase(this._repository);

  @override
  Future<Result<UserEntity, Failure>> call() {
    return _repository.getProfile();
  }
}

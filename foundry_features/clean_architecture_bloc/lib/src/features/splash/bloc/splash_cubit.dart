import 'package:clean_architecture_bloc/src/common/result/failure.dart';
import 'package:clean_architecture_bloc/src/domain/usecase/get_profile_usecase.dart';
import 'package:clean_architecture_bloc/src/secure_storage/repository/auth_token_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthTokenRepository _authTokenRepository;
  final GetProfileUseCase _getProfileUseCase;
  SplashCubit(this._authTokenRepository, this._getProfileUseCase) : super(SplashState());

  void checkUserAhrorization() async {
    final isAuthorized = await _authTokenRepository.isUserAuthorized();

    if (isAuthorized) {
      fetchUserProfile();
    } else {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(uiEvent: SplashUiEvent.unauthorized));
    }
  }

  void fetchUserProfile() async {
    emit(state.copyWith(uiState: SplashUiState.loading, clearEvent: true));
    final result = await _getProfileUseCase();
    result.when(
      success: (user) => emit(state.copyWith(uiEvent: SplashUiEvent.authorized)),
      failure: (failure) => emit(state.copyWith(uiState: SplashUiState.error, failure: failure)),
    );
  }
}

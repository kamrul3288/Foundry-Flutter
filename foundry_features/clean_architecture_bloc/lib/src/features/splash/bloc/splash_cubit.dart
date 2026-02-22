import 'package:clean_architecture_bloc/src/domain/repository/auth_repository.dart';
import 'package:clean_architecture_bloc/src/secure_storage/auth_token_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthTokenRepository _authTokenRepository;
  final AuthRepository _authRepository;
  SplashCubit(this._authTokenRepository, this._authRepository) : super(SplashState());

  void checkUserAhrorization() async {
    final isAuthorized = await _authTokenRepository.isUserAuthorized();

    if (isAuthorized) {
      fetchUserProfile();
    } else {
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashState(uiEvent: SplashUiEvent.unauthorized));
    }
  }

  void fetchUserProfile() async {
    emit(state.copyWith(uiState: SplashUiState.loading, clearEvent: true));
    final result = await _authRepository.getProfile();
    result.when(
      success: (user) => emit(state.copyWith(uiEvent: SplashUiEvent.authorized)),
      failure: (message, code) => emit(state.copyWith(uiState: SplashUiState.error, errorMessage: message)),
    );
  }
}

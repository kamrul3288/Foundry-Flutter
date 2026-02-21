part of 'splash_cubit.dart';

final class SplashState extends Equatable {
  final SplashUiState uiState;
  final SplashUiEvent? uiEvent;
  final String? errorMessage;

  const SplashState({
    this.uiState = SplashUiState.initial,
    this.uiEvent,
    this.errorMessage,
  });

  SplashState copyWith({
    SplashUiState? uiState,
    SplashUiEvent? uiEvent,
    bool clearEvent = false,
    String? errorMessage,
  }) {
    return SplashState(
      uiState: uiState ?? this.uiState,
      uiEvent: clearEvent ? null : (uiEvent ?? this.uiEvent),
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [uiState, uiEvent, errorMessage];
}

enum SplashUiState { initial, loading, error }

enum SplashUiEvent { authorized, unauthorized }

part of 'splash_cubit.dart';

final class SplashState extends Equatable {
  final SplashUiState uiState;
  final SplashUiEvent? uiEvent;
  final Failure? failure;

  const SplashState({
    this.uiState = SplashUiState.initial,
    this.uiEvent,
    this.failure,
  });

  SplashState copyWith({
    SplashUiState? uiState,
    SplashUiEvent? uiEvent,
    bool clearEvent = false,
    Failure? failure,
  }) {
    return SplashState(
      uiState: uiState ?? this.uiState,
      uiEvent: clearEvent ? null : (uiEvent ?? this.uiEvent),
      failure: failure,
    );
  }

  @override
  List<Object?> get props => [uiState, uiEvent, failure];
}

enum SplashUiState { initial, loading, error }

enum SplashUiEvent { authorized, unauthorized }

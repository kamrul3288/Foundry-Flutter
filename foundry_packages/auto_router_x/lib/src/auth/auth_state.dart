part of 'auth_cubit.dart';


class AuthState {
  final AuthStatus status;
  const AuthState(this.status);

  bool get isAuthed => status == AuthStatus.authenticated;
}

enum AuthStatus { unknown, authenticated, unauthenticated }


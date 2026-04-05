import 'auth_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthConfig? _authConfig;

  AuthCubit() : super(AuthState(AuthStatus.unknown));

  AuthConfig? get authConfig => _authConfig;

  void logIn() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthState(AuthStatus.authenticated));
  }

  void logout() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthState(AuthStatus.unauthenticated));
  }

  void setAuthConfig(AuthConfig authConfig) {
    _authConfig = authConfig;
  }

  void clearAuthConfig() {
    _authConfig = null;
  }

}

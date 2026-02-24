import 'package:clean_architecture_bloc/src/common/input/email_input.dart';
import 'package:clean_architecture_bloc/src/common/input/password_input.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void onEmailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(state.copyWith(password: password));
  }

  void onLoginPressed() {
    final email = EmailInput.dirty(state.email.value);
    final password = PasswordInput.dirty(state.password.value);

    emit(state.copyWith(email: email, password: password));
    if (!state.isValid) return;
  }
}

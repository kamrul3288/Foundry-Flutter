import 'package:clean_architecture_bloc/src/common/input/email_input.dart';
import 'package:clean_architecture_bloc/src/common/input/password_input.dart';
import 'package:clean_architecture_bloc/src/common/result/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:clean_architecture_bloc/src/domain/usecase/login_usecase.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase) : super(const LoginState());

  void onEmailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(state.copyWith(password: password));
  }

  void onLoginPressed() async {
    final email = EmailInput.dirty(state.email.value);
    final password = PasswordInput.dirty(state.password.value);

    emit(state.copyWith(email: email, password: password));
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await _loginUseCase.call(LoginParams(email: email.value, password: password.value));
    result.when(
      success: (data) => emit(state.copyWith(status: FormzSubmissionStatus.success)),
      failure: (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, failure: failure)),
    );
  }
}

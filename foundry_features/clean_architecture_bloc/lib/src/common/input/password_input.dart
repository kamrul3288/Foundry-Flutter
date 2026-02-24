import 'package:clean_architecture_bloc/src/common/enum/app_locale_key.dart';
import 'package:formz/formz.dart';

class PasswordInput extends FormzInput<String, AppLocaleKey> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  AppLocaleKey? validator(String value) {
    if (value.isEmpty) return AppLocaleKey.errorEmptyInput;
    if (value.length < 6) return AppLocaleKey.errorInvalidPassword;
    return null;
  }
}

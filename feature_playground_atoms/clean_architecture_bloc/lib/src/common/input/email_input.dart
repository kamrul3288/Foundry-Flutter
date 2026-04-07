import 'package:clean_architecture_bloc/src/common/enum/app_locale_key.dart';
import 'package:formz/formz.dart';

class EmailInput extends FormzInput<String, AppLocaleKey> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  AppLocaleKey? validator(String value) {
    if (value.isEmpty) return AppLocaleKey.errorEmptyInput;
    if (!_emailRegex.hasMatch(value)) return AppLocaleKey.errorInvalidEmail;
    return null;
  }
}

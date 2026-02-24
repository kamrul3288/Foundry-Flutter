import 'package:clean_architecture_bloc/src/common/enum/app_locale_key.dart';
import 'package:clean_architecture_bloc/src/locale/l10n/generated/app_locale.dart';
import 'package:flutter/material.dart';

extension AppLocaleKeyExtension on AppLocaleKey {
  String locale(BuildContext context, {List<String>? args}) {
    final l10n = AppLocale.of(context);
    if (l10n == null) {
      return '';
    }
    return switch (this) {
      AppLocaleKey.noInternet => l10n.message_no_internet,
      AppLocaleKey.connectionTimeout => l10n.message_connection_timeout,
      AppLocaleKey.unknownError => l10n.message_unknown_error,
      AppLocaleKey.somethingWentWrong => l10n.message_something_went_wrong,
      AppLocaleKey.errorEmptyInput => l10n.error_empty_input(args?[0] ?? ''),
      AppLocaleKey.errorInvalidEmail => l10n.error_invalid_email,
      AppLocaleKey.errorInvalidPassword => l10n.error_invalid_password,
    };
  }
}

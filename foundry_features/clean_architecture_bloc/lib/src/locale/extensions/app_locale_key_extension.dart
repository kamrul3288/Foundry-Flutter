import 'package:clean_architecture_bloc/src/locale/constant/app_locale_key.dart';
import 'package:clean_architecture_bloc/src/locale/l10n/generated/app_locale.dart';
import 'package:flutter/material.dart';

extension AppLocaleKeyExtension on AppLocaleKey {
  String locale(BuildContext context) {
    final l10n = AppLocale.of(context);
    if (l10n == null) {
      return '';
    }
    return switch (this) {
      AppLocaleKey.noInternet => l10n.message_no_internet,
      AppLocaleKey.connectionTimeout => l10n.message_connection_timeout,
      AppLocaleKey.unknowError => l10n.message_unknown_error,
      AppLocaleKey.somethingWentWrong => l10n.message_something_went_wrong,
    };
  }
}

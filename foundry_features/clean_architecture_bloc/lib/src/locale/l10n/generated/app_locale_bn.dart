// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_locale.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocaleBn extends AppLocale {
  AppLocaleBn([String locale = 'bn']) : super(locale);

  @override
  String get message_no_internet =>
      'Seems like you\'re offline, please check your connection and try again.';

  @override
  String get message_connection_timeout =>
      'Connection timeout, please try again later.';

  @override
  String get message_unknown_error =>
      'An unknown error occurred, please try again later.';

  @override
  String get message_something_went_wrong =>
      'Something went wrong, please try again later.';

  @override
  String get title_welcome_back => 'Welcome back';

  @override
  String get message_signin => 'Please sign in to continue';

  @override
  String get hint_email => 'Email';

  @override
  String get hint_password => 'Password';

  @override
  String get button_signin => 'Sign in';

  @override
  String get button_forgot_password => 'Forgot password?';
}

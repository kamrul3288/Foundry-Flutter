// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_locale.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocaleBn extends AppLocale {
  AppLocaleBn([String locale = 'bn']) : super(locale);

  @override
  String get message_no_internet =>
      'মনে হচ্ছে আপনি অফলাইনে আছেন, দয়া করে আপনার কানেকশন চেক করুন এবং আবার চেষ্টা করুন।';

  @override
  String get message_connection_timeout =>
      'কানেকশন টাইমআউট, দয়া করে পরে আবার চেষ্টা করুন।';

  @override
  String get message_unknown_error =>
      'একটি অজানা ত্রুটি ঘটেছে, দয়া করে পরে আবার চেষ্টা করুন।';

  @override
  String get message_something_went_wrong =>
      'কিছু একটা ভুল হয়েছে, দয়া করে পরে আবার চেষ্টা করুন।';

  @override
  String get title_welcome_back => 'স্বাগতম';

  @override
  String get message_signin => 'এগিয়ে যেতে দয়া করে সাইন ইন করুন';

  @override
  String get hint_email => 'ইমেইল';

  @override
  String get hint_password => 'পাসওয়ার্ড';

  @override
  String get button_signin => 'সাইন ইন';

  @override
  String get button_forgot_password => 'পাসওয়ার্ড ভুলে গেছেন?';

  @override
  String error_empty_input(Object fieldName) {
    return '$fieldName খালি রাখা যাবে না';
  }

  @override
  String get error_invalid_email => 'অবৈধ ইমেইল ঠিকানা';

  @override
  String get error_invalid_password => 'পাসওয়ার্ড কমপক্ষে ৬ অক্ষরের হতে হবে';
}

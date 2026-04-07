import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_locale_bn.dart';
import 'app_locale_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocale
/// returned by `AppLocale.of(context)`.
///
/// Applications need to include `AppLocale.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_locale.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocale.localizationsDelegates,
///   supportedLocales: AppLocale.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocale.supportedLocales
/// property.
abstract class AppLocale {
  AppLocale(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocale? of(BuildContext context) {
    return Localizations.of<AppLocale>(context, AppLocale);
  }

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocaleDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
  ];

  /// Error message shown when the user has no active internet connection
  ///
  /// In en, this message translates to:
  /// **'Seems like you\'re offline, please check your connection and try again.'**
  String get message_no_internet;

  /// No description provided for @message_connection_timeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout, please try again later.'**
  String get message_connection_timeout;

  /// No description provided for @message_unknown_error.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred, please try again later.'**
  String get message_unknown_error;

  /// No description provided for @message_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again later.'**
  String get message_something_went_wrong;

  /// No description provided for @title_welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get title_welcome_back;

  /// No description provided for @message_signin.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to continue'**
  String get message_signin;

  /// No description provided for @hint_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get hint_email;

  /// No description provided for @hint_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get hint_password;

  /// No description provided for @button_signin.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get button_signin;

  /// No description provided for @button_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get button_forgot_password;

  /// No description provided for @error_empty_input.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} cannot be empty'**
  String error_empty_input(Object fieldName);

  /// No description provided for @error_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get error_invalid_email;

  /// No description provided for @error_invalid_password.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long'**
  String get error_invalid_password;

  /// No description provided for @title_posts.
  ///
  /// In en, this message translates to:
  /// **'Recent Posts'**
  String get title_posts;

  /// No description provided for @title_connection_error.
  ///
  /// In en, this message translates to:
  /// **'Connection Error'**
  String get title_connection_error;

  /// No description provided for @button_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get button_retry;
}

class _AppLocaleDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocaleDelegate();

  @override
  Future<AppLocale> load(Locale locale) {
    return SynchronousFuture<AppLocale>(lookupAppLocale(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocaleDelegate old) => false;
}

AppLocale lookupAppLocale(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocaleBn();
    case 'en':
      return AppLocaleEn();
  }

  throw FlutterError(
    'AppLocale.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

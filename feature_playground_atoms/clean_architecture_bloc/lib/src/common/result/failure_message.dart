import '../enum/app_locale_key.dart';

sealed class FailureMessage {
  const FailureMessage();
}

class LocaleKeyMessage extends FailureMessage {
  final AppLocaleKey key;
  const LocaleKeyMessage(this.key);
}

class RawStringMessage extends FailureMessage {
  final String value;
  const RawStringMessage(this.value);
}

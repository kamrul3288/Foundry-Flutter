import 'package:clean_architecture_bloc/src/common/result/failure.dart';
import 'package:clean_architecture_bloc/src/common/result/failure_message.dart';
import 'package:clean_architecture_bloc/src/locale/extensions/app_locale_key_extension.dart';
import 'package:flutter/material.dart';

extension FailureResolver on Failure {
  String resolveMessage(BuildContext context) {
    return switch (message) {
      LocaleKeyMessage(:final key) => key.locale(context),
      RawStringMessage(:final value) => value,
    };
  }
}

extension FailureMessageResolver on FailureMessage {
  String resolveMessage(BuildContext context) {
    return switch (this) {
      LocaleKeyMessage(:final key) => key.locale(context),
      RawStringMessage(:final value) => value,
    };
  }
}

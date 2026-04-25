import 'package:flutter/material.dart';

class AppRadioClassicStateColors {
  final Color indicator;
  final Color label;
  final Color description;

  const AppRadioClassicStateColors({
    required this.indicator,
    required this.label,
    required this.description,
  });
}

class AppRadioClassicIntentColors {
  final AppRadioClassicStateColors unselected;
  final AppRadioClassicStateColors selected;
  final AppRadioClassicStateColors disabled;

  const AppRadioClassicIntentColors({
    required this.unselected,
    required this.selected,
    required this.disabled,
  });

  AppRadioClassicStateColors byState({
    required bool isSelected,
    required bool isDisabled,
  }) {
    if (isDisabled) return disabled;
    return isSelected ? selected : unselected;
  }
}

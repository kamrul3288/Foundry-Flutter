import 'package:flutter/material.dart';

/// Colors for the card radio variant. Cards have more visual elements
/// than simpler button radios: a check indicator, title, description,
/// and a thicker border when selected.
class AppRadioCardStateColors {
  final Color background;
  final Color border;
  final double borderWidth;
  final Color titleColor;
  final Color descriptionColor;
  final Color checkBackground;
  final Color checkBorder;
  final Color checkIcon;

  const AppRadioCardStateColors({
    required this.background,
    required this.border,
    required this.borderWidth,
    required this.titleColor,
    required this.descriptionColor,
    required this.checkBackground,
    required this.checkBorder,
    required this.checkIcon,
  });
}

class AppRadioCardStateSet {
  final AppRadioCardStateColors idle;
  final AppRadioCardStateColors selected;
  final AppRadioCardStateColors disabled;

  const AppRadioCardStateSet({
    required this.idle,
    required this.selected,
    required this.disabled,
  });

  AppRadioCardStateColors resolve({
    required bool isSelected,
    required bool isDisabled,
  }) {
    if (isDisabled) return disabled;
    return isSelected ? selected : idle;
  }
}

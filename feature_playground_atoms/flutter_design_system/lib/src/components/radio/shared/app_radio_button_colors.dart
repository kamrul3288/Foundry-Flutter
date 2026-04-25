import 'package:flutter/material.dart';

/// Colors for a single state of a button-style radio.
/// Every button-style radio (outline, filled, ghost, segmented, pill, card)
/// paints with exactly these four properties. Some variants ignore [border]
/// (ghost uses transparent) or [background] (outline unselected is
/// transparent), but the data shape is always the same.
class AppRadioBtnColors {
  final Color background;
  final Color foreground;
  final Color border;

  const AppRadioBtnColors({
    required this.background,
    required this.foreground,
    required this.border,
  });
}

/// The three interaction states every button-style radio needs.
/// [idle] is the unselected resting state.
/// [selected] is the active/chosen state.
/// [disabled] applies to both selected and unselected when the option
/// is not interactive — the widget handles dimming internally.
class AppRadioBtnStateSet {
  final AppRadioBtnColors idle;
  final AppRadioBtnColors selected;
  final AppRadioBtnColors disabled;

  const AppRadioBtnStateSet({
    required this.idle,
    required this.selected,
    required this.disabled,
  });

  AppRadioBtnColors resolve({
    required bool isSelected,
    required bool isDisabled,
  }) {
    if (isDisabled) return disabled;
    return isSelected ? selected : idle;
  }
}

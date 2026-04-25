import 'package:flutter/widgets.dart';

/// A single selectable option within any radio group variant.
/// [T] is the value type — typically a [String] or an enum.
/// [icon] is optional and only rendered by variants that support it
/// (outline, filled, ghost, card). Classic dot-in-circle radios ignore it.
class AppRadioOption<T> {
  final T value;
  final String label;
  final String? description;
  final Widget? icon;
  final bool enabled;

  const AppRadioOption({
    required this.value,
    required this.label,
    this.description,
    this.icon,
    this.enabled = true,
  });
}

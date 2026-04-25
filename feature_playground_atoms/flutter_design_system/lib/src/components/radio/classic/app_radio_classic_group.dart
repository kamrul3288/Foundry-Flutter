import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/radio/radio.dart';

class AppRadioClassicGroup<T> extends StatelessWidget {
  final List<AppRadioOption<T>> options;
  final T? value;
  final ValueChanged<T>? onChanged;
  final String? groupLabel;
  final bool enabled;
  final AppRadioIntent intent;
  final Axis direction;
  final double spacing;

  final IconData selectedIcon;
  final IconData unselectedIcon;
  final double indicatorSize;

  const AppRadioClassicGroup({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
    this.groupLabel,
    this.enabled = true,
    this.intent = AppRadioIntent.brand,
    this.direction = Axis.vertical,
    this.spacing = 4,
    this.selectedIcon = Icons.radio_button_checked,
    this.unselectedIcon = Icons.radio_button_unchecked,
    this.indicatorSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (groupLabel != null) ...[
          Text(
            groupLabel!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
        ],
        _buildOptions(),
      ],
    );
  }

  Widget _buildOptions() {
    final children = options.map((option) {
      return AppRadioClassic<T>(
        value: option.value,
        groupValue: value,
        onChanged: enabled && option.enabled ? onChanged : null,
        label: option.label,
        description: option.description,
        enabled: enabled && option.enabled,
        intent: intent,
        selectedIcon: selectedIcon,
        unselectedIcon: unselectedIcon,
        indicatorSize: indicatorSize,
      );
    }).toList();

    if (direction == Axis.horizontal) {
      return Wrap(spacing: spacing + 12, children: children);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < children.length; i++) ...[
          children[i],
          if (i < children.length - 1) SizedBox(height: spacing),
        ],
      ],
    );
  }
}
